from qgis.gui import QgsMapToolDigitizeFeature, QgsMapToolCapture
from qgis.core import QgsProject
from qgis.utils import iface

class SimpleDrawTool(QgsMapToolDigitizeFeature):
    def __init__(self, canvas):
        # Properly initializing with the required parameters
        super().__init__(canvas, None, QgsMapToolCapture.CapturePolygon)

        self.canvas = canvas
        self.layer = QgsProject.instance().mapLayersByName("Kaava")[0]
        iface.setActiveLayer(self.layer)

    def addFeature(self, f):
        self.layer.addFeature(f)
        self.layer.triggerRepaint()