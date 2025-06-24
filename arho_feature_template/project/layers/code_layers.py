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
from arho_feature_template.utils.misc_utils import LANGUAGE, deserialize_localized_text

if TYPE_CHECKING:
    from arho_feature_template.core.models import AttributeValue

logger = logging.getLogger(__name__)


class PlanType(str, enum.Enum):
    REGIONAL = "regional"
    GENERAL = "general"
    TOWN = "town"


class AbstractCodeLayer(AbstractLayer):
    _cache: ClassVar[dict[str, dict[str, Any]]] = {}
    _attributes_to_cache: ClassVar[list[str]] = []
    _localized_text_attributes: ClassVar[list[str]] = []

    category_only_codes: ClassVar[list[str]] = []

    @classmethod
    def build_cache(cls):
        """Builds a cache dictionary for the whole layer to avoid duplicate access to immutable code layer data.

        Iterates features of the layer and `_attributes_to_cache` for the layer class and stores
        found attributes to `_cache` class var dictionary (keys are code feature IDs, values are
        dictionaries where keys are attribute names and values are attribute values)."""
        if len(cls._attributes_to_cache) > 0:
            feats_cached_count = cls._cache_attributes()
            logger.info(
                "Built a cache for layer %s. %s features with %s attributes cached",
                cls.name,
                feats_cached_count,
                len(cls._attributes_to_cache),
            )

    @classmethod
    def _cache_attributes(cls) -> int:
        """Attributes are cached by their ID."""
        feats_cached_count = 0
        for feat in cls.get_features():
            attribute_dict = {}
            for attribute in cls._attributes_to_cache:
                # NOTE: 'feat.attribute(attribute)' returns None if attribute is not found
                attribute_value_to_cache = feat.attribute(attribute)
                if attribute in cls._localized_text_attributes:
                    attribute_value_to_cache = deserialize_localized_text(attribute_value_to_cache)
                attribute_dict[attribute] = attribute_value_to_cache
            cls._cache[feat["id"]] = attribute_dict
            feats_cached_count += 1
        return feats_cached_count

    @classmethod
    def cache_exists(cls) -> bool:
        return bool(cls._cache)

    @classmethod
    def get_cached_attributes(cls) -> dict[str, dict[str, Any]]:
        return cls._cache

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

    category_only_codes: ClassVar[list[str]] = [
        "tyyppi",
        "hairionTorjuntatarve",
        "merkittavyys",
        "eriTahojenTarpeisiinVaraaminen",
        "ymparistomuutoksenLaji",
        "rakentamisenOhjaus",
    ]

    @classmethod
    def get_additional_information_name(cls, info_type: str) -> str | None:
        attribute_value = cls.get_attribute_value_by_another_attribute_value("name", "value", info_type)
        return cast(str, attribute_value.get(LANGUAGE)) if attribute_value else None


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

    _attributes_to_cache: ClassVar[list] = ["value", "short_name", "name", "description", "level", "parent_id"]
    _localized_text_attributes: ClassVar[list] = ["name", "description"]
    # Attributes added from config: 'category_only' and 'default_value'

    PLAN_REGULATIONS_CONFIG_PATH = Path(os.path.join(resources_path(), "configs", "kaavamaaraykset.yaml"))
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
    def initialize(cls):
        super().initialize()
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
