from __future__ import annotations

from dataclasses import dataclass
from typing import cast

from qgis.core import Qgis, QgsMapLayer, QgsProject, QgsVectorLayer

from arho_feature_template.core.exceptions import UnexpectedNoneError
from arho_feature_template.utils.qgis_utils import show_message_bar


# To be extended and moved
@dataclass
class LandUsePlan:
    id: str


# To be replaced later
LAYER_PLAN_ID_MAP = {
    "Kaava": "id",
    "Maankäytön kohteet": "plan_id",
    "Muut pisteet": "plan_id",
    "Viivat": "plan_id",
    "Aluevaraus": "plan_id",
    "Osa-alue": "plan_id",
}


def update_selected_plan(new_plan: LandUsePlan) -> None:
    """Update the project layers based on the selected land use plan."""
    plan_id = new_plan.id

    for layer_name, field_name in LAYER_PLAN_ID_MAP.items():
        # Set the filter on each layer using the plan_id
        set_filter_for_vector_layer(layer_name, field_name, plan_id)


def set_filter_for_vector_layer(layer_name: str, field_name: str, field_value: str) -> None:
    """Set a filter for the given vector layer."""
    project = QgsProject.instance()
    if project is None:
        raise UnexpectedNoneError
    layers = project.mapLayersByName(layer_name)

    if not _check_layer_count(layers):
        return

    layer = cast(QgsVectorLayer, layers[0])

    expression = f"\"{field_name}\" = '{field_value}'"

    # Apply the filter to the layer
    if not layer.setSubsetString(expression):
        show_message_bar(
            "Error", f"Failed to filter layer {layer_name} with query {expression}", level=Qgis.MessageLevel.Critical
        )


def _check_layer_count(layers: list) -> bool:
    """Check if any layers are returned."""
    if not layers:
        show_message_bar("Error", "ERROR: No layers found with the specified name.", level=Qgis.MessageLevel.Critical)
        return False
    return True


def _check_vector_layer(layer: QgsMapLayer) -> bool:
    """Check if the given layer is a vector layer."""
    if not isinstance(layer, QgsVectorLayer):
        show_message_bar(
            "Error", f"Layer {layer.name()} is not a vector layer: {type(layer)}", level=Qgis.MessageLevel.Critical
        )
        return False
    return True
