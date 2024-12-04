from __future__ import annotations

import logging
from dataclasses import dataclass
from typing import TYPE_CHECKING, cast

import yaml
from qgis.utils import iface

from arho_feature_template.plan_regulation.plan_regulation_config import PlanRegulationDefinition, PlanRegulationsSet

if TYPE_CHECKING:
    from pathlib import Path

    from qgis.gui import QgisInterface

    iface: QgisInterface = cast("QgisInterface", iface)  # type: ignore[no-redef]

logger = logging.getLogger(__name__)


class ConfigSyntaxError(Exception):
    def __init__(self, message: str):
        super().__init__(f"Invalid config syntax: {message}")


@dataclass
class PlanRegulationGroupLibrary:
    """Describes the configuration of a plan regulation group library"""

    meta: PlanRegulationGroupLibraryMeta
    plan_regulation_group_categories: list[PlanRegulationGroupCategory]

    @classmethod
    def from_dict(cls, data: dict) -> PlanRegulationGroupLibrary:
        try:
            return cls(
                meta=PlanRegulationGroupLibraryMeta.from_dict(data["meta"]),
                plan_regulation_group_categories=[
                    PlanRegulationGroupCategory.from_dict(category) for category in data["categories"]
                ],
            )
        except KeyError as e:
            raise ConfigSyntaxError(str(e)) from e

    @classmethod
    def new_from_file(cls, fp: Path) -> PlanRegulationGroupLibrary:
        with fp.open(encoding="utf-8") as f:
            data = yaml.safe_load(f)
            return PlanRegulationGroupLibrary.from_dict(data)


@dataclass
class PlanRegulationGroupLibraryMeta:
    """Describes the metadata of a plan regulation group library"""

    name: str
    version: int | None
    group: str | None
    sub_group: str | None
    description: str | None

    @classmethod
    def from_dict(cls, data: dict) -> PlanRegulationGroupLibraryMeta:
        return cls(
            name=data["name"],
            version=data.get("version"),
            group=data.get("group"),
            sub_group=data.get("sub_group"),
            description=data.get("description"),
        )


@dataclass
class PlanRegulationGroupCategory:
    category_code: str
    name: str | None
    plan_regulation_groups: list[PlanRegulationGroupDefinition]

    @classmethod
    def from_dict(cls, data: dict) -> PlanRegulationGroupCategory:
        return cls(
            category_code=data["category_code"],
            name=data.get("name"),
            plan_regulation_groups=[
                PlanRegulationGroupDefinition.from_dict(group) for group in data["plan_regulation_groups"]
            ],
        )


@dataclass
class PlanRegulationGroupDefinition:
    """Describes a plan regulation group"""

    name: str
    geometry: str
    color_code: str | None
    letter_code: str | None
    plan_regulations: list[PlanRegulationDefinition]

    @classmethod
    def from_dict(cls, data: dict) -> PlanRegulationGroupDefinition:
        regulations = []
        for reg_data in data["plan_regulations"]:
            reg_code = reg_data["regulation_code"]
            config = PlanRegulationsSet.get_regulation_by_code(reg_code)
            if config:
                reg_data["config"] = config
                regulations.append(PlanRegulationDefinition.from_dict(reg_data))
            else:
                iface.messageBar().pushWarning("", f"Could not find config for {reg_code} plan regulation!")
        return cls(
            name=data["name"],
            geometry=data["geometry"],
            color_code=data.get("color_code"),
            letter_code=data.get("letter_code"),
            plan_regulations=regulations,
        )
