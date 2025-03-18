from __future__ import annotations

import logging
from abc import abstractmethod
from string import Template
from textwrap import dedent
from typing import Any, ClassVar, Generator, cast

from qgis.core import QgsFeature, QgsVectorLayerUtils

from arho_feature_template.core.models import (
    AdditionalInformation,
    AdditionalInformationConfigLibrary,
    AttributeValue,
    Document,
    LifeCycle,
    Plan,
    PlanFeature,
    Proposition,
    Regulation,
    RegulationGroup,
    RegulationLibrary,
)
from arho_feature_template.exceptions import FeatureNotFoundError, LayerEditableError, LayerNotFoundError
from arho_feature_template.project.layers import AbstractLayer
from arho_feature_template.project.layers.code_layers import PlanRegulationTypeLayer, PlanTypeLayer
from arho_feature_template.utils.misc_utils import (
    deserialize_localized_text,
    get_active_plan_id,
    iface,
    serialize_localized_text,
)

logger = logging.getLogger(__name__)


class AbstractPlanLayer(AbstractLayer):
    filter_template: ClassVar[Template | None]

    @classmethod
    def apply_filter(cls, plan_id: str | None) -> None:
        """Apply a filter to the layer based on the plan_id."""
        if cls.filter_template is None:
            return
        filter_expression = cls.filter_template.substitute(plan_id=plan_id) if plan_id else ""
        layer = cls.get_from_project()
        if layer.isEditable():
            raise LayerEditableError(cls.name)

        if not layer:
            logger.warning("Layer %s not found", cls.name)
            return None
        result = layer.setSubsetString(filter_expression)
        if result is False:
            iface.messageBar().pushMessage(
                "Error",
                f"Failed to filter layer {cls.name} with query {filter_expression}",
                level=3,
            )

    @classmethod
    @abstractmethod
    def feature_from_model(cls, model: Any) -> QgsFeature:
        raise NotImplementedError

    @classmethod
    def initialize_feature_from_model(cls, model: Any) -> QgsFeature:
        if model.id_ is not None:  # Expects all plan layer models to have 'id_' attribute
            feature = cls.get_feature_by_id(model.id_, no_geometries=False)
            if not feature:
                raise FeatureNotFoundError(model.id_, cls.name)
        else:
            feature = QgsVectorLayerUtils.createFeature(cls.get_from_project())
        return feature


class PlanLayer(AbstractPlanLayer):
    name = "Kaava"
    filter_template = Template("id = '$plan_id'")

    @classmethod
    def feature_from_model(cls, model: Plan) -> QgsFeature:
        if not model.geom:
            message = "Plan must have a geometry to be added to the layer"
            raise ValueError(message)

        feature = cls.initialize_feature_from_model(model)
        feature.setGeometry(model.geom)
        feature["name"] = serialize_localized_text(model.name)
        feature["description"] = serialize_localized_text(model.description)
        feature["permanent_plan_identifier"] = model.permanent_plan_identifier
        feature["record_number"] = model.record_number
        feature["producers_plan_identifier"] = model.producers_plan_identifier
        feature["matter_management_identifier"] = model.matter_management_identifier
        feature["plan_type_id"] = model.plan_type_id
        feature["lifecycle_status_id"] = model.lifecycle_status_id
        feature["organisation_id"] = model.organisation_id

        return feature

    @classmethod
    def model_from_feature(cls, feature: QgsFeature) -> Plan:
        general_regulation_features = [
            RegulationGroupLayer.get_feature_by_id(group_id)
            for group_id in RegulationGroupAssociationLayer.get_group_ids_for_feature(feature["id"], cls.name)
        ]
        return Plan(
            geom=feature.geometry(),
            name=deserialize_localized_text(feature["name"]),
            description=deserialize_localized_text(feature["description"]),
            permanent_plan_identifier=feature["permanent_plan_identifier"],
            record_number=feature["record_number"],
            producers_plan_identifier=feature["producers_plan_identifier"],
            matter_management_identifier=feature["matter_management_identifier"],
            plan_type_id=feature["plan_type_id"],
            lifecycle_status_id=feature["lifecycle_status_id"],
            organisation_id=feature["organisation_id"],
            general_regulations=[
                RegulationGroupLayer.model_from_feature(feat)
                for feat in general_regulation_features
                if feat is not None
            ],
            legal_effect_ids=list(LegalEffectAssociationLayer.get_legal_effect_ids_for_plan(feature["id"])),
            documents=[
                DocumentLayer.model_from_feature(feat)
                for feat in DocumentLayer.get_features_by_attribute_value("plan_id", feature["id"])
            ],
            id_=feature["id"],
            lifecycles=[
                LifeCycleLayer.model_from_feature(feat)
                for feat in LifeCycleLayer.get_features_by_plan_id(feature["id"])
                if feat is not None
            ],
        )

    @classmethod
    def get_plan_name(cls, plan_id: str) -> str:
        attribute_value = cls.get_attribute_value_by_another_attribute_value("name", "id", plan_id)
        name = deserialize_localized_text(attribute_value)

        return name or "Nimetön"

    @classmethod
    def get_plan_type_name(cls, plan_id: str) -> str | None:
        type_id = cls.get_attribute_value_by_another_attribute_value("plan_type_id", "id", plan_id)
        if type_id is None:
            return None
        attribute_value = PlanTypeLayer.get_attribute_value_by_another_attribute_value("name", "id", cast(str, type_id))
        return deserialize_localized_text(attribute_value)


