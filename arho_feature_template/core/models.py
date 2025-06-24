from __future__ import annotations

import enum
import logging
import os
from dataclasses import dataclass, field, fields
from pathlib import Path
from typing import TYPE_CHECKING

import yaml

from arho_feature_template.exceptions import ConfigSyntaxError
from arho_feature_template.project.layers.code_layers import (
    AdditionalInformationTypeLayer,
    PlanRegulationTypeLayer,
    UndergroundTypeLayer,
    VerbalRegulationType,
)
from arho_feature_template.qgis_plugin_tools.tools.resources import resources_path
from arho_feature_template.utils.misc_utils import deserialize_localized_text, null_to_none

if TYPE_CHECKING:
    from datetime import datetime

    from qgis.core import QgsFeature, QgsGeometry
    from qgis.PyQt.QtCore import QDate


logger = logging.getLogger(__name__)

PLAN_REGULATIONS_CONFIG_PATH = Path(os.path.join(resources_path(), "configs", "kaavamaaraykset.yaml"))
ADDITIONAL_INFORMATION_CONFIG_PATH = Path(os.path.join(resources_path(), "configs", "additional_information.yaml"))


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

    name: str = ""
    version: str | None = None
    description: str | None = None
    feature_templates: list[PlanFeature] = field(default_factory=list, compare=False)

    @classmethod
    def find_matching_group_config(cls, group_heading: str, regulation_group_libraries: list[RegulationGroupLibrary]):
        for library in regulation_group_libraries:
            for group in library.regulation_groups:
                if group.heading == group_heading:
                    return group
        return None

    @classmethod
    def from_template_dict(
        cls, data: dict, regulation_group_libraries: list[RegulationGroupLibrary]
    ) -> FeatureTemplateLibrary:
        get_underground_id = UndergroundTypeLayer.get_attribute_value_by_another_attribute_value
        try:
            return FeatureTemplateLibrary(
                name=data.get("name", ""),
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
                            for group_heading in feature_data.get("regulation_groups", [])
                            if (group := cls.find_matching_group_config(group_heading, regulation_group_libraries))
                        ],
                        plan_id=None,
                        id_=None,
                    )
                    for feature_data in data["feature_templates"]
                ]
                if data.get("feature_templates")
                else [],
            )
        except KeyError as e:
            raise TemplateSyntaxError(str(cls), str(e)) from e


@dataclass
class RegulationGroupLibrary:
    """A collection of plan regulation groups."""

    class LibraryType(str, enum.Enum):
        DEFAULT = "default"
        CUSTOM = "custom"
        ACTIVE_PLAN_GROUPS = "active_plan_groups"

    name: str = ""
    file_path: str | None = None
    version: int | None = None
    description: str | None = None
    library_type: LibraryType = LibraryType.CUSTOM
    status: bool = True
    regulation_groups: list[RegulationGroup] = field(default_factory=list, compare=False)

    @classmethod
    def from_template_dict(
        cls, data: dict, library_type: LibraryType, file_path: str | None = None
    ) -> RegulationGroupLibrary:
        """Returns whether initialization from data was succesfull and the created RegulationGroupLibrary."""
        if data == {}:
            return RegulationGroupLibrary(library_type=library_type, file_path=file_path, status=False)
        try:
            return RegulationGroupLibrary(
                name=data.get("name", ""),
                file_path=file_path,
                version=data.get("version"),
                description=data.get("description"),
                library_type=library_type,
                status=True,
                regulation_groups=[
                    RegulationGroup.from_template_dict(group_data) for group_data in data["plan_regulation_groups"]
                ]
                if data.get("plan_regulation_groups")
                else [],
            )
        except KeyError as e:
            raise TemplateSyntaxError(str(cls), str(e)) from e

    def into_template_dict(self) -> dict:
        return {
            "name": self.name,
            "file_path": self.file_path,
            "version": self.version,
            "description": self.description,
            "plan_regulation_groups": [group.into_template_dict() for group in self.regulation_groups],
        }

    def get_letter_codes(self) -> set[str]:
        """Returns set of non-empty short names (letter codes) of regulation groups part of the library."""
        return {group.letter_code for group in self.regulation_groups if group.letter_code}


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

    @staticmethod
    def from_template_dict(data: dict, default_value: AttributeValue | None = None) -> AttributeValue:
        if "value_data_type" in data:
            value_data_type = AttributeValueDataType(data["value_data_type"])
        elif default_value and default_value.value_data_type:
            value_data_type = default_value.value_data_type
        else:
            value_data_type = None

        return AttributeValue(
            value_data_type=value_data_type,
            numeric_value=data.get("numeric_value"),
            numeric_range_min=data.get("numeric_range_min"),
            numeric_range_max=data.get("numeric_range_max"),
            unit=data.get("unit", default_value.unit if default_value else None),
            text_value=data.get("text_value"),
            text_syntax=data.get("text_syntax"),
            code_list=data.get("code_list"),
            code_value=data.get("code_value"),
            code_title=data.get("code_title"),
            height_reference_point=data.get("height_reference_point"),
        )

    def into_template_dict(self) -> dict:
        return {
            "value_data_type": self.value_data_type.value if self.value_data_type else None,
            "numeric_value": self.numeric_value,
            "numeric_range_min": self.numeric_range_min,
            "numeric_range_max": self.numeric_range_max,
            "unit": self.unit,
            "text_value": self.text_value,
            "text_syntax": self.text_syntax,
            "code_list": self.code_list,
            "code_value": self.code_value,
            "code_title": self.code_title,
            "height_reference_point": self.height_reference_point,
        }


