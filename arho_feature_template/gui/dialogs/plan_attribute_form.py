from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.PyQt import uic
from qgis.PyQt.QtCore import QDate, Qt
from qgis.PyQt.QtGui import QStandardItem, QStandardItemModel
from qgis.PyQt.QtWidgets import (
    QComboBox,
    QDateEdit,
    QDialog,
    QDialogButtonBox,
    QLineEdit,
    QPushButton,
    QSizePolicy,
    QSpacerItem,
    QStyledItemDelegate,
    QTableWidget,
    QTextEdit,
    QTreeWidgetItem,
    QWidget,
)

from arho_feature_template.core.models import LifeCycle, Plan, RegulationGroup, RegulationGroupLibrary
from arho_feature_template.gui.components.code_combobox import CodeComboBox
from arho_feature_template.gui.components.plan_regulation_group_widget import RegulationGroupWidget
from arho_feature_template.gui.components.tree_with_search_widget import TreeWithSearchWidget
from arho_feature_template.project.layers.code_layers import (
    LifeCycleStatusLayer,
    OrganisationLayer,
    PlanTypeLayer,
)

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QComboBox, QLineEdit, QTextEdit, QVBoxLayout, QWidget

    from arho_feature_template.gui.components.code_combobox import HierarchicalCodeComboBox

ui_path = resources.files(__package__) / "plan_attribute_form.ui"
FormClass, _ = uic.loadUiType(ui_path)


class LifecycleTableModel(QStandardItemModel):
    def __init__(self, status_options, parent=None):
        super().__init__(parent)
        self.status_options = status_options

    def flags(self, index):
        if index.column() == 0:  # "Elinkaaren tila" - editable combo box
            return Qt.ItemIsSelectable | Qt.ItemIsEnabled

        if index.column() in (1, 2):  # Dates
            return Qt.ItemIsSelectable | Qt.ItemIsEnabled | Qt.ItemIsEditable
        return super().flags(index)


class LifecycleDelegate(QStyledItemDelegate):
    def create_editor(self, parent, option, index):
        if index.column() == 0:  # Status column
            lifecycle_combo_box = CodeComboBox(parent)
            lifecycle_combo_box.populate_from_code_layer(LifeCycleStatusLayer)
            return lifecycle_combo_box
        if index.column() in (1, 2):  # Dates columns
            date_edit = QDateEdit(parent)
            date_edit.setDisplayFormat("yyyy-MM-dd")
            date_edit.setCalendarPopup(True)
            return date_edit
        return super().createEditor(parent, option, index)

    def set_editor_data(self, editor, index):
        if isinstance(editor, CodeComboBox) and index.column() == 0:
            value = index.data(Qt.EditRole)
            if value is not None:
                editor.set_value(value)
        elif isinstance(editor, QDateEdit) and index.column() in (1, 2):
            value = index.data(Qt.EditRole)
            if value:
                editor.setDate(QDate.fromString(value, "yyyy-MM-dd"))

    def set_model_data(self, editor, model, index):
        if isinstance(editor, CodeComboBox) and index.column() == 0:
            model.setData(index, editor.value(), Qt.EditRole)
        if isinstance(editor, QDateEdit) and index.column() in (1, 2):
            model.setData(index, editor.date().toString("yyyy-MM-dd"), Qt.EditRole)


