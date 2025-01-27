from __future__ import annotations

import logging
from string import Template
from typing import TYPE_CHECKING, ClassVar

from qgis.core import NULL, QgsExpressionContextUtils, QgsFeature, QgsProject, QgsVectorLayerUtils
from qgis.utils import iface

from arho_feature_template.core.models import LifeCycle
from arho_feature_template.exceptions import FeatureNotFoundError, LayerEditableError
from arho_feature_template.project.layers import AbstractLayer
from arho_feature_template.project.layers.code_layers import LifeCycleStatusLayer
from arho_feature_template.utils.misc_utils import LANGUAGE

if TYPE_CHECKING:
    from datetime import datetime

logger = logging.getLogger(__name__)


class AbstractLifeCycleLayer(AbstractLayer):
    filter_template: ClassVar[Template]

    @classmethod
    def apply_filter(cls, plan_id: int | None) -> None:
        """Apply a filter to the layer based on the status_id."""
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
    def initialize_feature_from_model(cls, model: LifeCycle) -> QgsFeature:
        if model.id_:
            feature = cls.get_feature_by_id(model.id_, no_geometries=True)
            if not feature:
                raise FeatureNotFoundError(model.id_, cls.name)
        else:
            feature = QgsVectorLayerUtils.createFeature(cls.get_from_project())
        return feature


class LifeCycleLayer(AbstractLifeCycleLayer):
    name = "Elinkaaren päiväykset"
    filter_template = Template("plan_id = '$plan_id'")

    @classmethod
    def feature_from_model(cls, model: LifeCycle, plan_id: str | None = None) -> QgsFeature:
        feature = cls.initialize_feature_from_model(model)
        feature["id"] = model.id_
        feature["lifecycle_status_id"] = model.status_id
        feature["starting_at"] = model.starting_at
        feature["ending_at"] = model.ending_at if model.ending_at else None
        feature["plan_id"] = (
            plan_id
            if plan_id
            else QgsExpressionContextUtils.projectScope(QgsProject.instance()).variable("active_plan_id")
        )
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
            ending_at=feature["ending_at"] if feature["ending_at"] else None,
            plan_id=feature["plan_id"],
            land_use_are_id=feature["land_use_area_id"] if feature["land_use_area_id"] else None,
            other_area_id=feature["other_area_id"] if feature["other_area_id"] else None,
            line_id=feature["line_id"] if feature["line_id"] else None,
            land_use_point_id=feature["land_use_point_id"] if feature["land_use_point_id"] else None,
            other_point_id=feature["other_point_id"] if feature["other_point_id"] else None,
            plan_regulation_id=feature["plan_regulation_id"] if feature["plan_regulation_id"] else None,
            plan_proposition_id=feature["plan_proposition_id"] if feature["plan_proposition_id"] else None,
        )
