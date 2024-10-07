from dataclasses import dataclass

from typing import List

from qgis.core import QgsProject, QgsVectorLayer, QgsMapLayer


# To be extended and moved
@dataclass
class LandUsePlan:
    id: str
    name: str


# To be replaced later
LAYER_PLAN_ID_MAP = {
    "Kaava": "id",
    "land_use_area": "plan_id",
    "Osa-alue": "plan_id",
}

def update_selected_plan(new_plan: LandUsePlan):
    """Update the project layers based on the selected land use plan."""
    id = new_plan.id
    for layer_name, field_name in LAYER_PLAN_ID_MAP.items():
        set_filter_for_vector_layer(layer_name, field_name, id)


def set_filter_for_vector_layer(layer_name: str, field_name: str, field_value: str):
    """Get the layer by name, check validity, and apply a filter based on the field value."""
    # Get the layer(s) by name
    layers = QgsProject.instance().mapLayersByName(layer_name)

    # Ensure at least one layer was found
    if not _check_layer_count(layers):
        return

    # Access the first layer from the list
    layer = layers[0]

    # Check if the layer is a valid vector layer
    if not _check_vector_layer(layer):
        return

    # Apply filtering logic here since the layer is valid
    print(f"Layer {layer.name()} is valid for filtering.")
    # Further operations like setting filter or using this layer for processing

def _check_layer_count(layers: list) -> bool:
    """Check if any layers are returned."""
    if not layers:
        print(f"ERROR: No layers found with the specified name.")
        return False
    return True


def _check_vector_layer(layer: QgsMapLayer) -> bool:
    """Check if the given layer is a vector layer."""
    if not isinstance(layer, QgsVectorLayer):
        print(f"ERROR: Layer {layer.name()} is not a vector layer: {type(layer)}")
        return False
    return True

# def update_selected_plan(new_plan: LandUsePlan):
    # id = new_plan.id
    # for layer_name, field_name in LAYER_PLAN_ID_MAP.items():
        # set_filter_for_vector_layer(layer_name, field_name, id)


# def set_filter_for_vector_layer(layer_name: str, field_name: str, field_value: str):
    # Get layer and perform checks
    # layers = QgsProject.instance().mapLayersByName(layer_name)
    # if not _check_layer_count(layers):
        # return
    # layer = layers[0]
    # if not _check_vector_layer(layer):
        # return

    # Check if the layer is empty
    # if layer.featureCount() == 0:
        # print(f"INFO: Layer '{layer_name}' is empty. No features to filter.")
        # return  # Simply return without applying any filter

    # else:
        # Perform the filtering
        # query = f"{field_name} = {field_value}"
        # if not layer.setSubsetString(query):
            # TODO: Convert to log msg?
            # print(f"ERROR: Failed to filter layer {layer_name} with query {query}")

# def _check_layer_count(layers: List[QgsMapLayer]) -> bool:
    # if len(layers) > 1:
        # TODO: Convert to log msg?
        # print(f"ERROR: Found multiple layers ({len(layers)}) with same name ({layers[0].name()}).")
        # return False
    # return True


# def _check_vector_layer(layer: QgsMapLayer) -> bool:
    # if not isinstance(layer, QgsVectorLayer):
        # TODO: Convert to log msg?
        # print(f"ERROR: Layer {layer.name()} is not a vector layer: f{type(layer)}")
        # print(f"Error this is not a vector layer! {layer}")
        # return False
    # return True