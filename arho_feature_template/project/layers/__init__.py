from __future__ import annotations

from abc import ABC
from typing import TYPE_CHECKING, Any, ClassVar, Generator

from qgis.core import QgsFeatureRequest, QgsProject, QgsVectorLayer

from arho_feature_template.utils.project_utils import get_vector_layer_from_project

if TYPE_CHECKING:
    from qgis.core import QgsFeature


class AbstractLayer(ABC):
    name: ClassVar[str]

    @classmethod
    def exists(cls) -> bool:
        project = QgsProject.instance()
        if not project:
            return False

        layers = project.mapLayersByName(cls.name)
        if not layers:
            return False

        return bool([layer for layer in layers if isinstance(layer, QgsVectorLayer)])

    @classmethod
    def get_from_project(cls) -> QgsVectorLayer:
        return get_vector_layer_from_project(cls.name)

    @classmethod
    def get_features(cls):
        return cls.get_from_project().getFeatures()

    @classmethod
    def get_features_by_attribute_value(
        cls,
        attribute: str,
        value: str,
        no_geometries: bool = True,  # noqa: FBT001, FBT002
    ) -> Generator[QgsFeature]:
        layer = cls.get_from_project()
        request = QgsFeatureRequest().setFilterExpression(f"\"{attribute}\"='{value}'")
        if no_geometries:
            request.setFlags(QgsFeatureRequest.NoGeometry)
        yield from layer.getFeatures(request)

    @classmethod
    def get_feature_by_attribute_value(
        cls,
        attribute: str,
        value: str,
        no_geometries: bool = True,  # noqa: FBT001, FBT002
    ) -> QgsFeature | None:
        gen = cls.get_features_by_attribute_value(attribute, value, no_geometries)
        return next(gen, None)

    @classmethod
    def get_feature_by_id(cls, id_: str, no_geometries: bool = True) -> QgsFeature | None:  # noqa: FBT001, FBT002
        return cls.get_feature_by_attribute_value("id", id_, no_geometries)

    @classmethod
    def get_attribute_values_by_another_attribute_value(
        cls, target_attribute: str, filter_attribute: str, filter_value: str
    ) -> Generator[Any]:
        layer = cls.get_from_project()
        request = QgsFeatureRequest().setFilterExpression(f"\"{filter_attribute}\"='{filter_value}'")
        request.setSubsetOfAttributes([target_attribute], layer.fields())
        request.setFlags(QgsFeatureRequest.NoGeometry)
        for feature in layer.getFeatures(request):
            yield feature[target_attribute]

    @classmethod
    def get_attribute_value_by_another_attribute_value(
        cls, target_attribute: str, filter_attribute: str, filter_value: str
    ) -> Any | None:
        gen = cls.get_attribute_values_by_another_attribute_value(target_attribute, filter_attribute, filter_value)
        return next(gen, None)
