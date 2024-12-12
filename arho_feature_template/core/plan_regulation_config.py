from __future__ import annotations

import logging
import os
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import TYPE_CHECKING, cast

import yaml
from qgis.utils import iface

from arho_feature_template.qgis_plugin_tools.tools.resources import resources_path
from arho_feature_template.utils.misc_utils import get_layer_by_name

if TYPE_CHECKING:
    from numbers import Number
    from typing import Literal

    from qgis.core import QgsFeature
    from qgis.gui import QgisInterface

    iface: QgisInterface = cast("QgisInterface", iface)  # type: ignore[no-redef]


logger = logging.getLogger(__name__)

DEFAULT_PLAN_REGULATIONS_CONFIG_PATH = Path(os.path.join(resources_path(), "kaavamaaraykset.yaml"))


class ConfigSyntaxError(Exception):
    def __init__(self, message: str):
        super().__init__(f"Invalid config syntax: {message}")


class UninitializedError(Exception):
    def __init__(self):
        super().__init__("PlanRegulationsSet is not initialized. Call 'initialize' first")


class ValueType(Enum):
    DECIMAL = "desimaali"
    POSITIVE_DECIMAL = "positiivinen desimaali"
    POSITIVE_INTEGER = "positiivinen kokonaisluku"
    POSITIVE_INTEGER_RANGE = "positiivinen kokonaisluku arvoväli"
    VERSIONED_TEXT = "kieliversioitu teksti"


# class Unit(Enum):
#     SQUARE_METERS = "k-m2"
#     CUBIC_METERS = "m3"
#     EFFICIENCY_RATIO = "k-m2/m2"
#     PERCENTAGE = "prosentti"
#     AREA_RATIO = "m2/k-m2"
#     DEGREES = "°"
#     DECIBEL = "dB"


def get_name_mapping_for_plan_regulations(layer_name: str) -> dict[str, dict[str, str]] | None:
    layer = get_layer_by_name(layer_name)
    if not layer:
        return None
    return {feature["value"]: feature["name"] for feature in layer.getFeatures()}


@dataclass
class PlanRegulationsSet:
    """Describes the set of plan regulations."""

    version: str
    regulations: list[PlanRegulationConfig]
    regulations_dict: dict[str, PlanRegulationConfig]

    _instance: PlanRegulationsSet | None = None

    @classmethod
    def get_instance(cls) -> PlanRegulationsSet:
        """Get the singleton instance, if initialized."""
        if cls._instance is None:
            return cls.initialize()
        return cls._instance

    @classmethod
    def get_regulations(cls) -> list[PlanRegulationConfig]:
        """Get the list of top-level regulation configs, if instance is initialized."""
        return cls.get_instance().regulations

    @classmethod
    def get_regulations_dict(cls) -> dict[str, PlanRegulationConfig]:
        """Get all regulations in a dictionary where keys are regulations codes and values PlanRegulationConfigs."""
        return cls.get_instance().regulations_dict

    @classmethod
    def get_regulation_by_code(cls, regulation_code: str) -> PlanRegulationConfig | None:
        """Get a regulation by it's regulation code (if exists)."""
        return cls.get_instance().regulations_dict.get(regulation_code)

    @classmethod
    def initialize(
        cls,
        config_path: Path = DEFAULT_PLAN_REGULATIONS_CONFIG_PATH,
        type_of_plan_regulations_layer_name="Kaavamääräyslaji",
        language: Literal["fin", "eng", "swe"] = "fin",
    ) -> PlanRegulationsSet:
        # Initialize PlanRegulationsSet and PlanRegulationConfigs from QGIS layer and config file

        # 1. Read config file into a dict
        with config_path.open(encoding="utf-8") as f:
            config_data = yaml.safe_load(f)

        # 2. Read code layer
        layer = get_layer_by_name(type_of_plan_regulations_layer_name)
        if layer is None:
            msg = f"Could not find layer {type_of_plan_regulations_layer_name}!"
            raise KeyError(msg)

        # 3. Initialize regulation configs from layer. Storing them by their ID is handy for adding childs later
        id_to_regulation_map: dict[str, PlanRegulationConfig] = {
            feature["id"]: PlanRegulationConfig.from_feature(feature, language) for feature in layer.getFeatures()
        }

        # 4. Add information from config file (value, unit, category only) and link child regulations
        try:
            regulation_data: dict = {data["regulation_code"]: data for data in config_data["plan_regulations"]}
            top_level_regulations: list[PlanRegulationConfig] = []
            for regulation_config in id_to_regulation_map.values():
                # Add possible information from config data file
                data = regulation_data.get(regulation_config.regulation_code)
                if data:
                    regulation_config.category_only = data.get("category_only", False)
                    regulation_config.value_type = ValueType(data["value_type"]) if "value_type" in data else None
                    regulation_config.unit = data["unit"] if "unit" in data else None

                # Top-level, add to list
                if not regulation_config.parent_id:
                    top_level_regulations.append(regulation_config)
                else:
                    # Add as child of another regulation
                    id_to_regulation_map[regulation_config.parent_id].child_regulations.append(regulation_config)
        except KeyError as e:
            raise ConfigSyntaxError(str(e)) from e

        # 5. Create dictionary, useful when creating PlanRegulationDefinitions at least
        regulations_dict: dict[str, PlanRegulationConfig] = {}
        for reg in top_level_regulations:
            reg.add_to_dictionary(regulations_dict)

        # 5. Create instance
        cls._instance = cls(
            version=config_data["version"], regulations=top_level_regulations, regulations_dict=regulations_dict
        )
        logger.info("PlanRegulationsSet initialized successfully.")
        return cls._instance


@dataclass
class PlanRegulationConfig:
    """
    Describes the configuration of a plan regulation.

    Combination of information read from code layer in QGIS / DB and other information
    from a configuration file.
    """

    id: str
    regulation_code: str
    name: str
    description: str
    status: str
    level: int
    parent_id: str | None
    child_regulations: list[PlanRegulationConfig] = field(default_factory=list)

    category_only: bool = False
    value_type: ValueType | None = None
    unit: str | None = None

    @classmethod
    def from_feature(cls, feature: QgsFeature, language: str = "fin") -> PlanRegulationConfig:
        """
        Initialize PlanRegulationConfig from QgsFeature.

        Child regulations, value type ,category only and unit need to be set separately.
        """
        return cls(
            id=feature["id"],
            regulation_code=feature["value"],
            name=feature["name"][language],
            description=feature["description"][language],
            status=feature["status"],
            level=feature["level"],
            parent_id=feature["parent_id"],
        )

    def add_to_dictionary(self, dictionary: dict[str, PlanRegulationConfig]):
        """Add child regulations to dictionary too."""
        dictionary[self.regulation_code] = self
        for regulation in self.child_regulations:
            regulation.add_to_dictionary(dictionary)


# @dataclass
# class PlanRegulationDefinition:
#     """Associates a PlanRegulationConfig with an optional default value and additional data."""

#     regulation_config: PlanRegulationConfig
#     default_value: str | Number | list[int] | None
#     additional_information: list[
#         dict[str, str | Number | None]
#     ]  # NOTE: Correct typing for additional information values?
#     regulation_number: int | None
#     attached_files: list[Path]

#     @classmethod
#     def from_dict(cls, data: dict) -> PlanRegulationDefinition:
#         return cls(
#             regulation_config=data["config"],
#             default_value=data.get("default_value"),
#             additional_information=data.get("additional_information", []),
#             regulation_number=data.get("regulation_number"),
#             attached_files=data.get("attached_files", []),
#         )
