from __future__ import annotations

import enum
import logging
import os
from pathlib import Path
from typing import TYPE_CHECKING, Any, ClassVar, cast

import yaml

from arho_feature_template.exceptions import ConfigSyntaxError, LayerNameNotFoundError
from arho_feature_template.project.layers import AbstractLayer
from arho_feature_template.qgis_plugin_tools.tools.resources import resources_path

if TYPE_CHECKING:
    from qgis.core import QgsFeature

    from arho_feature_template.core.models import AttributeValue


logger = logging.getLogger(__name__)


class PlanType(str, enum.Enum):
    REGIONAL = "regional"
    GENERAL = "general"
    TOWN = "town"


class AbstractCodeLayer(AbstractLayer):
    _cache: ClassVar[dict[str, dict[str, Any]]] = {}
    _attributes_to_leave_out_from_cache: ClassVar[list[str]] = ["created_at", "modified_at"]
    _field_names: ClassVar[list[str]] = []
    category_only_codes: ClassVar[list[str]] = []

    def __init_subclass__(cls, **kwargs):
        super().__init_subclass__(**kwargs)
        cls._cache = {}
        cls._field_names = []

    @classmethod
    def build_cache(cls):
        """
        Builds a cache dictionary for the whole layer to avoid duplicate access to immutable code layer data.

        Iterates features of the layer and stores found attributes to `_cache` class var dictionary (keys are
        code feature IDs, values are dictionaries where keys are attribute names and values are attribute values).
        """
        cls._field_names = cls.get_from_project().fields().names()
        for feat in cls.get_from_project().getFeatures():
            cls._cache_feature(feat)

    @classmethod
    def _cache_feature(cls, feat: QgsFeature):
        if len(cls._field_names) == 0:
            cls._field_names = cls.get_from_project().fields().names()

        attribute_dict = {}
        for attribute in cls._field_names:
            if attribute in cls._attributes_to_leave_out_from_cache:
                continue
            # NOTE: 'feat.attribute(attribute)' returns None if attribute is not found
            attribute_value_to_cache = feat[attribute]
            attribute_dict[attribute] = attribute_value_to_cache

        id_ = feat["id"]
        if cls._cache.get(id_):
            logger.info("Resaving feature (ID %s) to cache for layer %s", id_, cls.name)
        cls._cache[id_] = attribute_dict

    @classmethod
    def get_cached_attributes(cls) -> dict[str, dict[str, Any]]:
        """
        Returns a dictionary of features where key is ID and value is a dictionary of attributes.

        If cache does not exist yet, will build it first and return it then.
        """
        # NOTE: If we build cache partially, we might return only part of features
        if not cls.cache_exists():
            cls.build_cache()

        return cls._cache

    @classmethod
    def cache_exists(cls) -> bool:
        return bool(cls._cache)

    @classmethod
    def get_id_by_attribute(cls, attribute: str, attribute_value: str) -> str | None:
        """Tries to retrieve ID by attribute from cache, accesses DB if attribute not cachced."""
        for _id, attribute_data in cls._cache.items():
            if attribute_data[attribute] == attribute_value:
                return _id

        return super().get_id_by_attribute(attribute, attribute_value)

    @classmethod
    def get_attribute_by_id(cls, target_attribute: str, id_: str) -> Any | None:
        """Tries to retrieve attribute by ID from cache, accesses DB if attribute not cachced."""
        attribute_value = cls._cache.get(id_, {}).get(target_attribute, "not_found")
        # Attribute value could be None and we don't want to access DB in that without a need
        if attribute_value != "not_found":
            return attribute_value

        return super().get_attribute_by_id(target_attribute, id_)

    @classmethod
    def get_attributes_by_id(cls, id_: str) -> dict[str, Any]:
        attributes = cls._cache.get(id_, {})
        if attributes:
            return attributes

        feat = cls.get_feature_by_id(id_)
        if not feat:
            return {}
        cls._cache_feature(feat)
        return cls._cache[id_]

    @classmethod
    def get_attribute_value_by_another_attribute_value(
        cls, target_attribute: str, filter_attribute: str, filter_value: str
    ) -> Any | None:
        for attribute_data in cls._cache.values():
            if attribute_data[filter_attribute] == filter_value:
                return attribute_data[target_attribute]

        return super().get_attribute_value_by_another_attribute_value(target_attribute, filter_attribute, filter_value)


