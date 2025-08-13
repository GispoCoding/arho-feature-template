from __future__ import annotations

import os
from importlib import resources
from typing import TYPE_CHECKING

from osgeo import gdal
from qgis.core import (
    QgsCoordinateReferenceSystem,
    QgsFeature,
    QgsMapRendererParallelJob,
    QgsMapSettings,
    QgsMapSettingsUtils,
    QgsProject,
)
from qgis.PyQt import uic
from qgis.PyQt.QtCore import QSize
from qgis.PyQt.QtGui import QColor
from qgis.PyQt.QtWidgets import QDialog, QDialogButtonBox

from arho_feature_template.project.layers.plan_layers import (
    PlanLayer,
)
from arho_feature_template.utils.misc_utils import get_active_plan_id, iface, use_wait_cursor

if TYPE_CHECKING:
    from qgis.gui import QgsDoubleSpinBox, QgsFileWidget, QgsProjectionSelectionWidget


ui_path = resources.files(__package__) / "create_geotiff_form.ui"
FormClass, _ = uic.loadUiType(ui_path)


class CreateGeotiffForm(QDialog, FormClass):  # type: ignore
    """Dialog for saving plan as GeoTIFF."""

    def __init__(self, parent=None):
        super().__init__(parent)

        self.setupUi(self)

        # TYPES
        self.filepath_selection: QgsFileWidget
        self.pixel_size_selection: QgsDoubleSpinBox
        self.crs_selection: QgsProjectionSelectionWidget

        self.button_box: QDialogButtonBox

        # INIT
        self.filepath_selection.setFilter("GeoTIFF Files (*.tif)")

        self.filepath_selection.fileChanged.connect(self._check_required_fields)
        self.pixel_size_selection.valueChanged.connect(self._check_required_fields)
        self.crs_selection.crsChanged.connect(self._check_required_fields)
        self.button_box.accepted.connect(self._on_ok_clicked)

        self.crs_selection.setCrs(QgsProject.instance().crs())  # Default to project CRS

    def _check_required_fields(self, _):
        ok_button = self.button_box.button(QDialogButtonBox.Ok)
        if (
            self.filepath_selection.filePath() != ""
            and self.pixel_size_selection.value() > 0.0
            and self.crs_selection.crs().isValid()
        ):
            ok_button.setEnabled(True)
        else:
            ok_button.setEnabled(False)

    def _get_plan_feature(self) -> QgsFeature | None:
        plan_layer = PlanLayer.get_from_project()

        if not plan_layer:
            iface.messageBar().pushWarning("", "Ei aktiivista kaavaa.")
            return None

        feature = PlanLayer.get_feature_by_id(get_active_plan_id(), no_geometries=False)

        if not feature:
            iface.messageBar().pushWarning("", "Ei aktiivista kaavaa.")
            return None

        return feature

    def _prepare_map_settings(
        self, plan_feat: QgsFeature, pixel_size: float, crs: QgsCoordinateReferenceSystem
    ) -> QgsMapSettings:
        # Set buffered bounding box
        bbox = plan_feat.geometry().boundingBox()
        buffer_percentage = 0.1
        buffer_x = bbox.width() * buffer_percentage
        buffer_y = bbox.height() * buffer_percentage
        buffered_bbox = bbox.buffered(max(buffer_x, buffer_y))

        # Rendering settings
        settings = QgsMapSettings()
        layer_tree = QgsProject.instance().layerTreeRoot()
        visible_layers = [layer for layer in layer_tree.layerOrder() if layer_tree.findLayer(layer).isVisible()]

        settings.setLayers(visible_layers)
        settings.setDestinationCrs(crs)
        settings.setBackgroundColor(QColor(255, 255, 255))

        width = int(buffered_bbox.width() / pixel_size) * pixel_size
        height = int(buffered_bbox.height() / pixel_size) * pixel_size
        buffered_bbox.setXMinimum(int(buffered_bbox.xMinimum()))
        buffered_bbox.setYMinimum(int(buffered_bbox.yMinimum()))
        buffered_bbox.setXMaximum(buffered_bbox.xMinimum() + width)
        buffered_bbox.setYMaximum(buffered_bbox.yMinimum() + height)
        settings.setExtent(buffered_bbox)

        # Calculate image size
        pixels_x = int(buffered_bbox.width() / pixel_size)
        pixels_y = int(buffered_bbox.height() / pixel_size)
        settings.setOutputSize(QSize(pixels_x, pixels_y))

        return settings

    def _on_render_finished(self, render: QgsMapRendererParallelJob, output_path: str):
        img_path = output_path.replace(".tif", ".png")
        pgw_path = img_path.replace(".png", ".pgw")

        settings = render.mapSettings()

        try:
            img = render.renderedImage()
            img.save(img_path, "PNG")

            with open(pgw_path, "w") as f:
                f.write(QgsMapSettingsUtils.worldFileContent(settings))

            self._create_geotiff_from_png(settings.destinationCrs(), img_path, output_path)
            iface.messageBar().pushSuccess("", f"Kaavakartta tallennettu polkuun: {output_path}")
        except Exception as e:  # noqa: BLE001
            iface.messageBar().pushCritical("", f"Kaavakartan tallentaminen epäonnistui: {e}.")
        finally:
            for tmp_file in [img_path, pgw_path]:
                if os.path.exists(tmp_file):
                    os.remove(tmp_file)

    def _create_geotiff_from_png(self, crs: QgsCoordinateReferenceSystem, image_path: str, geotiff_path: str):
        """Convert the rendered PNG to GeoTIFF."""
        ds = gdal.Open(image_path)

        # Convert the PNG to GeoTIFF
        gdal.Translate(
            geotiff_path,
            ds,
            outputSRS=crs.authid(),
            format="GTiff",
            outputType=gdal.GDT_Byte,
            bandList=[1, 2, 3],
            creationOptions=["COMPRESS=LZW", "TILED=YES", "BIGTIFF=IF_SAFER"],
        )

    @use_wait_cursor
    def create_geotiff(self):
        """Creates a GeoTIFF from the active plan layer."""
        # Get plan feature
        plan_feat = self._get_plan_feature()
        if not plan_feat:
            return

        # Read inputs
        output_path = self.filepath_selection.filePath()
        pixel_size = self.pixel_size_selection.value()
        crs = self.crs_selection.crs()

        # Render plan
        settings = self._prepare_map_settings(plan_feat, pixel_size, crs)
        render = QgsMapRendererParallelJob(settings)
        render.finished.connect(lambda: self._on_render_finished(render, output_path))
        render.start()

    def _on_ok_clicked(self):
        self.create_geotiff()
