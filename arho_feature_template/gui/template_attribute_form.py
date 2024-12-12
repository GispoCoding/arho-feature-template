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
    QTreeWidget,
    QTreeWidgetItem,
)

from arho_feature_template.core.models import RegulationGroup, RegulationGroupLibrary
from arho_feature_template.gui.plan_regulation_group_widget import RegulationGroupWidget
from arho_feature_template.qgis_plugin_tools.tools.resources import resources_path

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QWidget

    from arho_feature_template.core.template_library_config import FeatureTemplate

ui_path = resources.files(__package__) / "template_attribute_form.ui"
FormClass, _ = uic.loadUiType(ui_path)


class TemplateAttributeForm(QDialog, FormClass):  # type: ignore
    """Parent class for feature template forms for adding and modifying feature attribute data."""

    def __init__(self, feature_template_config: FeatureTemplate):
        super().__init__()
        self.setupUi(self)

        # TYPES
        self.feature_name: QLineEdit
        self.feature_description: QLineEdit
        self.feature_underground: QLineEdit
        self.plan_regulation_group_scrollarea: QScrollArea
        self.plan_regulation_group_scrollarea_contents: QWidget
        self.plan_regulation_group_libraries_combobox: QComboBox
        self.plan_regulation_groups_tree: QTreeWidget
        self.button_box: QDialogButtonBox

        # INIT
        self.scroll_area_spacer = None
        self.setWindowTitle(feature_template_config.name)
        self.init_plan_regulation_group_libraries()
        # self.init_plan_regulation_groups_from_template(feature_template_config)
        self.button_box.accepted.connect(self._on_ok_clicked)
        self.plan_regulation_groups_tree.itemDoubleClicked.connect(self.add_selected_plan_regulation_group)

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
        new_plan_regulation_group = RegulationGroupWidget(definition)
        new_plan_regulation_group.delete_signal.connect(self.remove_plan_regulation_group)
        self._remove_spacer()
        self.plan_regulation_group_scrollarea_contents.layout().addWidget(new_plan_regulation_group)
        self._add_spacer()

    def remove_plan_regulation_group(self, plan_regulation_group_widget: RegulationGroupWidget):
        self.plan_regulation_group_scrollarea_contents.layout().removeWidget(plan_regulation_group_widget)
        plan_regulation_group_widget.deleteLater()

    def init_plan_regulation_group_libraries(self):
        katja_asemakaava_path = Path(os.path.join(resources_path(), "katja_asemakaava.yaml"))
        libraries = [RegulationGroupLibrary.from_config_file(katja_asemakaava_path)]
        for library in libraries:
            self.init_plan_regulation_group_library(library)

    def init_plan_regulation_group_library(self, library: RegulationGroupLibrary):
        self.plan_regulation_group_libraries_combobox.addItem(library.name)
        for category in library.regulation_group_categories:
            category_item = QTreeWidgetItem()
            category_item.setText(0, category.name)
            self.plan_regulation_groups_tree.addTopLevelItem(category_item)
            for group_definition in category.regulation_groups:
                regulation_group_item = QTreeWidgetItem(category_item)
                regulation_group_item.setText(0, group_definition.name)
                regulation_group_item.setData(0, Qt.UserRole, group_definition)

    def _on_ok_clicked(self):
        self.accept()