class PlanFeatureLayer(AbstractPlanLayer):
    @classmethod
    def feature_from_model(cls, model: PlanFeature, plan_id: str | None = None) -> QgsFeature:
        if not model.geom:
            message = "Plan feature must have a geometry to be added to the layer"
            raise ValueError(message)

        feature = cls.initialize_feature_from_model(model)
        feature.setGeometry(model.geom)
        feature["name"] = serialize_localized_text(model.name)
        feature["type_of_underground_id"] = model.type_of_underground_id
        feature["description"] = serialize_localized_text(model.description)
        feature["plan_id"] = plan_id if plan_id else get_active_plan_id()

        return feature

    @classmethod
    def model_from_feature(cls, feature: QgsFeature) -> PlanFeature:
        regulation_group_features = [
            RegulationGroupLayer.get_feature_by_id(group_id)
            for group_id in RegulationGroupAssociationLayer.get_group_ids_for_feature(feature["id"], cls.name)
        ]

        return PlanFeature(
            geom=feature.geometry(),
            type_of_underground_id=feature["type_of_underground_id"],
            layer_name=cls.get_from_project().name(),
            name=deserialize_localized_text(feature["name"]),
            description=deserialize_localized_text(feature["description"]),
            regulation_groups=[
                RegulationGroupLayer.model_from_feature(feat) for feat in regulation_group_features if feat is not None
            ],
            plan_id=feature["plan_id"],
            id_=feature["id"],
        )


class LandUsePointLayer(PlanFeatureLayer):
    name = "Maankäytön kohteet"
    filter_template = Template("plan_id = '$plan_id'")


class OtherPointLayer(PlanFeatureLayer):
    name = "Muut pisteet"
    filter_template = Template("plan_id = '$plan_id'")


class LineLayer(PlanFeatureLayer):
    name = "Viivat"
    filter_template = Template("plan_id = '$plan_id'")


class LandUseAreaLayer(PlanFeatureLayer):
    name = "Aluevaraus"
    filter_template = Template("plan_id = '$plan_id'")


class OtherAreaLayer(PlanFeatureLayer):
    name = "Osa-alue"
    filter_template = Template("plan_id = '$plan_id'")


