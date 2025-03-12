from __future__ import annotations

import logging
import os
from dataclasses import dataclass, field
from pathlib import Path
from typing import TYPE_CHECKING

import yaml

from arho_feature_template.core.models import (
    AttributeValue,
    AttributeValueDataType,
    PlanFeature,
    RegulationGroup,
)
from arho_feature_template.exceptions import ConfigSyntaxError
from arho_feature_template.project.layers.code_layers import AdditionalInformationTypeLayer, UndergroundTypeLayer
from arho_feature_template.qgis_plugin_tools.tools.resources import resources_path
from arho_feature_template.utils.misc_utils import deserialize_localized_text, get_layer_by_name

if TYPE_CHECKING:
    from qgis.core import QgsFeature

logger = logging.getLogger(__name__)

ADDITIONAL_INFORMATION_CONFIG_PATH = Path(os.path.join(resources_path(), "libraries", "additional_information.yaml"))
DEFAULT_PLAN_REGULATIONS_CONFIG_PATH = Path(os.path.join(resources_path(), "libraries", "kaavamaaraykset.yaml"))


class TemplateSyntaxError(Exception):
    def __init__(self, template_cls: str, message: str):
        super().__init__(f"Invalid template syntax for {template_cls}: {message}")


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

    def get_short_names(self) -> set[str]:
        """Returns set of non-empty short names (letter codes) of regulation groups part of the library."""
        return {
            regulation_group.short_name
            for category in self.regulation_group_categories
            for regulation_group in category.regulation_groups
            if regulation_group.short_name
        }


