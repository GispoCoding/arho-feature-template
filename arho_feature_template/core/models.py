from __future__ import annotations

import logging
import os
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import TYPE_CHECKING

import yaml

from arho_feature_template.exceptions import ConfigSyntaxError
from arho_feature_template.qgis_plugin_tools.tools.resources import resources_path
from arho_feature_template.utils.misc_utils import get_layer_by_name, iface

if TYPE_CHECKING:
    from typing import Literal

    from qgis.core import QgsFeature, QgsGeometry


logger = logging.getLogger(__name__)

DEFAULT_PLAN_REGULATIONS_CONFIG_PATH = Path(os.path.join(resources_path(), "kaavamaaraykset.yaml"))


class ValueType(Enum):
    DECIMAL = "desimaali"
    POSITIVE_DECIMAL = "positiivinen desimaali"
    POSITIVE_INTEGER = "positiivinen kokonaisluku"
    POSITIVE_INTEGER_RANGE = "positiivinen kokonaisluku arvoväli"
    VERSIONED_TEXT = "kieliversioitu teksti"


@dataclass
class RegulationGroupCategory:
    category_code: str | None
    name: str | None
    regulation_groups: list[RegulationGroup]


@dataclass
class RegulationGroupLibrary:
    """Describes the configuration of a plan regulation group library"""

    name: str
    version: int | None
    description: str | None
    regulation_group_categories: list[RegulationGroupCategory]
    # regulation_groups: list[RegulationGroup]

    @classmethod
    def from_config_file(cls, config_fp: Path) -> RegulationGroupLibrary:
        with config_fp.open(encoding="utf-8") as f:
            data = yaml.safe_load(f)
            return RegulationGroupLibrary(
                name=data["name"],
                version=data.get("version"),
                description=data.get("description"),
                regulation_group_categories=[
                    RegulationGroupCategory(
                        category_code=category_data["category_code"],
                        name=category_data.get("name"),
                        regulation_groups=[
                            RegulationGroup.from_config_data(config_data)
                            for config_data in category_data["plan_regulation_groups"]
                        ],
                    )
                    for category_data in data["categories"]
                ],
            )


@dataclass
class RegulationLibrary:
    """Describes the set of plan regulations."""

    version: str
    regulations: list[RegulationConfig]
    regulations_dict: dict[str, RegulationConfig]

    _instance: RegulationLibrary | None = None

    @classmethod
    def get_instance(cls) -> RegulationLibrary:
        """Get the singleton instance, if initialized."""
        if cls._instance is None:
            return cls.initialize()
        return cls._instance

    @classmethod
    def get_regulations(cls) -> list[RegulationConfig]:
        """Get the list of top-level regulation configs, if instance is initialized."""
        return cls.get_instance().regulations

    @classmethod
    def get_regulations_dict(cls) -> dict[str, RegulationConfig]:
        """Get all regulations in a dictionary where keys are regulations codes and values RegulationConfigs."""
        return cls.get_instance().regulations_dict

    @classmethod
    def get_regulation_by_code(cls, regulation_code: str) -> RegulationConfig | None:
        """Get a regulation by it's regulation code (if exists)."""
        return cls.get_instance().regulations_dict.get(regulation_code)

    @classmethod
    def initialize(
        cls,
        config_path: Path = DEFAULT_PLAN_REGULATIONS_CONFIG_PATH,
        type_of_plan_regulations_layer_name="Kaavamääräyslaji",
        language: Literal["fin", "eng", "swe"] = "fin",
    ) -> RegulationLibrary:
        # Initialize RegulationLibrary and RegulationConfigs from QGIS layer and config file

        # 1. Read config file into a dict
        with config_path.open(encoding="utf-8") as f:
            config_data = yaml.safe_load(f)

        # 2. Read code layer
        layer = get_layer_by_name(type_of_plan_regulations_layer_name)
        if layer is None:
            msg = f"Could not find layer {type_of_plan_regulations_layer_name}!"
            raise KeyError(msg)

        # 3. Initialize regulation configs from layer. Storing them by their ID is handy for adding childs later
        id_to_regulation_map: dict[str, RegulationConfig] = {
            feature["id"]: RegulationConfig.from_feature(feature, language) for feature in layer.getFeatures()
        }

        # 4. Add information from config file (value, unit, category only) and link child regulations
        try:
            regulation_data: dict = {data["regulation_code"]: data for data in config_data["plan_regulations"]}
            top_level_regulations: list[RegulationConfig] = []
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
        regulations_dict: dict[str, RegulationConfig] = {}
        for reg in top_level_regulations:
            reg.add_to_dictionary(regulations_dict)

        # 5. Create instance
        cls._instance = cls(
            version=config_data["version"], regulations=top_level_regulations, regulations_dict=regulations_dict
        )
        logger.info("RegulationLibrary initialized successfully.")
        return cls._instance