class RegulationGroupLayer(AbstractPlanLayer):
    name = "Kaavamääräysryhmät"
    filter_template = Template("plan_id = '$plan_id'")

    @classmethod
    def feature_from_model(cls, model: RegulationGroup, plan_id: str | None = None) -> QgsFeature:
        feature = cls.initialize_feature_from_model(model)

        feature["short_name"] = model.short_name if model.short_name else None
        feature["name"] = serialize_localized_text(model.name)
        feature["type_of_plan_regulation_group_id"] = model.type_code_id
        feature["plan_id"] = plan_id if plan_id else get_active_plan_id()
        feature["id"] = model.id_ if model.id_ else feature["id"]
        return feature

    @classmethod
    def model_from_feature(cls, feature: QgsFeature) -> RegulationGroup:
        return RegulationGroup(
            type_code_id=feature["type_of_plan_regulation_group_id"],
            name=deserialize_localized_text(feature["name"]),
            short_name=feature["short_name"],
            color_code=None,
            group_number=None,
            regulations=[
                PlanRegulationLayer.model_from_feature(feat)
                for feat in PlanRegulationLayer.regulations_with_group_id(feature["id"])
            ],
            propositions=[
                PlanPropositionLayer.model_from_feature(feat)
                for feat in PlanPropositionLayer.propositions_with_group_id(feature["id"])
            ],
            id_=feature["id"],
        )


class RegulationGroupAssociationLayer(AbstractPlanLayer):
    name = "Kaavamääräysryhmien assosiaatiot"
    filter_template = Template(
        dedent(
            """\
            EXISTS (
                SELECT 1
                FROM hame.plan_regulation_group prg
                WHERE
                    hame.regulation_group_association.plan_regulation_group_id = prg.id
                    AND prg.plan_id = '$plan_id'
            )"""
        )
    )

    layer_name_to_attribute_map: ClassVar[dict[str, str]] = {
        LandUsePointLayer.name: "land_use_point_id",
        OtherAreaLayer.name: "other_area_id",
        OtherPointLayer.name: "other_point_id",
        LandUseAreaLayer.name: "land_use_area_id",
        LineLayer.name: "line_id",
        PlanLayer.name: "plan_id",
    }

    @classmethod
    def feature_from(cls, regulation_group_id: str, layer_name: str, feature_id: str) -> QgsFeature | None:
        layer = cls.get_from_project()
        attribute = cls.layer_name_to_attribute_map.get(layer_name)

        feature = QgsVectorLayerUtils.createFeature(layer)
        feature["plan_regulation_group_id"] = regulation_group_id

        if not attribute:
            msg = f"Unrecognized layer name given for saving regulation group association: {layer_name}"
            raise ValueError(msg)
        feature[attribute] = feature_id

        return feature

    @classmethod
    def association_exists(cls, regulation_group_id: str, layer_name: str, feature_id: str):
        attribute = cls.layer_name_to_attribute_map.get(layer_name)
        for feature in cls.get_features_by_attribute_value("plan_regulation_group_id", regulation_group_id):
            if feature[attribute] == feature_id:
                return True
        return False

    @classmethod
    def get_associations_for_feature(cls, feature_id: str, layer_name: str) -> Generator[QgsFeature]:
        attribute = cls.layer_name_to_attribute_map.get(layer_name)
        if not attribute:
            raise LayerNotFoundError(layer_name)
        return cls.get_features_by_attribute_value(attribute, feature_id)

    @classmethod
    def get_associations_for_regulation_group(cls, group_id: str) -> Generator[QgsFeature]:
        return cls.get_features_by_attribute_value("plan_regulation_group_id", group_id)

    @classmethod
    def get_associations_for_regulation_group_exclude_feature(
        cls, group_id: str, excluded_feature_id: str, excluded_feature_layer_name: str
    ) -> list[QgsFeature]:
        attribute = RegulationGroupAssociationLayer.layer_name_to_attribute_map.get(excluded_feature_layer_name)
        return [
            association
            for association in cls.get_associations_for_regulation_group(group_id)
            if association[attribute] != excluded_feature_id
        ]

    @classmethod
    def get_group_ids_for_feature(cls, feature_id: str, layer_name: str) -> Generator[str]:
        attribute = cls.layer_name_to_attribute_map.get(layer_name)
        if not attribute:
            raise LayerNotFoundError(layer_name)
        return cls.get_attribute_values_by_another_attribute_value("plan_regulation_group_id", attribute, feature_id)

    @classmethod
    def get_dangling_associations(  # by_feature
        cls, groups: list[RegulationGroup], feature_id: str, layer_name: str
    ) -> list[QgsFeature]:
        associations = RegulationGroupAssociationLayer.get_associations_for_feature(feature_id, layer_name)
        updated_group_ids = [group.id_ for group in groups]
        return [assoc for assoc in associations if assoc["plan_regulation_group_id"] not in updated_group_ids]


