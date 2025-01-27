from __future__ import annotations

from typing import ClassVar, cast

from arho_feature_template.exceptions import LayerNameNotFoundError
from arho_feature_template.project.layers import AbstractLayer
from arho_feature_template.utils.misc_utils import LANGUAGE


class AbstractCodeLayer(AbstractLayer): ...


class PlanTypeLayer(AbstractCodeLayer):
    name = "Kaavalaji"


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

    @classmethod
    def get_additional_information_name(cls, info_type: str) -> str | None:
        attribute_value = cls.get_attribute_value_by_another_attribute_value("name", "value", info_type)
        return cast(str, attribute_value[LANGUAGE]) if attribute_value else None


class PlanRegulationGroupTypeLayer(AbstractCodeLayer):
    name = "Kaavamääräysryhmän tyyppi"

    LAYER_NAME_TO_REGULATION_GROUP_TYPE_MAP: ClassVar[dict[str, str]] = {
        "Kaava": "generalRegulations",
        "Aluevaraus": "landUseRegulations",
        "Osa-alue": "otherAreaRegulations",
        "Viiva": "lineRegulations",
        "Muu piste": "otherPointRegulations",
        "Maankäytön kohteet": "landUseRegulations",
    }

    @classmethod
    def get_id_by_feature_layer_name(cls, layer_name: str) -> str | None:
        regulation_group_type = cls.LAYER_NAME_TO_REGULATION_GROUP_TYPE_MAP.get(layer_name)
        if not regulation_group_type:
            raise LayerNameNotFoundError(layer_name)
        attribute_value = cls.get_attribute_value_by_another_attribute_value("id", "value", regulation_group_type)
        return cast(str, attribute_value) if attribute_value else attribute_value


class PlanRegulationTypeLayer(AbstractCodeLayer):
    name = "Kaavamääräyslaji"

    @classmethod
    def get_regulation_type_by_id(cls, _id: str) -> str | None:
        attribute_value = cls.get_attribute_value_by_another_attribute_value("value", "id", _id)
        return cast(str, attribute_value) if attribute_value else attribute_value


code_layers = AbstractCodeLayer.__subclasses__()
