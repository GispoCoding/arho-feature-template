from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING, Generator

from qgis import processing
from qgis.core import (
    QgsCoordinateReferenceSystem,
    QgsFeature,
    QgsFeatureIterator,
    QgsFeatureRequest,
    QgsFieldProxyModel,
    QgsMapLayerProxyModel,
    QgsVectorLayer,
)
from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import QCheckBox, QDialog, QDialogButtonBox, QProgressBar

from arho_feature_template.core.models import PlanFeature, RegulationGroupLibrary
from arho_feature_template.project.layers.code_layers import UndergroundTypeLayer, code_layers
from arho_feature_template.project.layers.plan_layers import (
    FEATURE_LAYER_NAME_TO_CLASS_MAP,
    PlanLayer,
    RegulationGroupAssociationLayer,
    plan_feature_layers,
    plan_layers,
)
from arho_feature_template.utils.misc_utils import iface, use_wait_cursor

if TYPE_CHECKING:
    from qgis.gui import QgsCheckableComboBox, QgsFieldComboBox, QgsFieldExpressionWidget, QgsMapLayerComboBox

    from arho_feature_template.gui.components.code_combobox import CodeComboBox


ui_path = resources.files(__package__) / "import_features_form.ui"
FormClass, _ = uic.loadUiType(ui_path)