def attribute_value_model_from_feature(feature: QgsFeature) -> AttributeValue:
    return AttributeValue(
        value_data_type=feature["value_data_type"],
        numeric_value=feature["numeric_value"],
        numeric_range_min=feature["numeric_range_min"],
        numeric_range_max=feature["numeric_range_max"],
        unit=feature["unit"],
        text_value=deserialize_localized_text(feature["text_value"]),
        text_syntax=feature["text_syntax"],
        code_list=feature["code_list"],
        code_value=feature["code_value"],
        code_title=deserialize_localized_text(feature["code_title"]),
        height_reference_point=feature["height_reference_point"],
    )


def update_feature_from_attribute_value_model(value: AttributeValue | None, feature: QgsFeature):
    if value is None:
        return
    feature["value_data_type"] = value.value_data_type.value if value.value_data_type is not None else None
    feature["numeric_value"] = value.numeric_value
    feature["numeric_range_min"] = value.numeric_range_min
    feature["numeric_range_max"] = value.numeric_range_max
    feature["unit"] = value.unit
    feature["text_value"] = serialize_localized_text(value.text_value)
    feature["text_syntax"] = value.text_syntax
    feature["code_list"] = value.code_list
    feature["code_value"] = value.code_value
    feature["code_title"] = serialize_localized_text(value.code_title)
    feature["height_reference_point"] = value.height_reference_point


class PlanRegulationLayer(AbstractPlanLayer):
    name = "Kaavamääräys"
    filter_template = Template(
        dedent(
            """\
            EXISTS (
                SELECT 1
                FROM hame.plan_regulation_group prg
                WHERE
                    hame.plan_regulation.plan_regulation_group_id = prg.id
                    AND prg.plan_id = '$plan_id'
            )"""
        )
    )

    @classmethod
    def feature_from_model(cls, model: Regulation) -> QgsFeature:
        feature = cls.initialize_feature_from_model(model)

        feature["plan_regulation_group_id"] = model.regulation_group_id
        feature["type_of_plan_regulation_id"] = model.config.id

        feature["subject_identifiers"] = model.topic_tag.split(",") if model.topic_tag else None

        update_feature_from_attribute_value_model(model.value, feature)

        return feature

    @classmethod
    def model_from_feature(cls, feature: QgsFeature) -> Regulation:
        regulation_code = PlanRegulationTypeLayer.get_regulation_type_by_id(feature["type_of_plan_regulation_id"])
        if not regulation_code:
            msg = f"Regulation not found for regulation ID {feature['type_of_plan_regulation_id']}"
            raise ValueError(msg)
        config = RegulationLibrary.get_regulation_by_code(regulation_code)
        if not config:
            msg = f"Regulation config not found for {regulation_code}"
            raise ValueError(msg)

        return Regulation(
            config=config,
            value=attribute_value_model_from_feature(feature),
            additional_information=[
                AdditionalInformationLayer.model_from_feature(ai_feat)
                for ai_feat in AdditionalInformationLayer.get_features_by_attribute_value(
                    "plan_regulation_id", feature["id"]
                )
            ],
            regulation_number=None,
            files=[],
            theme=None,
            topic_tag=None,
            regulation_group_id=feature["plan_regulation_group_id"],
            verbal_regulation_type_ids=(
                list(TypeOfVerbalRegulationAssociationLayer.get_verbal_type_ids_for_regulation(feature["id"]))
            ),
            id_=feature["id"],
        )

    @classmethod
    def regulations_with_group_id(cls, group_id: str) -> Generator[QgsFeature]:
        return cls.get_features_by_attribute_value("plan_regulation_group_id", group_id)

    @classmethod
    def get_regulations_to_delete(cls, regulations: list[Regulation], group_id: str) -> list[QgsFeature]:
        updated_regulation_ids = [regulation.id_ for regulation in regulations]
        return [
            reg
            for reg in cls.get_features_by_attribute_value("plan_regulation_group_id", group_id)
            if reg["id"] not in updated_regulation_ids
        ]


