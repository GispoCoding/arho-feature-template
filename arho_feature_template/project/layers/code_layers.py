from __future__ import annotations

from qgis.core import QgsFeature

from arho_feature_template.project.layers import AbstractLayer
from arho_feature_template.core.models import RegulationConfig


class AbstractCodeLayer(AbstractLayer): ...


class PlanTypeLayer(AbstractCodeLayer):
    name = "Kaavalaji"

    # NOTE: Perhaps this ("model_from_feature") should be method of PlanTypeLayer class?
    @classmethod
    def generate_models(cls, language: str = "fin") -> list[RegulationConfig]:
        """
        Initialize PlanRegulationConfig from QgsFeature.

        Child regulations, value type ,category only and unit need to be set separately.
        """
        layer = cls.get_from_project()
        return [cls.model_from_feature(feature, language) for feature in layer.getFeatures()]


    @staticmethod
    def model_from_feature(feature: QgsFeature, language: str) -> RegulationConfig:
        """
        Initialize PlanRegulationConfig from QgsFeature.

        Child regulations, value type ,category only and unit need to be set separately.
        """
        return RegulationConfig(
            id=feature["id"],
            regulation_code=feature["value"],
            name=feature["name"][language],
            description=feature["description"][language],
            status=feature["status"],
            level=feature["level"],
            parent_id=feature["parent_id"],
        )


class LifeCycleStatusLayer(AbstractCodeLayer):
    name = "Elinkaaren tila"


class OrganisationLayer(AbstractCodeLayer):
    name = "Toimija"


code_layers = AbstractCodeLayer.__subclasses__()
