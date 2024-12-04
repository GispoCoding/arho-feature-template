from __future__ import annotations

import logging
from dataclasses import dataclass
from typing import TYPE_CHECKING

import yaml

if TYPE_CHECKING:
    from pathlib import Path

logger = logging.getLogger(__name__)

SUPPORTED_TEMPLATE_VERSION = 1


class TemplateLibraryVersionError(Exception):
    def __init__(self, version: str):
        super().__init__(f"Template library version {version} is not supported")


class TemplateSyntaxError(Exception):
    def __init__(self, message: str):
        super().__init__(f"Invalid template syntax: {message}")


@dataclass
class TemplateLibraryConfig:
    """Describes the configuration of a template library"""

    version: str
    meta: TemplateLibraryMeta
    templates: list[FeatureTemplate]

    @classmethod
    def from_dict(cls, data: dict) -> TemplateLibraryConfig:
        file_version = data["version"]
        if file_version != SUPPORTED_TEMPLATE_VERSION:
            raise TemplateLibraryVersionError(file_version)

        try:
            return cls(
                version=file_version,
                meta=TemplateLibraryMeta.from_dict(data["meta"]),
                templates=[FeatureTemplate.from_dict(template) for template in data["templates"]],
            )
        except KeyError as e:
            raise TemplateSyntaxError(str(e)) from e


@dataclass
class TemplateLibraryMeta:
    """Describes the metadata of a template library"""

    name: str
    group: str | None
    sub_group: str | None
    description: str | None
    version: str | None

    @classmethod
    def from_dict(cls, data: dict) -> TemplateLibraryMeta:
        return cls(
            name=data["name"],
            group=data.get("group"),
            sub_group=data.get("sub_group"),
            description=data.get("description"),
            version=data.get("version"),
        )


@dataclass
class FeatureTemplate:
    """Describes a feature template that can include nested features"""

    name: str
    group: str | None
    sub_group: str | None
    description: str | None
    feature: Feature

    @classmethod
    def from_dict(cls, data: dict) -> FeatureTemplate:
        return cls(
            name=data["name"],
            group=data.get("group"),
            sub_group=data.get("sub_group"),
            description=data.get("description"),
            feature=Feature.from_dict(data["feature"]),
        )


@dataclass
class Feature:
    """Describes a feature to be inserted into a Vector layer"""

    layer: str
    attributes: list[Attribute]
    child_features: list[Feature] | None

    @classmethod
    def from_dict(cls, data: dict) -> Feature:
        return cls(
            layer=data["layer"],
            attributes=[Attribute.from_dict(attribute) for attribute in data["attributes"]],
            child_features=[Feature.from_dict(feature) for feature in data.get("child_features", [])],
        )


@dataclass
class Attribute:
    """Describes an attribute to be set on a feature"""

    attribute: str
    default: str | None
    description: str | None

    @classmethod
    def from_dict(cls, data: dict) -> Attribute:
        return cls(attribute=data["attribute"], default=data.get("default"), description=data.get("description"))

    def display(self) -> str:
        if self.description is not None:
            return self.description
        if self.default is not None:
            return self.default
        return ""


def parse_template_library_config(template_library_config: Path) -> TemplateLibraryConfig:
    with template_library_config.open(encoding="utf-8") as f:
        data = yaml.safe_load(f)
        return TemplateLibraryConfig.from_dict(data)