class TypeOfVerbalRegulationAssociationLayer(AbstractPlanLayer):
    name = "Sanallisten kaavamääräyksien lajien assosiaatiot"
    filter_template = Template(
        dedent(
            """\
            EXISTS (
                SELECT 1
                FROM
                    hame.plan_regulation_group prg
                    JOIN hame.plan_regulation pr
                        ON (prg.id = pr.plan_regulation_group_id)
                WHERE
                    hame.type_of_verbal_regulation_association.plan_regulation_id = pr.id
                    AND prg.plan_id = '$plan_id'
            )"""
        )
    )

    @classmethod
    def feature_from(cls, regulation_id: str, type_of_verbal_regulation_id: str) -> QgsFeature | None:
        layer = cls.get_from_project()

        feature = QgsVectorLayerUtils.createFeature(layer)
        feature["plan_regulation_id"] = regulation_id
        feature["type_of_verbal_plan_regulation_id"] = type_of_verbal_regulation_id
        return feature

    @classmethod
    def association_exists(cls, regulation_id: str, type_of_verbal_regulation_id: str) -> bool:
        for feature in cls.get_features_by_attribute_value("plan_regulation_id", regulation_id):
            if feature["type_of_verbal_plan_regulation_id"] == type_of_verbal_regulation_id:
                return True
        return False

    @classmethod
    def get_associations_for_regulation(cls, regulation_id: str) -> Generator[QgsFeature]:
        return cls.get_features_by_attribute_value("plan_regulation_id", regulation_id)

    @classmethod
    def get_verbal_type_ids_for_regulation(cls, regulation_id: str) -> Generator[QgsFeature]:
        return cls.get_attribute_values_by_another_attribute_value(
            "type_of_verbal_plan_regulation_id", "plan_regulation_id", regulation_id
        )

    @classmethod
    def get_dangling_associations(cls, regulation_id: str, updated_type_ids: list[str]) -> list[QgsFeature]:
        associations = cls.get_associations_for_regulation(regulation_id)
        return [assoc for assoc in associations if assoc["type_of_verbal_plan_regulation_id"] not in updated_type_ids]


class LegalEffectAssociationLayer(AbstractPlanLayer):
    name = "Yleiskaavan oikeusvaikutusten assosiaatiot"
    filter_template = None

    @classmethod
    def feature_from(cls, plan_id: str, legal_effect_id: str) -> QgsFeature | None:
        layer = cls.get_from_project()

        feature = QgsVectorLayerUtils.createFeature(layer)
        feature["plan_id"] = plan_id
        feature["legal_effects_of_master_plan_id"] = legal_effect_id
        return feature

    @classmethod
    def association_exists(cls, plan_id: str, legal_effect_id: str) -> bool:
        for feature in cls.get_features_by_attribute_value("plan_id", plan_id):
            if feature["legal_effects_of_master_plan_id"] == legal_effect_id:
                return True
        return False

    @classmethod
    def get_associations_for_plan(cls, plan_id: str) -> Generator[QgsFeature]:
        return cls.get_features_by_attribute_value("plan_id", plan_id)

    @classmethod
    def get_legal_effect_ids_for_plan(cls, plan_id: str) -> Generator[QgsFeature]:
        return cls.get_attribute_values_by_another_attribute_value(
            "legal_effects_of_master_plan_id", "plan_id", plan_id
        )

    @classmethod
    def get_dangling_associations(cls, plan_id: str, updated_legal_effect_ids: list[str]) -> list[QgsFeature]:
        associations = cls.get_associations_for_plan(plan_id)
        return [
            assoc for assoc in associations if assoc["legal_effects_of_master_plan_id"] not in updated_legal_effect_ids
        ]


