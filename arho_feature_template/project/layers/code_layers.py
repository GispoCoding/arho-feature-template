from __future__ import annotations

import enum
from typing import ClassVar, cast

from arho_feature_template.exceptions import LayerNameNotFoundError
from arho_feature_template.project.layers import AbstractLayer
from arho_feature_template.utils.misc_utils import LANGUAGE


class PlanType(str, enum.Enum):
    REGIONAL = "regional"
    GENERAL = "general"
    TOWN = "town"


class AbstractCodeLayer(AbstractLayer):
    category_only_codes: ClassVar[list[str]] = []


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

    # TODO: Implement. Currently, this is not used and information needed to construct plan regulation codes
    # is defined in a separate config file
    category_only_codes: ClassVar[list[str]] = []
    verbal_regulation_codes: ClassVar[list[str]] = [
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
    def get_regulation_type_by_id(cls, _id: str) -> str | None:
        attribute_value = cls.get_attribute_value_by_another_attribute_value("value", "id", _id)
        return cast(str, attribute_value) if attribute_value else attribute_value


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
