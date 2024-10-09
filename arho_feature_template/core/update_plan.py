from dataclasses import dataclass
from typing import List

from qgis.core import QgsMapLayer, QgsProject, QgsVectorLayer


# To be extended and moved
@dataclass
class LandUsePlan:
    id: str
    name: str

# To be replaced later
LAYER_PLAN_ID_MAP = {
    "land_use_plan": "id",
    "land_use_area": "plan_id",
    "Osa-alue": "plan_id",
}

def update_selected_plan(new_plan: LandUsePlan):
    """Update the project layers based on the selected land use plan."""
    id = new_plan.id
    for layer_name, field_name in LAYER_PLAN_ID_MAP.items():
        set_filter_for_vector_layer(layer_name, field_name, id)

def set_filter_for_vector_layer(layer_name: str, field_name: str, field_value: str):
    # Get layer and perform checks
    layers = QgsProject.instance().mapLayersByName(layer_name)
    if not _check_layer_count(layers):
        return
    layer = layers[0]
    if not _check_vector_layer(layer):
        return

    # Perform the filtering
    query = f"{field_name} = {field_value}"
    if not layer.setSubsetString(query):
        # TODO: Convert to log msg?
        print(f"ERROR: Failed to filter layer {layer_name} with query {query}")

def _check_layer_count(layers: list) -> bool:
    """Check if any layers are returned."""
    if not layers:
        print("ERROR: No layers found with the specified name.")
        return False
    return True

def _check_vector_layer(layer: QgsMapLayer) -> bool:
    """Check if the given layer is a vector layer."""
    if not isinstance(layer, QgsVectorLayer):
        print(f"ERROR: Layer {layer.name()} is not a vector layer: {type(layer)}")
        return False
    return True
