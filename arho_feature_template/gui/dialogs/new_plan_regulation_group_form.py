from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt
from qgis.PyQt.QtWidgets import QDialog, QDialogButtonBox, QTextBrowser, QTreeWidgetItem, QVBoxLayout

from arho_feature_template.core.models import Regulation, RegulationConfig, RegulationGroup, RegulationLibrary
from arho_feature_template.gui.components.plan_regulation_widget import RegulationWidget
from arho_feature_template.gui.components.tree_with_search_widget import TreeWithSearchWidget
from arho_feature_template.project.layers.code_layers import PlanRegulationGroupTypeLayer

if TYPE_CHECKING:
    from qgis.gui import QgsSpinBox
    from qgis.PyQt.QtWidgets import QBoxLayout, QLineEdit, QWidget

    from arho_feature_template.gui.components.code_combobox import CodeComboBox

ui_path = resources.files(__package__) / "new_plan_regulation_group_form.ui"
FormClass, _ = uic.loadUiType(ui_path)


class NewPlanRegulationGroupForm(QDialog, FormClass):  # type: ignore
    """Form to create a new plan regulation group."""

    def __init__(self):
        super().__init__()
        self.setupUi(self)

        # TYPES
        self.name: QLineEdit
        self.short_name: QLineEdit
        self.group_number: QgsSpinBox
        self.color_code: QLineEdit
        self.type_of_regulation_group: CodeComboBox

        self.regulations_tree_layout: QVBoxLayout
        self.regulations_scroll_area_contents: QWidget
        self.regulations_layout: QBoxLayout
        self.regulation_info: QTextBrowser

        self.button_box: QDialogButtonBox

        # INIT
        self.regulations_selection_widget = TreeWithSearchWidget()
        self.regulations_tree_layout.insertWidget(1, self.regulations_selection_widget)
        self.regulations_selection_widget.tree.itemDoubleClicked.connect(self.add_selected_regulation)
        self.regulations_selection_widget.tree.itemClicked.connect(self.update_selected_regulation)
        for config in RegulationLibrary.get_regulations():
            self._initalize_regulation_from_config(config)

        self.type_of_regulation_group.populate_from_code_layer(PlanRegulationGroupTypeLayer)
        self.type_of_regulation_group.removeItem(0)  # Remove NULL from combobox as underground data is required
        self.button_box.accepted.connect(self._on_ok_clicked)
        self.regulation_widgets: list[RegulationWidget] = []
        self.save_as_config = False

    def _initalize_regulation_from_config(self, config: RegulationConfig, parent: QTreeWidgetItem | None = None):
        item = self.regulations_selection_widget.add_item_to_tree(config.name, config, parent)

        # Initialize plan regulations recursively
        if config.child_regulations:
            for child_config in config.child_regulations:
                self._initalize_regulation_from_config(child_config, item)

    def update_selected_regulation(self, item: QTreeWidgetItem, column: int):
        config: RegulationConfig = item.data(column, Qt.UserRole)  # Retrieve the associated config
        self.regulation_info.setText(config.description)

    def add_selected_regulation(self, item: QTreeWidgetItem, column: int):
        config: RegulationConfig = item.data(column, Qt.UserRole)  # Retrieve the associated config
        if config.category_only:
            return
        self.add_regulation(config)

    def add_regulation(self, config: RegulationConfig):
        regulation = Regulation(config=config)
        widget = RegulationWidget(regulation, parent=self.regulations_scroll_area_contents)
        widget.delete_signal.connect(self.delete_regulation)
        index = self.regulations_layout.count() - 1
        self.regulations_layout.insertWidget(index, widget)
        self.regulation_widgets.append(widget)

    def delete_regulation(self, regulation_widget: RegulationWidget):
        self.regulations_layout.removeWidget(regulation_widget)
        self.regulation_widgets.remove(regulation_widget)
        regulation_widget.deleteLater()

    def into_model(self) -> RegulationGroup:
        return RegulationGroup(
            type_code_id=self.type_of_regulation_group.value(),
            name=self.name.text(),
            short_name=self.short_name.text(),
            color_code=self.color_code.text(),
            group_number=self.group_number.value() if self.group_number.value() > 0 else None,
            regulations=[widget.into_model() for widget in self.regulation_widgets],
            id_=None,
        )

    def _on_ok_clicked(self):
        self.model = self.into_model()
        self.accept()