@dataclass
class RegulationConfig:
    """
    Describes plan regulation type.

    Initialized from DB/QGIS layer and extended with data from a config file.
    """

    id: str
    regulation_code: str
    name: str
    description: str
    status: str
    level: int
    parent_id: str | None
    child_regulations: list[RegulationConfig] = field(default_factory=list)

    # Data from config file
    category_only: bool = False
    value_type: ValueType | None = None
    unit: str | None = None

    # NOTE: Perhaps this ("model_from_feature") should be method of PlanTypeLayer class?
    @classmethod
    def from_feature(cls, feature: QgsFeature, language: str = "fin") -> RegulationConfig:
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

    def add_to_dictionary(self, dictionary: dict[str, RegulationConfig]):
        """Add child regulations to dictionary too."""
        dictionary[self.regulation_code] = self
        for regulation in self.child_regulations:
            regulation.add_to_dictionary(dictionary)


@dataclass
class Regulation:
    config: RegulationConfig  # includes regulation_code and unit among other needed data for saving feature
    value: str | float | int | tuple[int, int] | None = None
    additional_information: dict[str, str | float | int | None] | None = None
    regulation_number: int | None = None
    files: list[str] = field(default_factory=list)
    theme: str | None = None
    topic_tag: str | None = None
    regulation_group_id_: int | None = None
    id_: int | None = None
    # value_string: str | None
    # value_number: Number | None
    # value_number_pair: tuple[Number, Number] | None


@dataclass
class RegulationGroup:
    type_code_id: str | None
    name: str | None
    short_name: str | None
    color_code: str | None
    group_number: int | None = None
    regulations: list[Regulation] = field(default_factory=list)
    id_: int | None = None

    @classmethod
    def from_config_data(cls, data: dict) -> RegulationGroup:
        regulations = []
        for reg_data in data["plan_regulations"]:
            reg_code = reg_data["regulation_code"]
            config = RegulationLibrary.get_regulation_by_code(reg_code)
            if config:
                info_data = reg_data.get("additional_information")
                regulations.append(
                    Regulation(
                        config=config,
                        value=reg_data.get("value"),
                        additional_information={info["type"]: info.get("value") for info in info_data}
                        if info_data
                        else None,
                        regulation_number=reg_data.get("regulation_number"),
                        files=reg_data.get("files") if reg_data.get("files") else [],
                        theme=reg_data.get("theme"),
                        topic_tag=reg_data.get("topic_tag"),
                        regulation_group_id_=None,
                        id_=None,
                    )
                )
            else:
                iface.messageBar().pushWarning("", f"Could not find plan regulation {reg_code}!")
        return cls(
            type_code_id=data.get("type"),  # NOTE: Might need to convert type code into type code ID here when
            # config file has type codes for regulation groups
            name=data.get("name"),
            short_name=data.get("short_name"),
            color_code=data.get("color_code"),
            group_number=data.get("group_number"),
            regulations=regulations,
            id_=None,
        )


@dataclass
class PlanFeature:
    geom: QgsGeometry
    type_of_underground_id: str
    layer_name: str | None = None
    name: str | None = None
    description: str | None = None
    regulation_groups: list[RegulationGroup] = field(default_factory=list)
    plan_id: int | None = None
    id_: int | None = None


@dataclass
class Plan:
    name: str
    description: str | None
    plan_type_id: str
    lifecycle_status_id: str
    record_number: str | None
    matter_management_identifier: str | None
    permanent_plan_identifier: str | None
    producers_plan_identifier: str | None
    organisation_id: str | None = None
    general_regulations: list[RegulationGroup] = field(default_factory=list)
    geom: QgsGeometry | None = None
    id_: int | None = None
