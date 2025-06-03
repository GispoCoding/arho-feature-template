from __future__ import annotations

import enum
import logging
import os
from dataclasses import dataclass, field, fields
from pathlib import Path
from typing import TYPE_CHECKING

import yaml

from arho_feature_template.exceptions import ConfigSyntaxError
from arho_feature_template.project.layers.code_layers import AdditionalInformationTypeLayer, UndergroundTypeLayer
from arho_feature_template.qgis_plugin_tools.tools.resources import resources_path
from arho_feature_template.utils.misc_utils import deserialize_localized_text, get_layer_by_name, iface, null_to_none

if TYPE_CHECKING:
    from datetime import datetime

    from qgis.core import QgsFeature, QgsGeometry
    from qgis.PyQt.QtCore import QDate


logger = logging.getLogger(__name__)

DEFAULT_PLAN_REGULATIONS_CONFIG_PATH = Path(os.path.join(resources_path(), "libraries", "kaavamaaraykset.yaml"))
ADDITIONAL_INFORMATION_CONFIG_PATH = Path(os.path.join(resources_path(), "libraries", "additional_information.yaml"))


class AttributeValueDataType(str, enum.Enum):
    LOCALIZED_TEXT = "LocalizedText"
    TEXT = "Text"
    NUMERIC = "Numeric"
    NUMERIC_RANGE = "NumericRange"
    POSITIVE_NUMERIC = "PositiveNumeric"
    POSITIVE_NUMERIC_RANGE = "PositiveNumericRange"
    DECIMAL = "Decimal"
    DECIMAL_RANGE = "DecimalRange"
    POSITIVE_DECIMAL = "PositiveDecimal"
    POSITIVE_DECIMAL_RANGE = "PositiveDecimalRange"
    CODE = "Code"
    IDENTIFIER = "Identifier"
    SPOT_ELEVATION = "SpotElevation"
    TIME_PERIOD = "TimePeriod"
    TIME_PERIOD_DATE_ONLY = "TimePeriodDateOnly"


class TemplateSyntaxError(Exception):
    def __init__(self, template_cls: str, message: str):
        super().__init__(f"Invalid template syntax for {template_cls}: {message}")


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


class PlanBaseModel:
    def __post_init__(self):
        # Set all found NULLs to None
        for _field in fields(self):
            value = getattr(self, _field.name)
            setattr(self, _field.name, null_to_none(value))


@dataclass
class RegulationConfig(PlanBaseModel):
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
    child_regulations: list[RegulationConfig] = field(default_factory=list, compare=False)

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
class AdditionalInformationConfig(PlanBaseModel):
    # From layer
    id: str
    additional_information_type: str
    name: str | None
    description: str | None
    status: str
    level: int
    parent_id: str | None

    children: list[str] = field(default_factory=list, compare=False)

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
class AttributeValue(PlanBaseModel):
    value_data_type: AttributeValueDataType | None = None

    numeric_value: int | float | None = None
    numeric_range_min: int | float | None = None
    numeric_range_max: int | float | None = None

    unit: str | None = None

    text_value: str | None = None
    text_syntax: str | None = None

    code_list: str | None = None
    code_value: str | None = None
    code_title: str | None = None

    height_reference_point: str | None = None


@dataclass
class AdditionalInformation(PlanBaseModel):
    config: AdditionalInformationConfig  # includes code and unit among other needed data for saving feature

    id_: str | None = None
    plan_regulation_id: str | None = None
    type_additional_information_id: str | None = None
    value: AttributeValue | None = None
    modified: bool = field(compare=False, default=True)


@dataclass
class Regulation(PlanBaseModel):
    config: RegulationConfig  # includes regulation_code and unit among other needed data for saving feature
    value: AttributeValue | None = None
    additional_information: list[AdditionalInformation] = field(default_factory=list)
    regulation_number: int | None = None
    files: list[str] = field(default_factory=list, compare=False)
    theme_ids: list[str] = field(default_factory=list, compare=False)
    subject_identifiers: list[str] = field(default_factory=list)
    verbal_regulation_type_ids: list[str] = field(default_factory=list)
    regulation_group_id: str | None = None
    modified: bool = field(compare=False, default=True)
    id_: str | None = None


@dataclass
class Proposition(PlanBaseModel):
    value: str
    theme_ids: list[str] = field(default_factory=list, compare=False)
    proposition_number: int | None = None
    regulation_group_id: str | None = None
    modified: bool = field(compare=False, default=True)
    id_: str | None = None


