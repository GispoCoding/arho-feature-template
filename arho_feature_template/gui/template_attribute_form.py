from __future__ import annotations

import os
from importlib import resources
from pathlib import Path
from typing import TYPE_CHECKING

from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt
from qgis.PyQt.QtWidgets import (
    QComboBox,
    QDialog,
    QDialogButtonBox,
    QLineEdit,
    QScrollArea,
    QSizePolicy,
    QSpacerItem,
    QTextEdit,
    QTreeWidget,
    QTreeWidgetItem,
)

from arho_feature_template.core.models import PlanFeature, RegulationGroup, RegulationGroupLibrary
from arho_feature_template.core.plan_manager import regulation_group_library_from_active_plan
from arho_feature_template.gui.plan_regulation_group_widget import RegulationGroupWidget
from arho_feature_template.project.layers.code_layers import UndergroundTypeLayer
from arho_feature_template.qgis_plugin_tools.tools.resources import resources_path

if TYPE_CHECKING:
    from qgis.core import QgsGeometry
    from qgis.PyQt.QtWidgets import QWidget

    from arho_feature_template.core.template_library_config import FeatureTemplate
    from arho_feature_template.gui.code_combobox import CodeComboBox

ui_path = resources.files(__package__) / "template_attribute_form.ui"
FormClass, _ = uic.loadUiType(ui_path)


class TemplateAttributeForm(QDialog, FormClass):  # type: ignore
    """Parent class for feature template forms for adding and modifying feature attribute data."""

    def __init__(
        self,
        feature_template_config: FeatureTemplate,
        geometry: QgsGeometry,
    ):
        super().__init__()
        self.setupUi(self)

        # TYPES
        # self.model = None
        self.geom = geometry
        self.feature_name: QLineEdit
        self.feature_description: QTextEdit
        self.feature_type_of_underground: CodeComboBox
        self.plan_regulation_group_scrollarea: QScrollArea
        self.plan_regulation_group_scrollarea_contents: QWidget
        self.plan_regulation_group_libraries_combobox: QComboBox
        self.plan_regulation_groups_tree: QTreeWidget
        self.button_box: QDialogButtonBox

        # INIT
        self.feature_type_of_underground.populate_from_code_layer(UndergroundTypeLayer)
        self.feature_type_of_underground.removeItem(0)  # Remove NULL from combobox as underground data is required
        self.feature_type_of_underground.setCurrentIndex(1)  # Set default to Maanpäällinen (index 1)

        self.config = feature_template_config
        self.regulation_group_widgets: list[RegulationGroupWidget] = []
        self.scroll_area_spacer = None
        self.setWindowTitle(self.config.name)

        katja_asemakaava_path = Path(os.path.join(resources_path(), "katja_asemakaava.yaml"))
        self.regulation_group_libraries = [
            RegulationGroupLibrary.from_config_file(katja_asemakaava_path),
            regulation_group_library_from_active_plan(),
        ]
        self.plan_regulation_group_libraries_combobox.addItems(
            library.name for library in self.regulation_group_libraries
        )

        # self.init_plan_regulation_groups_from_template(feature_template_config)
        self.button_box.accepted.connect(self._on_ok_clicked)
        self.plan_regulation_groups_tree.itemDoubleClicked.connect(self.add_selected_plan_regulation_group)
        self.plan_regulation_group_libraries_combobox.currentIndexChanged.connect(self.show_regulation_group_library)
        self.show_regulation_group_library(0)

    def _add_spacer(self):
        self.scroll_area_spacer = QSpacerItem(0, 0, QSizePolicy.Expanding, QSizePolicy.Expanding)
        self.plan_regulation_group_scrollarea_contents.layout().addItem(self.scroll_area_spacer)

    def _remove_spacer(self):
        if self.scroll_area_spacer is not None:
            self.plan_regulation_group_scrollarea_contents.layout().removeItem(self.scroll_area_spacer)
            self.scroll_area_spacer = None

    def add_selected_plan_regulation_group(self, item: QTreeWidgetItem, column: int):
        if not item.parent():
            return
        regulation_group: RegulationGroup = item.data(column, Qt.UserRole)
        self.add_plan_regulation_group(regulation_group)

    def add_plan_regulation_group(self, definition: RegulationGroup):
        regulation_group_widget = RegulationGroupWidget(definition)
        regulation_group_widget.delete_signal.connect(self.remove_plan_regulation_group)
        self._remove_spacer()
        self.plan_regulation_group_scrollarea_contents.layout().addWidget(regulation_group_widget)
        self.regulation_group_widgets.append(regulation_group_widget)
        self._add_spacer()

    def remove_plan_regulation_group(self, regulation_group_widget: RegulationGroupWidget):
        self.plan_regulation_group_scrollarea_contents.layout().removeWidget(regulation_group_widget)
        self.regulation_group_widgets.remove(regulation_group_widget)
        regulation_group_widget.deleteLater()

    def show_regulation_group_library(self, i: int):
        self.plan_regulation_groups_tree.clear()
        library = self.regulation_group_libraries[i]
        for category in library.regulation_group_categories:
            category_item = QTreeWidgetItem()
            category_item.setText(0, category.name)
            self.plan_regulation_groups_tree.addTopLevelItem(category_item)
            for group_definition in category.regulation_groups:
                regulation_group_item = QTreeWidgetItem(category_item)
                regulation_group_item.setText(0, group_definition.name)
                regulation_group_item.setData(0, Qt.UserRole, group_definition)

    def into_model(self) -> PlanFeature:
        return PlanFeature(
            name=self.feature_name.text(),
            type_of_underground_id=self.feature_type_of_underground.value(),
            description=self.feature_description.toPlainText(),
            geom=self.geom,
            layer_name=self.config.group,
            regulation_groups=[reg_group_widget.into_model() for reg_group_widget in self.regulation_group_widgets],
            id_=None,
        )

    def _on_ok_clicked(self):
        self.model = self.into_model()
        self.accept()