class PlanAttributeForm(QDialog, FormClass):  # type: ignore
    permanent_identifier_line_edit: QLineEdit
    name_line_edit: QLineEdit
    organisation_combo_box: CodeComboBox
    description_text_edit: QTextEdit
    plan_type_combo_box: HierarchicalCodeComboBox
    lifecycle_status_combo_box: CodeComboBox
    record_number_line_edit: QLineEdit
    producers_plan_identifier_line_edit: QLineEdit
    matter_management_identifier_line_edit: QLineEdit

    plan_regulation_group_scrollarea_contents: QWidget
    plan_regulation_group_libraries_combobox: QComboBox
    regulation_groups_tree_layout: QVBoxLayout

    lifecycle_table: QTableWidget
    add_lifecycle: QPushButton
    delete_lifecycle: QPushButton

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

        # Lifecycle table setup
        self.lifecycle_table.setColumnCount(3)  # Three columns: Status, Start Date, End Date
        self.lifecycle_table.setHorizontalHeaderLabels(["Elinkaaren tila", "Alkupvm", "Loppupvm"])
        self.lifecycle_table.setRowCount(0)  # No rows initially

        self.add_lifecycle_button.clicked.connect(self.add_lifecycle_row)
        self.delete_lifecycle_button.clicked.connect(self.delete_lifecycle_row)

        self.button_box.button(QDialogButtonBox.Ok).setEnabled(False)
        self.button_box.accepted.connect(self._on_ok_clicked)

        self._check_required_fields()

    def _check_required_fields(self) -> None:
        ok_button = self.button_box.button(QDialogButtonBox.Ok)

        # Check if all required fields are filled and lifecycle table has at least one valid row
        has_valid_lifecycle_row = False
        for row in range(self.lifecycle_table.rowCount()):
            status_item = self.lifecycle_table.cellWidget(row, 0)
            start_date_item = self.lifecycle_table.cellWidget(row, 1)
            end_date_item = self.lifecycle_table.cellWidget(row, 2)

            if (
                status_item
                and status_item.value() is not None
                and start_date_item
                and start_date_item.date()
                and (end_date_item and end_date_item.date() or True)
            ):
                has_valid_lifecycle_row = True
                break

        if (
            self.name_line_edit.text() != ""
            and self.plan_type_combo_box.value() is not None
            and self.organisation_combo_box.value() is not None
            and self.lifecycle_status_combo_box.value() is not None
            and has_valid_lifecycle_row  # Ensure there's at least one valid lifecycle row
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

    def add_lifecycle_row(self):
        row_position = self.lifecycle_table.rowCount()
        self.lifecycle_table.insertRow(row_position)

        status = CodeComboBox(self)
        status.populate_from_code_layer(LifeCycleStatusLayer)
        self.lifecycle_table.setCellWidget(row_position, 0, status)

        start_date_edit = QDateEdit(self)
        start_date_edit.setDisplayFormat("yyyy-MM-dd")
        start_date_edit.setCalendarPopup(True)
        self.lifecycle_table.setCellWidget(row_position, 1, start_date_edit)

        end_date_edit = QDateEdit(self)
        end_date_edit.setDisplayFormat("yyyy-MM-dd")
        end_date_edit.setCalendarPopup(True)
        self.lifecycle_table.setCellWidget(row_position, 2, end_date_edit)

        self.lifecycle_table.resizeRowsToContents()
        self.lifecycle_table.resizeColumnsToContents()

    def delete_lifecycle_row(self):
        selected_rows = self.lifecycle_table.selectionModel().selectedRows()

        if selected_rows:
            row_position = selected_rows[0].row()
            self.lifecycle_table.removeRow(row_position)
            self._check_required_fields()

    def save_lifecycle(self):
        for row in range(self.lifecycle_table.rowCount()):
            status = self.lifecycle_table.cellWidget(row, 0)
            start_date_item = self.lifecycle_table.cellWidget(row, 1)
            end_date_item = self.lifecycle_table.cellWidget(row, 2)

            if status and start_date_item:
                status = status.value() if status.value() is not None else ""
                start_date = start_date_item.date().toString("yyyy-MM-dd") if start_date_item.date() else ""
                end_date = end_date_item.date().toString("yyyy-MM-dd") if end_date_item.date() else None

                lifecycle_model_item = QStandardItem(status)
                lifecycle_model_item.setData(status.value(), Qt.UserRole + 1)
                start_date_model_item = QStandardItem(start_date)
                end_date_model_item = QStandardItem(end_date if end_date else "")

                self.lifecycle_table.model().appendRow(
                    [lifecycle_model_item, start_date_model_item, end_date_model_item]
                )

        self._check_required_fields()

    def into_lifecycle_model(self) -> list[LifeCycle]:
        lifecycles = []

        # Iterate through the rows in lifecycle_table
        for row in range(self.lifecycle_table.rowCount()):
            status_item = self.lifecycle_table.cellWidget(row, 0)
            start_date_item = self.lifecycle_table.cellWidget(row, 1)
            end_date_item = self.lifecycle_table.cellWidget(row, 2)

            if status_item and start_date_item:
                status_id = status_item.value()
                start_date = start_date_item.date().toString("yyyy-MM-dd") if start_date_item.date() else ""
                end_date = end_date_item.date().toString("yyyy-MM-dd") if end_date_item.date() else None

                lifecycles.append(LifeCycle(status_id=status_id, starting_at=start_date, ending_at=end_date))

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
            lifecycles=self.into_lifecycle_model(),
            general_regulations=[reg_group_widget.into_model() for reg_group_widget in self.regulation_group_widgets],
            geom=self.plan.geom,
        )

    def _on_ok_clicked(self):
        self.model = self.into_model()
        self.accept()
