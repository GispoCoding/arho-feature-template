from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt
from qgis.PyQt.QtGui import QStandardItem, QStandardItemModel
from qgis.PyQt.QtWidgets import (
    QComboBox,
    QDateEdit,
    QDialog,
    QDialogButtonBox,
    QLineEdit,
    QListView,
    QPushButton,
    QSizePolicy,
    QSpacerItem,
    QTextEdit,
    QTreeWidgetItem,
)

from arho_feature_template.core.models import LifeCycle, Plan, RegulationGroup, RegulationGroupLibrary
from arho_feature_template.gui.components.plan_regulation_group_widget import RegulationGroupWidget
from arho_feature_template.gui.components.tree_with_search_widget import TreeWithSearchWidget
from arho_feature_template.project.layers.code_layers import (
    LifeCycleStatusLayer,
    OrganisationLayer,
    PlanTypeLayer,
)

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QComboBox, QLineEdit, QTextEdit, QVBoxLayout, QWidget

    from arho_feature_template.gui.components.code_combobox import CodeComboBox, HierarchicalCodeComboBox

ui_path = resources.files(__package__) / "plan_attribute_form.ui"
FormClass, _ = uic.loadUiType(ui_path)


class PlanAttributeForm(QDialog, FormClass):  # type: ignore
    permanent_identifier_line_edit: QLineEdit
    name_line_edit: QLineEdit
    organisation_combo_box: CodeComboBox
    description_text_edit: QTextEdit
    plan_type_combo_box: HierarchicalCodeComboBox
    # lifecycle_status_combo_box: CodeComboBox
    record_number_line_edit: QLineEdit
    producers_plan_identifier_line_edit: QLineEdit
    matter_management_identifier_line_edit: QLineEdit

    plan_regulation_group_scrollarea_contents: QWidget
    plan_regulation_group_libraries_combobox: QComboBox
    regulation_groups_tree_layout: QVBoxLayout

    lifecycle_status_combo_box: CodeComboBox
    lifecycle_start_date: QDateEdit
    lifecycle_end_date: QDateEdit
    add_lifecycle_button: QPushButton
    lifecycle_list: QListView

    button_box: QDialogButtonBox

    def __init__(self, plan: Plan, regulation_group_libraries: list[RegulationGroupLibrary], parent=None):
        super().__init__(parent)

        self.setupUi(self)

        self.plan = plan

        self.plan_type_combo_box.populate_from_code_layer(PlanTypeLayer)
        self.lifecycle_status_combo_box.populate_from_code_layer(LifeCycleStatusLayer)
        self.organisation_combo_box.populate_from_code_layer(OrganisationLayer)

        self.plan_type_combo_box.set_value(plan.plan_type_id)
        self.lifecycle_status_combo_box.set_value(plan.lifecycle_status_id)
        self.organisation_combo_box.set_value(plan.organisation_id)
        self.name_line_edit.setText(plan.name if plan.name else "")
        self.description_text_edit.setText(plan.description if plan.description else "")
        self.permanent_identifier_line_edit.setText(
            plan.permanent_plan_identifier if plan.permanent_plan_identifier else ""
        )
        self.record_number_line_edit.setText(plan.record_number if plan.record_number else "")
        self.producers_plan_identifier_line_edit.setText(
            plan.producers_plan_identifier if plan.producers_plan_identifier else ""
        )
        self.matter_management_identifier_line_edit.setText(
            plan.matter_management_identifier if plan.matter_management_identifier else ""
        )

        self.name_line_edit.textChanged.connect(self._check_required_fields)
        self.organisation_combo_box.currentIndexChanged.connect(self._check_required_fields)
        self.plan_type_combo_box.currentIndexChanged.connect(self._check_required_fields)
        self.lifecycle_status_combo_box.currentIndexChanged.connect(self._check_required_fields)

        self.scroll_area_spacer = None
        self.regulation_groups_selection_widget = TreeWithSearchWidget()
        self.regulation_groups_tree_layout.insertWidget(2, self.regulation_groups_selection_widget)
        self.regulation_group_widgets: list[RegulationGroupWidget] = []
        for library in regulation_group_libraries:
            self.init_plan_regulation_group_library(library)

        self.regulation_groups_selection_widget.tree.itemDoubleClicked.connect(self.add_selected_plan_regulation_group)

        for regulation_group in plan.general_regulations:
            self.add_plan_regulation_group(regulation_group)

        self.lifecycle_model = QStandardItemModel()
        self.lifecycle_list.setModel(self.lifecycle_model)
        self.add_lifecycle_button.clicked.connect(self.save_lifecycle)

        self.button_box.button(QDialogButtonBox.Ok).setEnabled(False)
        self.button_box.accepted.connect(self._on_ok_clicked)

        self._check_required_fields()

    def _check_required_fields(self) -> None:
        ok_button = self.button_box.button(QDialogButtonBox.Ok)
        if (
            self.name_line_edit.text() != ""
            and self.plan_type_combo_box.value() is not None
            and self.organisation_combo_box.value() is not None
            # and self.lifecycle_status_combo_box.value() is not None
            and self.lifecycle_model.rowCount() > 0
        ):
            ok_button.setEnabled(True)
        else:
            ok_button.setEnabled(False)

    # --- COPIED FROM PLAN FEATURE FORM ---

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

    def add_plan_regulation_group(self, regulation_group: RegulationGroup):
        regulation_group_widget = RegulationGroupWidget(regulation_group, layer_name="Kaava")
        regulation_group_widget.delete_signal.connect(self.remove_plan_regulation_group)
        self._remove_spacer()
        self.plan_regulation_group_scrollarea_contents.layout().addWidget(regulation_group_widget)
        self.regulation_group_widgets.append(regulation_group_widget)
        self._add_spacer()

    def remove_plan_regulation_group(self, regulation_group_widget: RegulationGroupWidget):
        self.plan_regulation_group_scrollarea_contents.layout().removeWidget(regulation_group_widget)
        self.regulation_group_widgets.remove(regulation_group_widget)
        regulation_group_widget.deleteLater()

    def init_plan_regulation_group_library(self, library: RegulationGroupLibrary):
        self.plan_regulation_group_libraries_combobox.addItem(library.name)
        for category in library.regulation_group_categories:
            category_item = self.regulation_groups_selection_widget.add_item_to_tree(category.name)
            for group_definition in category.regulation_groups:
                self.regulation_groups_selection_widget.add_item_to_tree(
                    group_definition.name, group_definition, category_item
                )

    # ---

    def save_lifecycle(self):
        # Get values from the widgets
        status = self.lifecycle_status_combo_box.currentText()  # Get the selected text from the combo box
        start_date = self.lifecycle_start_date.date().toString("yyyy-MM-dd")  # Format the QDate as a string
        end_date = self.lifecycle_end_date.date().toString("yyyy-MM-dd") if self.lifecycle_end_date.date() else None

        # Format the lifecycle entry
        date_range = f"{start_date} - {end_date}" if end_date else start_date
        lifecycle_entry = f"{status} | {date_range}"

        # Add to the model
        item = QStandardItem(lifecycle_entry)
        self.lifecycle_model.appendRow(item)

        # Optionally, check required fields again
        self._check_required_fields()

    def into_lifecycle_model(self) -> list[LifeCycle]:
        print("Calling into_lifecycle_model at plan_attribute_form.py")
        lifecycles = []

        for row in range(self.lifecycle_model.rowCount()):
            item = self.lifecycle_model.item(row)
            if item:
                lifecycle_entry = item.text()
                parts = lifecycle_entry.split(" | ")
                status = parts[0]
                date_range = parts[1]
                date_parts = date_range.split(" - ")
                start_date = date_parts[0]
                end_date = date_parts[1] if len(date_parts) > 1 else None  # End date is optional

                print(f"Got status: {status}")
                print(f"Got status_id: {LifeCycleStatusLayer.get_id_by_value(status)}")

                # Add the lifecycle to the list
                lifecycles.append(
                    LifeCycle(
                        status_id=LifeCycleStatusLayer.get_id_by_value(status),
                        plan_id="52aadc88-feb0-443b-a423-f5a50d0bb9fc",
                        land_use_are_id=None,
                        other_area_id=None,
                        line_id=None,
                        land_use_point_id=None,
                        other_point_id=None,
                        starting_at=start_date,
                        ending_at=end_date,
                        plan_regulation_id=None,
                        plan_proposition_id=None,
                    )
                )

        return lifecycles

    def into_model(self) -> Plan:
        return Plan(
            id_=self.plan.id_,
            name=self.name_line_edit.text(),
            description=self.description_text_edit.toPlainText() or None,
            plan_type_id=self.plan_type_combo_box.value(),
            organisation_id=self.organisation_combo_box.value(),
            permanent_plan_identifier=self.permanent_identifier_line_edit.text() or None,
            record_number=self.record_number_line_edit.text() or None,
            producers_plan_identifier=self.producers_plan_identifier_line_edit.text() or None,
            matter_management_identifier=self.matter_management_identifier_line_edit.text() or None,
            lifecycle_status_id=self.lifecycle_status_combo_box.value(),  # Need to get the lifecycle with the latest lifecycle
            # lifecycle=self.get_lifecycles(),
            general_regulations=[reg_group_widget.into_model() for reg_group_widget in self.regulation_group_widgets],
            geom=self.plan.geom,
        )

    def _on_ok_clicked(self):
        self.model = self.into_model()
        self.lifecycle_model = self.into_lifecycle_model()
        self.accept()
