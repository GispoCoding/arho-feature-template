from __future__ import annotations

from dataclasses import dataclass, field
from enum import Enum
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from numbers import Number
    from qgis.core import QgsGeometry, QgsFeature


class ValueType(Enum):
    DECIMAL = "desimaali"
    POSITIVE_DECIMAL = "positiivinen desimaali"
    POSITIVE_INTEGER = "positiivinen kokonaisluku"
    POSITIVE_INTEGER_RANGE = "positiivinen kokonaisluku arvoväli"
    VERSIONED_TEXT = "kieliversioitu teksti"


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
    value: str | Number | tuple[int, int] | None = None
    regulation_number: int | None
    additional_information: dict[str, str | Number | None]
    files: list[str] = []
    theme: str | None = None
    topic_tag: str | None = None
    id_: int | None = None
    # value_string: str | None
    # value_number: Number | None
    # value_number_pair: tuple[Number, Number] | None


@dataclass
class RegulationGroup:
    type_code: str
    name: str | None
    short_name: str | None
    color_code: str | None
    letter_code: str | None
    regulations: list[Regulation] | list[RegulationConfig]
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