class PlanTypeLayer(AbstractCodeLayer):
    name = "Kaavalaji"

    category_only_codes: ClassVar[list[str]] = ["1", "2", "3"]  # "Maakuntakaava", "Asemakaava", "Yleiskaava"

    regional_plan_type_first_character = "1"
    general_plan_type_first_character = "2"
    town_plan_type_first_character = "3"

    @classmethod
    def get_plan_type(cls, _id: str | None) -> PlanType | None:
        if _id is None:
            return None
        attribute_value = cls.get_attribute_value_by_another_attribute_value("value", "id", _id)
        if not attribute_value:
            return None

        if attribute_value[0] == cls.regional_plan_type_first_character:
            return PlanType.REGIONAL
        if attribute_value[0] == cls.general_plan_type_first_character:
            return PlanType.GENERAL
        if attribute_value[0] == cls.town_plan_type_first_character:
            return PlanType.TOWN
        return None

    @classmethod
    def is_regional_plan_type(cls, _id: str | None) -> bool:
        return cls.get_plan_type(_id) == PlanType.REGIONAL

    @classmethod
    def is_general_plan_type(cls, _id: str | None) -> bool:
        return cls.get_plan_type(_id) == PlanType.GENERAL

    @classmethod
    def is_town_plan_type(cls, _id: str | None) -> bool:
        return cls.get_plan_type(_id) == PlanType.TOWN


class LifeCycleStatusLayer(AbstractCodeLayer):
    name = "Elinkaaren tila"


class OrganisationLayer(AbstractCodeLayer):
    name = "Toimija"


class UndergroundTypeLayer(AbstractCodeLayer):
    name = "Maanalaisuuden tyyppi"


class PlanThemeLayer(AbstractCodeLayer):
    name = "Kaavoitusteemat"


class AdditionalInformationTypeLayer(AbstractCodeLayer):
    name = "Lisätiedonlaji"

    ADDITIONAL_INFORMATION_CONFIG_PATH = Path(os.path.join(resources_path(), "configs", "additional_information.yaml"))

    category_only_codes: ClassVar[list[str]] = [
        "tyyppi",
        "hairionTorjuntatarve",
        "merkittavyys",
        "eriTahojenTarpeisiinVaraaminen",
        "ymparistomuutoksenLaji",
        "rakentamisenOhjaus",
    ]

    @classmethod
    def build_cache(cls):
        super().build_cache()
        configs = cls.read_additional_information_configs()
        cls.initialize_from_additional_information_config(configs)

    @classmethod
    def read_additional_information_configs(cls) -> dict:
        # NOTE: Should this config be read in another module? Imports now here to avoid circular import
        from arho_feature_template.core.models import AttributeValue, AttributeValueDataType

        with cls.ADDITIONAL_INFORMATION_CONFIG_PATH.open(encoding="utf-8") as f:
            config_data = yaml.safe_load(f)
        try:
            return {
                info_data["code"]: {
                    "default_value": AttributeValue(
                        value_data_type=AttributeValueDataType(info_data["data_type"]),
                        unit=info_data.get("unit"),
                    )
                }
                for info_data in config_data["additional_information"]
            }
        except KeyError as e:
            raise ConfigSyntaxError(str(e)) from e

    @classmethod
    def initialize_from_additional_information_config(cls, information_configs: dict):
        for info_attributes in cls._cache.values():
            additional_data: dict = information_configs.get(info_attributes["value"], {"default_value": None})
            info_attributes |= additional_data  # noqa: PLW2901

    @classmethod
    def get_id_by_type(cls, information_type: str) -> str | None:
        return cls.get_id_by_attribute("value", information_type)

    @classmethod
    def get_type_by_id(cls, id_: str) -> str | None:
        return cls.get_attribute_by_id("value", id_)

    @classmethod
    def get_name_by_id(cls, id_: str) -> str | None:
        return cls.get_attribute_by_id("name", id_)

    @classmethod
    def get_default_value_by_id(cls, id_: str) -> AttributeValue | None:
        attribute_value = cls._cache.get(id_, {}).get("default_value", "not_found")
        # Attribute value could be None and we don't want to access DB in that without a need
        if attribute_value != "not_found":
            return attribute_value
        return None


class PlanRegulationGroupTypeLayer(AbstractCodeLayer):
    name = "Kaavamääräysryhmän tyyppi"

    LAYER_NAME_TO_REGULATION_GROUP_TYPE_MAP: ClassVar[dict[str, str]] = {
        "Kaava": "generalRegulations",
        "Aluevaraus": "landUseRegulations",
        "Osa-alue": "otherAreaRegulations",
        "Viivat": "lineRegulations",
        "Muut pisteet": "otherPointRegulations",
        "Maankäytön kohteet": "landUseRegulations",
    }

    @classmethod
    def get_id_by_feature_layer_name(cls, layer_name: str) -> str | None:
        regulation_group_type = cls.LAYER_NAME_TO_REGULATION_GROUP_TYPE_MAP.get(layer_name)
        if not regulation_group_type:
            raise LayerNameNotFoundError(layer_name)
        regulation_type_id = cls.get_attribute_value_by_another_attribute_value("id", "value", regulation_group_type)
        if regulation_type_id:
            return cast(str, regulation_type_id)
        return None