class ImportFeaturesForm(QDialog, FormClass):  # type: ignore
    def __init__(self, active_plan_regulation_groups_library: RegulationGroupLibrary):
        super().__init__()
        self.setupUi(self)

        # TYPES
        self.source_layer_selection: QgsMapLayerComboBox
        self.filter_expression: QgsFieldExpressionWidget
        self.selected_features_only: QCheckBox

        self.name_selection: QgsFieldComboBox
        self.description_selection: QgsFieldComboBox
        self.feature_type_of_underground_selection: CodeComboBox
        self.regulation_groups_selection: QgsCheckableComboBox

        self.target_layer_selection: QgsMapLayerComboBox

        self.progress_bar: QProgressBar
        self.process_button_box: QDialogButtonBox

        # INIT
        self.process_button_box.button(QDialogButtonBox.Ok).setText("Import")
        self.process_button_box.accepted.connect(self.import_features)
        self.process_button_box.rejected.connect(self.reject)

        self.target_crs: QgsCoordinateReferenceSystem | None = None

        # Source layer initialization
        # Exclude all project layers from valid source layers
        # NOTE: Some project layers are not included in either `plan_layers` or `code_layers`?
        self.source_layer_selection.setFilters(QgsMapLayerProxyModel.VectorLayer)
        excluded_layers = [layer.get_from_project() for layer in plan_layers + code_layers]
        self.source_layer_selection.setExceptedLayerList(excluded_layers)
        if type(iface.activeLayer()) is QgsVectorLayer:
            self.source_layer_selection.setLayer(iface.activeLayer())
        self.source_layer_selection.layerChanged.connect(self._on_layer_selections_changed)

        # Target layer initialization
        # Set only plan feature layers as valid target layers
        self.target_layer_selection.setFilters(QgsMapLayerProxyModel.VectorLayer)
        self.target_layer_selection.clear()
        self.target_layer_selection.setAdditionalLayers(layer.get_from_project() for layer in plan_feature_layers)
        self.target_layer_selection.setCurrentIndex(0)
        self.target_layer_selection.layerChanged.connect(self._on_layer_selections_changed)

        # Name field initialization
        self.name_selection.setAllowEmptyFieldName(True)
        self.name_selection.setFilters(QgsFieldProxyModel.Filter.String)
        self.name_selection.setField("")

        # Description field initialization
        self.description_selection.setAllowEmptyFieldName(True)
        self.description_selection.setFilters(QgsFieldProxyModel.Filter.String)
        self.description_selection.setField("")

        # Underground type initialization
        # Remove NULL from the selections and set Maanpäällinen as default
        self.feature_type_of_underground_selection.populate_from_code_layer(UndergroundTypeLayer)
        self.feature_type_of_underground_selection.remove_item_by_text("NULL")
        self.feature_type_of_underground_selection.setCurrentIndex(1)  # Set default to Maanpäällinen (index 1)

        # Regulation groups initialization
        # Only regulation group already in DB are shown and they are not categorized right now
        # NOTE: This means groups that are "Aluevaraus" groups can be given to "Osa-alue" for example
        i = 0
        for category in active_plan_regulation_groups_library.regulation_group_categories:
            for group in category.regulation_groups:
                self.regulation_groups_selection.addItem(str(group))
                self.regulation_groups_selection.setItemData(i, group.id_)
                i += 1

        self._on_layer_selections_changed(self.source_layer_selection.currentLayer())

    def _on_layer_selections_changed(self, _: QgsVectorLayer):
        self.source_layer: QgsVectorLayer = self.source_layer_selection.currentLayer()
        self.target_layer: QgsVectorLayer = self.target_layer_selection.currentLayer()
        if not self.source_layer:
            return
        self.source_layer_name: str = self.source_layer.name()
        self.target_layer_name: str = self.target_layer.name()

        self.filter_expression.setLayer(self.source_layer)
        self.name_selection.setLayer(self.source_layer)
        self.description_selection.setLayer(self.source_layer)

        if self.source_and_target_layer_types_match():
            self.process_button_box.button(QDialogButtonBox.Ok).setEnabled(True)
        else:
            self.process_button_box.button(QDialogButtonBox.Ok).setEnabled(False)

    def source_and_target_layer_types_match(self) -> bool:
        if not self.source_layer or not self.target_layer:
            return False
        return self.source_layer.wkbType() is self.target_layer.wkbType()

    @use_wait_cursor
    def import_features(self):
        self.progress_bar.setValue(0)

        if not self.source_layer or not self.target_layer:
            return

        if not self.target_crs:
            self.target_crs = PlanLayer.get_from_project().crs()

        if self.source_layer.crs() == self.target_crs:
            source_features = list(self.get_source_features(self.source_layer))
        else:
            source_features = list(self.get_source_features(self.reproject_layer(self.target_crs, self.source_layer)))

        if not source_features:
            iface.messageBar().pushInfo("", "Yhtään kohdetta ei tuotu.")
            return

        # Create and add new plan features
        plan_features = self.create_plan_features(source_features)
        total_count = len(plan_features)
        failed_count = 0
        success_count = 0
        for i, feat in enumerate(plan_features):
            self.progress_bar.setValue(int((i + 1) / total_count * 100))
            if self._save_feature(feat, self.target_layer, None, "Kaavakohteen lisääminen"):
                success_count += 1
            else:
                failed_count += 1

        # If regulation groups are defined, associate them with the plan features
        if len(self.regulation_groups_selection.checkedItems()) > 0:
            associations = self.create_regulation_group_associations(plan_features)
            associations_layer = RegulationGroupAssociationLayer.get_from_project()
            for association in associations:
                self._save_feature(association, associations_layer, None, "Kaavamääräysryhmän assosiaation lisääminen")

        if failed_count == 0:
            iface.messageBar().pushSuccess("", "Kaavakohteet tuotiin onnistuneesti.")
        else:
            iface.messageBar().pushInfo("", f"Osa kaavakohteista tuotiin epäonnistuneesti ({failed_count}).")

        self.progress_bar.setValue(100)

    def get_source_features(self, source_layer: QgsVectorLayer) -> Generator[QgsFeature, None, None]:
        request = QgsFeatureRequest()
        expression_text = self.filter_expression.currentText()
        if expression_text:
            request.setFilterExpression(expression_text)

        return (
            feat
            for feat in source_layer.getFeatures(request)
            if not self.selected_features_only.isChecked() or feat in source_layer.selectedFeatures()
        )

    def create_plan_features(self, source_features: QgsFeatureIterator | list[QgsFeature]) -> list[QgsFeature]:
        type_of_underground_id = self.feature_type_of_underground_selection.value()
        source_layer_name_field = self.name_selection.currentField()
        source_layer_description_field = self.description_selection.currentField()
        layer_class = FEATURE_LAYER_NAME_TO_CLASS_MAP.get(self.target_layer_name)
        if not layer_class:
            msg = f"Could not find plan feature layer class for layer name {self.target_layer_name}"
            raise ValueError(msg)

        return [
            layer_class.feature_from_model(
                PlanFeature(
                    geom=feature.geometry(),
                    type_of_underground_id=type_of_underground_id,
                    layer_name=self.target_layer_name,
                    name=feature[source_layer_name_field] if source_layer_name_field else None,
                    description=feature[source_layer_description_field] if source_layer_description_field else None,
                )
            )
            for feature in source_features
        ]

    def create_regulation_group_associations(self, plan_features: list[QgsFeature]) -> list[QgsFeature]:
        return [
            RegulationGroupAssociationLayer.feature_from(
                regulation_group_id, self.target_layer_name, plan_feature["id"]
            )
            for regulation_group_id in self.regulation_groups_selection.checkedItemsData()
            for plan_feature in plan_features
        ]

    @staticmethod
    def _save_feature(feature: QgsFeature, layer: QgsVectorLayer, id_: str | None, edit_text: str = "") -> bool:
        if not layer.isEditable():
            layer.startEditing()
        layer.beginEditCommand(edit_text)

        if id_ is None:
            layer.addFeature(feature)
        else:
            layer.updateFeature(feature)

        layer.endEditCommand()
        return layer.commitChanges(stopEditing=False)

    @staticmethod
    def reproject_layer(target_crs: QgsCoordinateReferenceSystem, layer: QgsVectorLayer) -> QgsVectorLayer:
        results = processing.run(
            "native:reprojectlayer", {"INPUT": layer, "TARGET_CRS": target_crs, "OUTPUT": "TEMPORARY_OUTPUT"}
        )
        return results["OUTPUT"]
