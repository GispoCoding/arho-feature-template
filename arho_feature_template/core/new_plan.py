from qgis.core import QgsProject, QgsVectorLayer
from qgis.utils import iface

from arho_feature_template.core.update_plan import LandUsePlan, update_selected_plan


class NewPlan:
    def add_new_plan(self):
        # Filtered layers are not editable, so clear filters first.
        self.clear_all_filters()

        layers = QgsProject.instance().mapLayersByName("Kaava")
        if not layers:
            iface.messageBar().pushMessage("Error", "Layer 'Kaava' not found", level=3)
            return

        kaava_layer = layers[0]

        if not kaava_layer.isEditable():
            kaava_layer.startEditing()

        iface.setActiveLayer(kaava_layer)

        iface.actionAddFeature().trigger()

        # Connect the featureAdded signal
        kaava_layer.featureAdded.connect(self.feature_added)


    def feature_added(self):
        kaava_layer = iface.activeLayer()
        kaava_layer.featureAdded.disconnect()
        feature_ids_before_commit = kaava_layer.allFeatureIds()
        if kaava_layer.isEditable():
            if not kaava_layer.commitChanges():
                iface.messageBar().pushMessage("Error", "Failed to commit changes to the layer.", level=3)
                return
        else:
            iface.messageBar().pushMessage("Error", "Layer is not editable.", level=3)
            return

        feature_ids_after_commit = kaava_layer.allFeatureIds()

        # Find the new plan.id by comparing fids before and after commit.
        new_feature_id = next((fid for fid in feature_ids_after_commit if fid not in feature_ids_before_commit), None)

        if new_feature_id is not None:
            new_feature = kaava_layer.getFeature(new_feature_id)

            if new_feature.isValid():
                feature_id_value = new_feature["id"]
                update_selected_plan(LandUsePlan(feature_id_value))
            else:
                iface.messageBar().pushMessage("Error", "Invalid feature retrieved.", level=3)
        else:
            iface.messageBar().pushMessage("Error", "No new feature was added.", level=3)

    def clear_all_filters(self):
        """Clear filters for all vector layers in the project."""
        layers = QgsProject.instance().mapLayers().values()

        for layer in layers:
            if isinstance(layer, QgsVectorLayer):
                layer.setSubsetString("")