class PlanPropositionLayer(AbstractPlanLayer):
    name = "Kaavasuositus"
    filter_template = Template(
        dedent(
            """\
            EXISTS (
                SELECT 1
                FROM hame.plan_regulation_group rg
                WHERE
                    hame.plan_proposition.plan_regulation_group_id = rg.id
                    AND rg.plan_id = '$plan_id'
            )"""
        )
    )

    @classmethod
    def feature_from_model(cls, model: Proposition) -> QgsFeature:
        feature = cls.initialize_feature_from_model(model)

        feature["text_value"] = serialize_localized_text(model.value)
        feature["plan_regulation_group_id"] = model.regulation_group_id
        feature["ordering"] = model.proposition_number
        feature["plan_theme_id"] = model.theme_id
        feature["id"] = model.id_ if model.id_ else feature["id"]

        return feature

    @classmethod
    def model_from_feature(cls, feature: QgsFeature) -> Proposition:
        proposition_value = deserialize_localized_text(feature["text_value"])
        if not proposition_value:
            msg = "Proposition value cannot be empty."
            raise ValueError(msg)
        return Proposition(
            value=proposition_value,
            regulation_group_id=feature["plan_regulation_group_id"],
            proposition_number=feature["ordering"],
            theme_id=feature["plan_theme_id"],
            id_=feature["id"],
        )

    @classmethod
    def propositions_with_group_id(cls, group_id: str) -> Generator[QgsFeature]:
        return cls.get_features_by_attribute_value("plan_regulation_group_id", group_id)

    @classmethod
    def get_propositions_to_delete(cls, propositions: list[Proposition], group_id: str) -> list[QgsFeature]:
        updated_proposition_ids = [proposition.id_ for proposition in propositions]
        return [
            prop
            for prop in cls.get_features_by_attribute_value("plan_regulation_group_id", group_id)
            if prop["id"] not in updated_proposition_ids
        ]


class DocumentLayer(AbstractPlanLayer):
    name = "Asiakirjat"
    filter_template = Template("plan_id = '$plan_id'")

    @classmethod
    def feature_from_model(cls, model: Document) -> QgsFeature:
        feature = cls.initialize_feature_from_model(model)

        feature["name"] = serialize_localized_text(model.name)
        feature["url"] = model.url
        feature["type_of_document_id"] = model.type_of_document_id
        feature["decision"] = model.decision
        feature["category_of_publicity_id"] = model.category_of_publicity_id
        feature["personal_data_content_id"] = model.personal_data_content_id
        feature["retention_time_id"] = model.retention_time_id
        feature["language_id"] = model.language_id
        feature["document_date"] = model.document_date
        feature["arrival_date"] = model.arrival_date
        feature["confirmation_date"] = model.confirmation_date
        feature["plan_id"] = model.plan_id
        feature["id"] = model.id_ if model.id_ else feature["id"]

        return feature

    @classmethod
    def model_from_feature(cls, feature: QgsFeature) -> Document:
        return Document(
            name=deserialize_localized_text(feature["name"]),
            url=feature["url"],
            type_of_document_id=feature["type_of_document_id"],
            decision=feature["decision"],
            category_of_publicity_id=feature["category_of_publicity_id"],
            personal_data_content_id=feature["personal_data_content_id"],
            retention_time_id=feature["retention_time_id"],
            language_id=feature["language_id"],
            document_date=feature["document_date"],
            arrival_date=feature["arrival_date"],
            confirmation_date=feature["confirmation_date"],
            plan_id=feature["plan_id"],
            id_=feature["id"],
        )

    @classmethod
    def get_documents_to_delete(cls, documents: list[Document], plan_id: str) -> list[QgsFeature]:
        updated_document_ids = [doc.id_ for doc in documents]
        return [
            doc
            for doc in cls.get_features_by_attribute_value("plan_id", plan_id)
            if doc["id"] not in updated_document_ids
        ]


