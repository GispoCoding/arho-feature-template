from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt
from qgis.PyQt.QtWidgets import QDialog, QTextBrowser, QTreeWidget, QTreeWidgetItem

from arho_feature_template.core.models import Regulation, RegulationConfig, RegulationLibrary
from arho_feature_template.gui.plan_regulation_widget import RegulationWidget

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QBoxLayout, QWidget

ui_path = resources.files(__package__) / "new_plan_regulation_group_form.ui"
FormClass, _ = uic.loadUiType(ui_path)


class NewPlanRegulationGroupForm(QDialog, FormClass):  # type: ignore
    """Form to create a new plan regulation group."""

    def __init__(self):
        super().__init__()
        self.setupUi(self)

        # TYPES
        self.plan_regulations_view: QTreeWidget
        self.plan_regulations_scroll_area_contents: QWidget
        self.plan_regulations_layout: QBoxLayout
        self.plan_regulation_info: QTextBrowser

        # INIT
        self.initialize_plan_regulations()
        self.plan_regulations_view.itemDoubleClicked.connect(self.add_selected_plan_regulation)
        self.plan_regulations_view.itemClicked.connect(self.update_selected_plan_regulation)

    def _initalize_regulation_from_config(self, config: RegulationConfig, parent: QTreeWidgetItem | None = None):
        tree_item = QTreeWidgetItem(parent)
        tree_item.setText(0, config.name)
        tree_item.setData(0, Qt.UserRole, config)

        if parent is None:
            self.plan_regulations_view.addTopLevelItem(tree_item)

        # Initialize plan regulations recursively
        if config.child_regulations:
            for child_config in config.child_regulations:
                self._initalize_regulation_from_config(child_config, tree_item)

    def initialize_plan_regulations(self):
        for config in RegulationLibrary.get_regulations():
            self._initalize_regulation_from_config(config)

    def update_selected_plan_regulation(self, item: QTreeWidgetItem, column: int):
        config: RegulationConfig = item.data(column, Qt.UserRole)  # Retrieve the associated config
        self.plan_regulation_info.setText(config.description)

    def add_selected_plan_regulation(self, item: QTreeWidgetItem, column: int):
        config: RegulationConfig = item.data(column, Qt.UserRole)  # Retrieve the associated config
        if config.category_only:
            return
        self.add_plan_regulation(config)

    def add_plan_regulation(self, config: RegulationConfig):
        regulation = Regulation(config=config)
        widget = RegulationWidget(regulation, parent=self.plan_regulations_scroll_area_contents)
        widget.delete_signal.connect(self.delete_plan_regulation)
        index = self.plan_regulations_layout.count() - 1
        self.plan_regulations_layout.insertWidget(index, widget)

    def delete_plan_regulation(self, plan_regulation_widget: RegulationWidget):
        self.plan_regulations_layout.removeWidget(plan_regulation_widget)
        plan_regulation_widget.deleteLater()