@dataclass
class RegulationConfig:
    """
    Describes plan regulation type.

    Initialized from DB/QGIS layer and extended with data from a config file.
    """

    id: str
    regulation_code: str
    name: str | None
    description: str | None
    status: str
    level: int
    parent_id: str | None
    child_regulations: list[RegulationConfig] = field(default_factory=list)

    # Data from config file
    category_only: bool = False
    default_value: AttributeValue | None = None

    # NOTE: Perhaps this ("model_from_feature") should be method of PlanTypeLayer class?
    @classmethod
    def from_feature(cls, feature: QgsFeature) -> RegulationConfig:
        """
        Initialize PlanRegulationConfig from QgsFeature.

        Child regulations, value type ,category only and unit need to be set separately.
        """
        return cls(
            id=feature["id"],
            regulation_code=feature["value"],
            name=deserialize_localized_text(feature["name"]),
            description=deserialize_localized_text(feature["description"]),
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
            feature["id"]: RegulationConfig.from_feature(feature) for feature in layer.getFeatures()
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
                    regulation_config.default_value = AttributeValue(
                        value_data_type=(AttributeValueDataType(data["value_type"]) if "value_type" in data else None),
                        unit=data["unit"] if "unit" in data else None,
                    )

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
class AdditionalInformationConfig:
    # From layer
    id: str
    additional_information_type: str
    name: str | None
    description: str | None
    status: str
    level: int
    parent_id: str | None

    children: list[str] = field(default_factory=list)

    # From config file
    default_value: AttributeValue | None = None


@dataclass
class AdditionalInformationConfigLibrary:
    version: str
    configs: dict[str, AdditionalInformationConfig] = field(default_factory=dict)
    top_level_codes: list[str] = field(default_factory=list)

    _id_to_configs: dict[str, AdditionalInformationConfig] = field(default_factory=dict)
    _instance: AdditionalInformationConfigLibrary | None = None

    @classmethod
    def get_instance(cls) -> AdditionalInformationConfigLibrary:
        """Get the singleton instance, if initialized."""
        if cls._instance is None:
            cls._instance = cls.initialize(ADDITIONAL_INFORMATION_CONFIG_PATH)
        return cls._instance

    @classmethod
    def initialize(cls, config_fp: Path = ADDITIONAL_INFORMATION_CONFIG_PATH) -> AdditionalInformationConfigLibrary:
        with config_fp.open(encoding="utf-8") as f:
            data = yaml.safe_load(f)
            if data.get("version") != 1:
                msg = "Version must be 1"
                raise ConfigSyntaxError(msg)
            config_file_configs = {
                ai_config_data["code"]: ai_config_data for ai_config_data in data["additional_information"]
            }

        code_to_configs: dict[str, AdditionalInformationConfig] = {}
        id_to_cofigs: dict[str, AdditionalInformationConfig] = {}
        for feature in AdditionalInformationTypeLayer.get_features():
            ai_code = feature["value"]
            congig_file_config = config_file_configs.get(ai_code)

            default_value = (
                AttributeValue(
                    value_data_type=AttributeValueDataType(congig_file_config["data_type"]),
                    unit=congig_file_config.get("unit"),
                )
                if congig_file_config is not None
                else None
            )

            ai_config = AdditionalInformationConfig(
                id=feature["id"],
                additional_information_type=ai_code,
                name=deserialize_localized_text(feature["name"]),
                description=deserialize_localized_text(feature["description"]),
                status=feature["status"],
                level=feature["level"],
                parent_id=feature["parent_id"],
                default_value=default_value,
            )
            code_to_configs[ai_code] = ai_config
            id_to_cofigs[feature["id"]] = ai_config

        top_level_codes = []
        for ai_config in code_to_configs.values():
            if ai_config.parent_id:
                id_to_cofigs[ai_config.parent_id].children.append(ai_config.additional_information_type)
            else:
                top_level_codes.append(ai_config.additional_information_type)

        return cls(
            version=data["version"],
            configs=code_to_configs,
            top_level_codes=top_level_codes,
            _id_to_configs=id_to_cofigs,
        )

    @classmethod
    def get_config_by_code(cls, code: str) -> AdditionalInformationConfig:
        """Get a regulation by it's regulation code.

        Raises a KeyError if code not exists.
        """
        return cls.get_instance().configs[code]

    @classmethod
    def get_config_by_id(cls, id_: str) -> AdditionalInformationConfig:
        """Get a regulation by it's regulation code.

        Raises a KeyError if code not exists.
        """

        return cls.get_instance()._id_to_configs[id_]  # noqa: SLF001


@dataclass
class FeatureTemplateLibrary:
    """Describes the configuration of a feature template library"""

    name: str
    version: str | None
    description: str | None
    feature_templates: list[PlanFeature]

    @classmethod
    def find_matching_group_config(cls, group_name: str, regulation_group_libraries: list[RegulationGroupLibrary]):
        for library in regulation_group_libraries:
            for category in library.regulation_group_categories:
                for group in category.regulation_groups:
                    if group.name == group_name:
                        return group
        return None

    @classmethod
    def from_config_file(
        cls, config_fp: Path, regulation_group_libraries: list[RegulationGroupLibrary]
    ) -> FeatureTemplateLibrary:
        get_underground_id = UndergroundTypeLayer.get_attribute_value_by_another_attribute_value

        with config_fp.open(encoding="utf-8") as f:
            data = yaml.safe_load(f)
            try:
                return FeatureTemplateLibrary(
                    name=data["name"],
                    version=data.get("version"),
                    description=data.get("description"),
                    feature_templates=[
                        PlanFeature(
                            geom=None,
                            type_of_underground_id=(
                                get_underground_id("id", "value", feature_data.get("type_of_underground"))
                                if feature_data.get("type_of_underground")
                                else None
                            ),
                            layer_name=feature_data.get("layer_name"),
                            name=feature_data.get("name"),
                            description=feature_data.get("description"),
                            regulation_groups=[
                                group
                                for group_name in feature_data.get("regulation_groups", [])
                                if (group := cls.find_matching_group_config(group_name, regulation_group_libraries))
                            ],
                            plan_id=None,
                            id_=None,
                        )
                        for feature_data in data["feature_templates"]
                    ],
                )
            except KeyError as e:
                raise TemplateSyntaxError(str(cls), str(e)) from e