@dataclass
class RegulationGroup(PlanBaseModel):
    type_code_id: str | None = None
    name: str | None = None
    short_name: str | None = None
    color_code: str | None = None
    group_number: int | None = None
    regulations: list[Regulation] = field(default_factory=list, compare=False)
    propositions: list[Proposition] = field(default_factory=list, compare=False)
    modified: bool = field(compare=False, default=True)
    id_: str | None = None

    @staticmethod
    def _additional_information_model_from_config(info_data: dict) -> AdditionalInformation:
        ai_config = AdditionalInformationConfigLibrary.get_config_by_code(info_data["type"])
        return AdditionalInformation(
            config=ai_config,
            value=AttributeValue(
                value_data_type=info_data.get(
                    "value_data_type",
                    ai_config.default_value.value_data_type if ai_config.default_value is not None else None,
                ),
                numeric_value=info_data.get("numeric_value"),
                numeric_range_min=info_data.get("numeric_range_min"),
                numeric_range_max=info_data.get("numeric_range_max"),
                unit=info_data.get(
                    "unit",
                    ai_config.default_value.unit if ai_config.default_value is not None else None,
                ),
                text_value=info_data.get("text_value"),
                text_syntax=info_data.get("text_syntax"),
                code_list=info_data.get("code_list"),
                code_value=info_data.get("code_value"),
                code_title=info_data.get("code_title"),
                height_reference_point=info_data.get("height_reference_point"),
            ),
        )

    @classmethod
    def from_config_data(cls, data: dict) -> RegulationGroup:
        regulations = []
        for reg_data in data["plan_regulations"]:
            reg_code = reg_data["regulation_code"]
            config = RegulationLibrary.get_regulation_by_code(reg_code)
            if config:
                regulations.append(
                    Regulation(
                        config=config,
                        value=reg_data.get("value"),
                        additional_information=[
                            cls._additional_information_model_from_config(info)
                            for info in reg_data.get("additional_information", [])
                        ],
                        regulation_number=reg_data.get("regulation_number"),
                        files=reg_data.get("files") if reg_data.get("files") else [],
                        theme_ids=reg_data.get(
                            "theme"
                        ),  # TODO: If theme name is in config, needs to be converted to id
                        subject_identifiers=reg_data.get("subject_identifiers"),
                        regulation_group_id=None,
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
            propositions=[],
            id_=None,
        )

    def __str__(self):
        return " - ".join(part for part in (self.short_name, self.name) if part)


@dataclass
class LifeCycle(PlanBaseModel):
    status_id: str | None = None
    id_: str | None = None
    # No need to compare `plan_id` since lifecycles can't be reassigned for another plan after creation
    plan_id: str | None = field(compare=False, default=None)
    plan_regulation_id: str | None = None
    plan_proposition_id: str | None = None
    starting_at: QDate | None = None
    ending_at: QDate | None = None
    # might not need the following
    land_use_are_id: str | None = None
    other_area_id: str | None = None
    line_id: str | None = None
    land_use_point_id: str | None = None
    other_point_id: str | None = None
    modified: bool = field(compare=False, default=True)


@dataclass
class PlanFeature(PlanBaseModel):
    geom: QgsGeometry | None = None  # Need to allow None for feature templates
    type_of_underground_id: str | None = None
    layer_name: str | None = None
    name: str | None = None
    description: str | None = None
    regulation_groups: list[RegulationGroup] = field(default_factory=list, compare=False)
    plan_id: int | None = None
    modified: bool = field(compare=False, default=True)
    id_: str | None = None

    @classmethod
    def from_config_data(cls, data: dict) -> PlanFeature:
        # TODO: Implement
        return cls(**data)

    def __str__(self):
        return self.name if self.name else ""


@dataclass
class Plan(PlanBaseModel):
    name: str | None = None
    description: str | None = None
    plan_type_id: str | None = None
    lifecycle_status_id: str | None = None
    lifecycles: list[LifeCycle] = field(default_factory=list, compare=False)
    record_number: str | None = None
    matter_management_identifier: str | None = None
    permanent_plan_identifier: str | None = None
    producers_plan_identifier: str | None = None
    organisation_id: str | None = None
    general_regulations: list[RegulationGroup] = field(default_factory=list, compare=False)
    documents: list[Document] = field(default_factory=list, compare=False)
    legal_effect_ids: list[str] = field(default_factory=list)
    geom: QgsGeometry | None = None
    modified: bool = field(compare=False, default=True)
    id_: str | None = None


@dataclass
class Document(PlanBaseModel):
    name: str | None = None
    url: str | None = None
    type_of_document_id: str | None = None
    accessibility: bool = False
    identifier: str | None = None
    category_of_publicity_id: str | None = None
    personal_data_content_id: str | None = None
    retention_time_id: str | None = None
    language_id: str | None = None
    document_date: datetime | None = None
    # exported_at: str | None = None
    # exported_file_key:
    confirmation_date: datetime | None = None
    arrival_date: datetime | None = None
    plan_id: str | None = None
    modified: bool = field(compare=False, default=True)
    id_: str | None = None
