import os

from osgeo import gdal
from qgis.core import QgsMapRendererParallelJob, QgsMapSettings, QgsMapSettingsUtils
from qgis.PyQt.QtCore import QSize, Qt
from qgis.PyQt.QtGui import QColor
from qgis.PyQt.QtWidgets import QApplication, QFileDialog

from arho_feature_template.project.layers.plan_layers import (
    LandUseAreaLayer,
    LandUsePointLayer,
    LineLayer,
    OtherAreaLayer,
    OtherPointLayer,
    PlanLayer,
)
from arho_feature_template.utils.misc_utils import get_active_plan_id, iface


class GeoTiffCreator:
    def __init__(self, desired_pixel_size=0.5):
        """Initialize the CreateGeoTiff class and fetch the required data."""
        self.desired_pixel_size = desired_pixel_size
        self.plan_layer = PlanLayer.get_from_project()

        if not self.plan_layer:
            iface.messageBar().pushWarning("", "Ei aktiivista kaavaa.")
            return

        self.feature = PlanLayer.get_feature_by_id(get_active_plan_id(), no_geometries=False)

        if not self.feature:
            iface.messageBar().pushWarning("", "Ei aktiivista kaavaa.")
            return

    def select_output_file(self):
        """Opens a file dialog for the user to select the output GeoTIFF file."""
        geotiff_path, _ = QFileDialog.getSaveFileName(
            None, "Määritä GeoTIFF tallennuspolku", "", "GeoTIFF Files (*.tif)"
        )
        if not geotiff_path:
            iface.messageBar().pushWarning("", "Tallennuspolkua ei määritetty.")
            return None

        self.create_geotiff(geotiff_path)

    def create_geotiff(self, geotiff_path):
        """Creates a GeoTIFF from the active plan layer and feature."""
        if not self.plan_layer or not self.feature:
            return

        QApplication.setOverrideCursor(Qt.WaitCursor)

        # Set buffered bounding box
        bbox = self.feature.geometry().boundingBox()
        buffer_percentage = 0.1
        buffer_x = bbox.width() * buffer_percentage
        buffer_y = bbox.height() * buffer_percentage
        buffered_bbox = bbox.buffered(max(buffer_x, buffer_y))

        # Rendering settings
        settings = QgsMapSettings()
        settings.setLayers(
            [
                PlanLayer.get_from_project(),
                LandUsePointLayer.get_from_project(),
                OtherPointLayer.get_from_project(),
                LineLayer.get_from_project(),
                OtherAreaLayer.get_from_project(),
                LandUseAreaLayer.get_from_project(),
            ]
        )
        settings.setBackgroundColor(QColor(255, 255, 255))
        width = int(buffered_bbox.width() / self.desired_pixel_size) * self.desired_pixel_size
        height = int(buffered_bbox.height() / self.desired_pixel_size) * self.desired_pixel_size
        buffered_bbox.setXMinimum(int(buffered_bbox.xMinimum()))
        buffered_bbox.setYMinimum(int(buffered_bbox.yMinimum()))
        buffered_bbox.setXMaximum(buffered_bbox.xMinimum() + width)
        buffered_bbox.setYMaximum(buffered_bbox.yMinimum() + height)
        settings.setExtent(buffered_bbox)

        # Calculate image size
        pixels_x = int(buffered_bbox.width() / self.desired_pixel_size)
        pixels_y = int(buffered_bbox.height() / self.desired_pixel_size)
        settings.setOutputSize(QSize(pixels_x, pixels_y))

        render = QgsMapRendererParallelJob(settings)

        def finished():
            try:
                img = render.renderedImage()

                # Save the image as PNG temporarily
                image_path = geotiff_path.replace(".tif", ".png")
                img.save(image_path, "PNG")

                # Generate the World File (.pgw)
                pgw_content = QgsMapSettingsUtils.worldFileContent(settings)
                pgw_path = image_path.replace(".png", ".pgw")
                with open(pgw_path, "w") as f:
                    f.write(pgw_content)

                # Convert PNG to GeoTIFF
                self._create_geotiff_from_png(image_path, geotiff_path)

                # Delete temporary PNG
                if os.path.exists(image_path):
                    os.remove(image_path)

                # Delete temporary World File (.pgw)
                if os.path.exists(pgw_path):
                    os.remove(pgw_path)
            finally:
                QApplication.restoreOverrideCursor()

        render.finished.connect(finished)
        render.start()

    def _create_geotiff_from_png(self, image_path, geotiff_path):
        """Convert the rendered PNG to GeoTIFF."""

        ds = gdal.Open(image_path)

        # Convert the PNG to GeoTIFF
        gdal.Translate(
            geotiff_path,
            ds,
            outputSRS="EPSG:3067",
            format="GTiff",
            creationOptions=["COMPRESS=LZW", "TILED=YES"],
        )

        iface.messageBar().pushSuccess("", f"GeoTIFF tallennettu polkuun: {geotiff_path}")