@dataclass
class AdditionalInformation(PlanBaseModel):
    config: AdditionalInformationConfig  # includes code and unit among other needed data for saving feature

    id_: str | None = None
    plan_regulation_id: str | None = None
    type_additional_information_id: str | None = None
    value: AttributeValue | None = None
    modified: bool = field(compare=False, default=True)

    @staticmethod
    def from_template_dict(data: dict) -> AdditionalInformation:
        ai_config = AdditionalInformationConfigLibrary.get_config_by_code(data["type"])
        default_value = ai_config.default_value if ai_config.default_value else None

        return AdditionalInformation(
            config=ai_config,
            value=AttributeValue.from_template_dict(data, default_value=default_value),
        )

    def into_template_dict(self) -> dict:
        return {
            "type": self.config.additional_information_type,
            **(self.value.into_template_dict() if self.value else {}),
        }


@dataclass
class Regulation(PlanBaseModel):
    regulation_type_id: str
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

    @classmethod
    def from_template_dict(cls, data: dict) -> Regulation:
        regulation_type_id = PlanRegulationTypeLayer.get_id_by_type(data["regulation_code"])
        if regulation_type_id is None:
            msg = f"Invalid regulation code in config: {data['regulation_code']}"
            raise TemplateSyntaxError(str(cls), msg)

        try:
            return Regulation(
                regulation_type_id=regulation_type_id,
                value=AttributeValue.from_template_dict(data),
                additional_information=[
                    AdditionalInformation.from_template_dict(info) for info in data.get("additional_information", [])
                ],
                regulation_number=data.get("regulation_number"),
                # files=data.get("files") if data.get("files") else [],
                # theme_id=data.get("theme"),
                subject_identifiers=data["subject_identifiers"] if data.get("subject_identifiers") else [],
                verbal_regulation_type_ids=[
                    verbal_type_id
                    for verbal_type_id in (
                        VerbalRegulationType.get_id_by_attribute("value", verbal_type)
                        for verbal_type in data["verbal_regulation_types"]
                    )
                    if verbal_type_id is not None
                ]
                if data.get("verbal_regulation_types") is not None
                else [],
                regulation_group_id=None,
                id_=None,
            )
        except KeyError as e:
            raise TemplateSyntaxError(str(cls), str(e)) from e

    def into_template_dict(self) -> dict:
        return {
            "regulation_code": PlanRegulationTypeLayer.get_type_by_id(self.regulation_type_id),
            **(self.value.into_template_dict() if self.value else {}),
            "additional_information": [info.into_template_dict() for info in self.additional_information],
            "regulation_number": self.regulation_number,
            # "files": self.files,
            # "theme_id": self.theme_id,  # Themes will be changed in a to-be-merged PR
            "subject_identifiers": self.subject_identifiers,
            "verbal_regulation_types": [
                VerbalRegulationType.get_attribute_by_id("value", verbal_type_id)
                for verbal_type_id in self.verbal_regulation_type_ids
            ],
        }


@dataclass
class Proposition(PlanBaseModel):
    value: str | None
    theme_ids: list[str] = field(default_factory=list, compare=False)
    proposition_number: int | None = None
    regulation_group_id: str | None = None
    modified: bool = field(compare=False, default=True)
    id_: str | None = None

    def into_template_dict(self) -> dict:
        return {
            "value": self.value,
            # "theme_id": self.theme_id,  # Themes will be changed in a to-be-merged PR
            "proposition_number": self.proposition_number,
        }


@dataclass
class RegulationGroup(PlanBaseModel):
    type_code_id: str | None = None
    heading: str | None = None  # Called "regulation_heading" / "kaavamääräyksen otsikko" in UI and data model
    letter_code: str | None = None
    color_code: str | None = None
    group_number: int | None = None
    regulations: list[Regulation] = field(default_factory=list, compare=False)
    propositions: list[Proposition] = field(default_factory=list, compare=False)
    modified: bool = field(compare=False, default=True)
    category: str | None = None
    id_: str | None = None

    @classmethod
    def from_template_dict(cls, data: dict) -> RegulationGroup:
        return cls(
            # NOTE: Might need to convert type code into type code ID here when
            # config file has type codes for regulation groups
            # type_code_id=data.get("type"),
            heading=data.get("heading"),
            letter_code=data.get("letter_code"),
            color_code=data.get("color_code"),
            group_number=data.get("group_number"),
            regulations=[Regulation.from_template_dict(reg_data) for reg_data in data.get("plan_regulations", [])],
            propositions=[Proposition(**prop_data) for prop_data in data.get("plan_propositions", [])],
            category=data.get("category", "Muut"),
            id_=None,
        )

    def into_template_dict(self) -> dict:
        return {
            # "type": self.type_code_id,
            "heading": self.heading,
            "letter_code": self.letter_code,
            "color_code": self.color_code,
            "group_number": self.group_number,
            "plan_regulations": [regulation.into_template_dict() for regulation in self.regulations],
            "plan_propositions": [proposition.into_template_dict() for proposition in self.propositions],
            "category": self.category,
        }

    def __str__(self):
        return " - ".join(part for part in (self.letter_code, self.heading) if part)


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
    def from_template_dict(cls, data: dict) -> PlanFeature:
        # TODO: Implement
        return cls(**data)

    def into_template_dict(self) -> dict:
        # TODO: Implement
        return {}

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
