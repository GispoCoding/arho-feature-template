from qgis.core import QgsFeature, QgsGeometry, QgsVectorLayer
from qgis.PyQt.QtGui import QStandardItemModel
from qgis.utils import iface

from arho_feature_template.core.feature_template_library import TemplateGeometryDigitizeMapTool


class LandUsePlanTemplater:
    def __init__(self):
        self.active_template = None
        self.library_configs = {}
        self.template_model = QStandardItemModel()

        self.digitize_map_tool = TemplateGeometryDigitizeMapTool(iface.mapCanvas(), iface.cadDockWidget())
        self.digitize_map_tool.digitizingCompleted.connect(self.create_feature)

    def start_digitizing_for_layer(self, layer: QgsVectorLayer):
        self.digitize_map_tool.clean()
        self.digitize_map_tool.setLayer(layer)
        iface.mapCanvas().setMapTool(self.digitize_map_tool)

    def create_feature(self, feature):
        """Creates a new feature using stored dialog attributes."""

        if not self.plan_id or not self.plan_name or not self.plan_type:
            return

        layer = self.digitize_map_tool.layer()

        if not layer:
            return

        new_feature = QgsFeature(layer.fields())

        geometry = feature.geometry()
        if not isinstance(geometry, QgsGeometry):
            return

        new_feature.setGeometry(geometry)
        new_feature.setAttribute("id", self.plan_id)
        new_feature.setAttribute("name", self.plan_name)

        if self.plan_type == "Detailed land use plan":
            plan_type_value = 1
        elif self.plan_type == "General land use plan":
            plan_type_value = 2
        elif self.plan_type == "Local land use plan":
            plan_type_value = 3

        new_feature.setAttribute("plan_type", plan_type_value)

        if not layer.isEditable():
            layer.startEditing()

        layer.beginEditCommand("Create land use plan feature.")
        layer.addFeature(new_feature)
        layer.commitChanges()