class PlanRegulationTypeLayer(AbstractCodeLayer):
    name = "Kaavamääräyslaji"

    PLAN_REGULATIONS_CONFIG_PATH = Path(os.path.join(resources_path(), "configs", "kaavamaaraykset.yaml"))
    # Attributes added from config: 'category_only' and 'default_value'

    verbal_regulation_types: ClassVar[list[str]] = [
        "sanallinenMaarays",
        "rakentamisrajoitusYleiskaava",
        "rakentamisrajoitusMaakuntakaava",
        "maaraAikainenRakentamisrajoitus",
        "toimenpiderajoitus",
        "maaraAikainenKieltoRakennuksenRakentamiseksi",
        "suunnittelumaarays",
        "rakentamismaarays",
        "suojelumaarays",
    ]

    @classmethod
    def build_cache(cls):
        super().build_cache()
        configs = cls.read_regulation_configs()
        cls.initialize_from_regulation_config(configs)

    @classmethod
    def read_regulation_configs(cls) -> dict:
        # NOTE: Should this config be read in another module? Imports now here to avoid circular import
        from arho_feature_template.core.models import AttributeValue, AttributeValueDataType

        with cls.PLAN_REGULATIONS_CONFIG_PATH.open(encoding="utf-8") as f:
            config_data = yaml.safe_load(f)
        try:
            return {
                reg_data["regulation_code"]: {
                    "category_only": reg_data.get("category_only", False),
                    "default_value": AttributeValue(
                        value_data_type=(
                            AttributeValueDataType(reg_data["value_type"]) if "value_type" in reg_data else None
                        ),
                        unit=reg_data["unit"] if "unit" in reg_data else None,
                    ),
                }
                for reg_data in config_data["plan_regulations"]
            }
        except KeyError as e:
            raise ConfigSyntaxError(str(e)) from e

    @classmethod
    def initialize_from_regulation_config(cls, regulation_configs: dict):
        for reg_attributes in cls._cache.values():
            additional_reg_data: dict = regulation_configs.get(
                reg_attributes["value"], {"category_only": False, "default_value": None}
            )
            reg_attributes |= additional_reg_data  # noqa: PLW2901

    @classmethod
    def get_id_by_type(cls, regulation_type: str) -> str | None:
        return cls.get_id_by_attribute("value", regulation_type)

    @classmethod
    def get_type_by_id(cls, id_: str) -> str | None:
        return cls.get_attribute_by_id("value", id_)

    @classmethod
    def get_name_by_id(cls, id_: str) -> str | None:
        return cls.get_attribute_by_id("name", id_)

    @classmethod
    def get_default_value_by_id(cls, id_: str) -> AttributeValue | None:
        attribute_value = cls._cache.get(id_, {}).get("default_value", "not_found")
        # Attribute value could be None and we don't want to access DB in that without a need
        if attribute_value != "not_found":
            return attribute_value
        return None


class VerbalRegulationType(AbstractCodeLayer):
    name = "Sanallisen määräyksen laji"

    category_only_codes: ClassVar[list[str]] = ["maarayksenTyyppi"]


class CategoryOfPublicityLayer(AbstractCodeLayer):
    name = "Julkisuusluokka"

    category_only_codes: ClassVar[list[str]] = []


class TypeOfDocumentLayer(AbstractCodeLayer):
    name = "Asiakirjatyyppi"

    category_only_codes: ClassVar[list[str]] = []


class LanguageLayer(AbstractCodeLayer):
    name = "Kieli"

    category_only_codes: ClassVar[list[str]] = []


class PersonalDataContentLayer(AbstractCodeLayer):
    name = "Henkilötietosisältö"

    category_only_codes: ClassVar[list[str]] = []


class RetentionTimeLayer(AbstractCodeLayer):
    name = "Säilytysaika"

    category_only_codes: ClassVar[list[str]] = []


class LegalEffectsLayer(AbstractCodeLayer):
    name = "Yleiskaavan oikeusvaikutus"

    category_only_codes: ClassVar[list[str]] = []


code_layers = AbstractCodeLayer.__subclasses__()
