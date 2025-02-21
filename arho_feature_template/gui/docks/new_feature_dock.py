from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.gui import QgsDockWidget
from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt, pyqtSignal
from qgis.PyQt.QtWidgets import QListWidget, QListWidgetItem

from arho_feature_template.gui.components.new_feature_grid_widget import NewFeatureGridWidget

if TYPE_CHECKING:
    from qgis.gui import QgsFilterLineEdit
    from qgis.PyQt.QtWidgets import QComboBox, QLabel, QWidget

    from arho_feature_template.core.models import FeatureTemplateLibrary, PlanFeature

ui_path = resources.files(__package__) / "new_feature_dock.ui"
DockClass, _ = uic.loadUiType(ui_path)


class NewFeatureDock(QgsDockWidget, DockClass):  # type: ignore
    library_selection: QComboBox
    search_box: QgsFilterLineEdit
    template_list: QListWidget
    txt_tip: QLabel
    dockWidgetContents: QWidget  # noqa: N815

    tool_activated = pyqtSignal()

    def __init__(self, parent=None) -> None:
        super().__init__(parent)
        self.setupUi(self)

        # INIT
        # 1. New feature grid
        self.new_feature_grid = NewFeatureGridWidget()
        self.dockWidgetContents.layout().insertWidget(1, self.new_feature_grid)

        # 2. Feature templates
        self.active_feature_type: str | None = None
        self.active_feature_layer: str | None = None
        self.active_template: PlanFeature | None = None
        self.feature_template_libraries: list[FeatureTemplateLibrary] | None = None
        self.library_selection.currentIndexChanged.connect(self.set_active_feature_template_library)

        self.template_list.setSelectionMode(self.template_list.SingleSelection)
        self.search_box.valueChanged.connect(self.filter_plan_feature_templates)

        # NOTE: If user moves selection with arrow keys, this is not registered currently
        self.template_list.clicked.connect(self.on_template_item_clicked)
        self.new_feature_grid.active_feature_type_changed.connect(self.on_active_feature_type_changed)

    def initialize_feature_template_libraries(self, feature_template_libraries: list[FeatureTemplateLibrary]):
        self.feature_template_libraries = feature_template_libraries
        self.library_selection.clear()
        self.library_selection.addItems([library.name for library in self.feature_template_libraries])
        self.set_active_feature_template_library(0)

    def on_active_feature_type_changed(self, feature_name: str, layer_name: str):
        self.active_feature_type = feature_name if feature_name else None
        self.active_feature_layer = layer_name if layer_name else None
        self.filter_plan_feature_templates()
        if self.active_feature_type:
            self.tool_activated.emit()

    def filter_plan_feature_templates(self) -> None:
        # Consider both search text and active plan feature type
        search_text = self.search_box.value().lower()

        for index in range(self.template_list.count()):
            item = self.template_list.item(index)
            item_text = item.text().lower()
            plan_feature: PlanFeature = item.data(Qt.UserRole)
            text_matches = search_text in item_text
            feature_type_matches = (
                plan_feature.layer_name == self.active_feature_layer if self.active_feature_layer else True
            )
            item.setHidden(not (text_matches and feature_type_matches))

            # Clear selection if the selected template was filtered
            if self.active_template and self.active_template is plan_feature and item.isHidden():
                self.template_list.clearSelection()

    def on_template_item_clicked(self, index: int):
        item = self.template_list.itemFromIndex(index)
        template: PlanFeature = item.data(Qt.UserRole)
        # Clicked new list item => activate new template
        if template != self.active_template:
            self.active_template = template
            # NOTE: Workaround to fix make sure clicked item is selected. At least after a selected item has been
            # filtered out, clicking on a new template will select, immediately deselect (but keep focus)
            self.template_list.setCurrentItem(item)
        else:
            # Clicked selected list item => clear selection
            self.active_template = None
            self.template_list.clearSelection()

    def deactivate_and_clear_selections(self):
        self.on_active_feature_type_changed("", "")
        self.new_feature_grid.clear_selections()
        self.active_template = None
        self.template_list.clearSelection()

    def set_active_feature_template_library(self, index: int) -> None:
        if self.feature_template_libraries and len(self.feature_template_libraries) > 0:
            self.template_list.clear()
            library = self.feature_template_libraries[index]
            for feature_template in library.feature_templates:
                item = QListWidgetItem(feature_template.name)
                item.setData(Qt.UserRole, feature_template)
                self.template_list.addItem(item)
