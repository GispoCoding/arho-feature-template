from __future__ import annotations

import logging
from abc import abstractmethod
from numbers import Number
from string import Template
from textwrap import dedent
from typing import Any, ClassVar, Generator

from qgis.core import NULL, QgsExpressionContextUtils, QgsFeature, QgsProject, QgsVectorLayerUtils
from qgis.utils import iface

from arho_feature_template.core.models import (
    Plan,
    PlanFeature,
    Proposition,
    Regulation,
    RegulationGroup,
    RegulationLibrary,
)
from arho_feature_template.exceptions import FeatureNotFoundError, LayerEditableError, LayerNotFoundError
from arho_feature_template.project.layers import AbstractLayer
from arho_feature_template.project.layers.code_layers import PlanRegulationTypeLayer
from arho_feature_template.utils.misc_utils import LANGUAGE

logger = logging.getLogger(__name__)


class AbstractPlanLayer(AbstractLayer):
    filter_template: ClassVar[Template]

    @classmethod
    def apply_filter(cls, plan_id: str | None) -> None:
        """Apply a filter to the layer based on the plan_id."""
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
        feature["name"] = {LANGUAGE: model.name}
        feature["description"] = {LANGUAGE: model.description}
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
            name=feature["name"][LANGUAGE],
            description=feature["description"][LANGUAGE],
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
            id_=feature["id"],
        )

    @classmethod
    def get_plan_name(cls, plan_id: str) -> str:
        attribute_value = cls.get_attribute_value_by_another_attribute_value("name", "id", plan_id)
        return attribute_value[LANGUAGE] if attribute_value else "Nimetön"


class PlanFeatureLayer(AbstractPlanLayer):
    @classmethod
    def feature_from_model(cls, model: PlanFeature, plan_id: str | None = None) -> QgsFeature:
        if not model.geom:
            message = "Plan feature must have a geometry to be added to the layer"
            raise ValueError(message)

        feature = cls.initialize_feature_from_model(model)
        feature.setGeometry(model.geom)
        feature["name"] = {LANGUAGE: model.name if model.name else ""}
        feature["type_of_underground_id"] = model.type_of_underground_id
        feature["description"] = {LANGUAGE: model.description if model.description else ""}
        feature["plan_id"] = (
            plan_id
            if plan_id
            else QgsExpressionContextUtils.projectScope(QgsProject.instance()).variable("active_plan_id")
        )

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
            name=feature["name"][LANGUAGE],
            description=feature["description"][LANGUAGE],
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
        feature["name"] = {LANGUAGE: model.name}
        feature["type_of_plan_regulation_group_id"] = model.type_code_id
        feature["plan_id"] = (
            plan_id
            if plan_id
            else QgsExpressionContextUtils.projectScope(QgsProject.instance()).variable("active_plan_id")
        )
        feature["id"] = model.id_ if model.id_ else feature["id"]
        return feature

    @classmethod
    def model_from_feature(cls, feature: QgsFeature) -> RegulationGroup:
        return RegulationGroup(
            type_code_id=feature["type_of_plan_regulation_group_id"],
            name=feature["name"][LANGUAGE],
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
    def get_group_ids_for_feature(cls, feature_id: str, layer_name: str) -> Generator[str]:
        attribute = cls.layer_name_to_attribute_map.get(layer_name)
        if not attribute:
            raise LayerNotFoundError(layer_name)
        return cls.get_attribute_values_by_another_attribute_value("plan_regulation_group_id", attribute, feature_id)

    @classmethod
    def get_dangling_associations(
        cls, groups: list[RegulationGroup], feature_id: str, layer_name: str
    ) -> list[QgsFeature]:
        associations = RegulationGroupAssociationLayer.get_associations_for_feature(feature_id, layer_name)
        updated_group_ids = [group.id_ for group in groups]
        return [assoc for assoc in associations if assoc["plan_regulation_group_id"] not in updated_group_ids]


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

        feature["plan_regulation_group_id"] = model.regulation_group_id_
        feature["type_of_plan_regulation_id"] = model.config.id
        feature["unit"] = model.config.unit
        feature["text_value"] = {LANGUAGE: model.value if isinstance(model.value, str) else ""}
        feature["numeric_value"] = model.value if isinstance(model.value, Number) else NULL
        feature["name"] = {LANGUAGE: model.topic_tag if model.topic_tag else ""}
        feature["type_of_verbal_plan_regulation_id"] = model.verbal_regulation_type_id
        feature["id"] = model.id_ if model.id_ else feature["id"]
        # feature["plan_theme_id"]

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
            # Assuming only either text_value or numeric_value is defined
            value=feature["text_value"][LANGUAGE] if feature["text_value"][LANGUAGE] else feature["numeric_value"],
            additional_information=None,
            regulation_number=None,
            files=[],
            theme=None,
            topic_tag=None,
            regulation_group_id_=feature["plan_regulation_group_id"],
            verbal_regulation_type_id=feature["type_of_verbal_plan_regulation_id"],
            id_=feature["id"],
        )

    @classmethod
    def regulations_with_group_id(cls, group_id: str) -> Generator[QgsFeature]:
        return cls.get_features_by_attribute_value("plan_regulation_group_id", group_id)


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

        feature["name"] = {LANGUAGE: model.name}
        feature["text_value"] = {LANGUAGE: model.value}
        feature["plan_regulation_group_id"] = model.regulation_group_id_
        feature["ordering"] = model.proposition_number
        feature["plan_theme_id"] = model.theme_id
        feature["id"] = model.id_ if model.id_ else feature["id"]

        return feature

    @classmethod
    def model_from_feature(cls, feature: QgsFeature) -> Proposition:
        return Proposition(
            name=feature["name"][LANGUAGE],
            value=feature["text_value"][LANGUAGE],
            regulation_group_id_=feature["plan_regulation_group_id"],
            proposition_number=feature["ordering"],
            theme_id=feature["plan_theme_id"],
            id_=feature["id"],
        )

    @classmethod
    def propositions_with_group_id(cls, group_id: str) -> Generator[QgsFeature]:
        return cls.get_features_by_attribute_value("plan_regulation_group_id", group_id)


class DocumentLayer(AbstractPlanLayer):
    name = "Asiakirjat"
    filter_template = Template("plan_id = '$plan_id'")


class SourceDataLayer(AbstractPlanLayer):
    name = "Lähtötietoaineistot"
    filter_template = Template("plan_id = '$plan_id'")


plan_layers = AbstractPlanLayer.__subclasses__()
plan_layers.remove(PlanFeatureLayer)

plan_feature_layers = PlanFeatureLayer.__subclasses__()
plan_layers.extend(plan_feature_layers)