class SourceDataLayer(AbstractPlanLayer):
    name = "Lähtötietoaineistot"
    filter_template = Template("plan_id = '$plan_id'")


class AdditionalInformationLayer(AbstractPlanLayer):
    name = "Kaavamääräyksen lisätiedot"
    filter_template = Template(
        dedent(
            """\
            EXISTS (
                SELECT 1
                FROM
                    hame.plan_regulation_group prg
                    JOIN hame.plan_regulation pr
                        ON (prg.id = pr.plan_regulation_group_id)
                WHERE
                    hame.additional_information.plan_regulation_id = pr.id
                    AND prg.plan_id = '$plan_id'
            )"""
        )
    )

    @classmethod
    def feature_from_model(cls, model: AdditionalInformation) -> QgsFeature:
        feature = cls.initialize_feature_from_model(model)

        feature["plan_regulation_id"] = model.plan_regulation_id
        feature["type_additional_information_id"] = model.config.id

        update_feature_from_attribute_value_model(model.value, feature)

        return feature

    @classmethod
    def model_from_feature(cls, feature: QgsFeature) -> AdditionalInformation:
        return AdditionalInformation(
            config=AdditionalInformationConfigLibrary.get_config_by_id(feature["type_additional_information_id"]),
            id_=feature["id"],
            plan_regulation_id=feature["plan_regulation_id"],
            type_additional_information_id=feature["type_additional_information_id"],
            value=attribute_value_model_from_feature(feature),
        )


class LifeCycleLayer(AbstractPlanLayer):
    name = "Elinkaaren päiväykset"
    filter_template = None

    @classmethod
    def feature_from_model(cls, model: LifeCycle) -> QgsFeature:
        feature = cls.initialize_feature_from_model(model)

        feature["id"] = model.id_ if model.id_ else feature["id"]
        feature["lifecycle_status_id"] = model.status_id
        feature["starting_at"] = model.starting_at
        feature["ending_at"] = model.ending_at if model.ending_at else None
        feature["plan_id"] = model.plan_id
        feature["land_use_area_id"] = model.land_use_are_id
        feature["other_area_id"] = model.other_area_id
        feature["line_id"] = model.line_id
        feature["land_use_point_id"] = model.land_use_point_id
        feature["other_point_id"] = model.other_point_id
        feature["plan_regulation_id"] = model.plan_regulation_id
        feature["plan_proposition_id"] = model.plan_proposition_id

        return feature

    @classmethod
    def model_from_feature(cls, feature: QgsFeature) -> LifeCycle:
        return LifeCycle(
            id_=feature["id"],
            status_id=feature["lifecycle_status_id"],
            starting_at=feature["starting_at"],
            ending_at=feature["ending_at"],
            plan_id=feature["plan_id"],
            land_use_are_id=feature["land_use_area_id"],
            other_area_id=feature["other_area_id"],
            line_id=feature["line_id"],
            land_use_point_id=feature["land_use_point_id"],
            other_point_id=feature["other_point_id"],
            plan_regulation_id=feature["plan_regulation_id"],
            plan_proposition_id=feature["plan_proposition_id"],
        )

    @classmethod
    def get_features_by_plan_id(cls, plan_id: str) -> list[QgsFeature]:
        return list(cls.get_features_by_attribute_value("plan_id", plan_id))


FEATURE_LAYER_NAME_TO_CLASS_MAP: dict[str, type[PlanFeatureLayer]] = {
    LandUsePointLayer.name: LandUsePointLayer,
    OtherPointLayer.name: OtherPointLayer,
    LineLayer.name: LineLayer,
    OtherAreaLayer.name: OtherAreaLayer,
    LandUseAreaLayer.name: LandUseAreaLayer,
}

plan_layers = AbstractPlanLayer.__subclasses__()
plan_layers.remove(PlanFeatureLayer)

plan_feature_layers = PlanFeatureLayer.__subclasses__()
plan_layers.extend(plan_feature_layers)
