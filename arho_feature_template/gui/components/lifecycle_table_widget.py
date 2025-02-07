from __future__ import annotations

from qgis.gui import QgsDateTimeEdit
from qgis.PyQt.QtCore import Qt, pyqtSignal
from qgis.PyQt.QtWidgets import (
    QHeaderView,
    QTableWidget,
    QTableWidgetItem,
)

from arho_feature_template.core.models import LifeCycle
from arho_feature_template.gui.components.code_combobox import CodeComboBox
from arho_feature_template.project.layers.code_layers import LifeCycleStatusLayer


class LifecycleTableWidget(QTableWidget):
    table_edited = pyqtSignal()

    def __init__(self, lifecycles: list[LifeCycle], parent=None):
        super().__init__(parent)

        self.lifecycles = lifecycles

        # Initialize table widget
        self.setColumnCount(4)
        self.setHorizontalHeaderLabels(["Elinkaaren tila", "Alkupäivämäärä", "Loppupäivämäärä", "ID"])
        self.setColumnHidden(3, True)

        header = self.horizontalHeader()
        header.setSectionResizeMode(0, QHeaderView.Stretch)
        for i in range(1, 3):
            header.setSectionResizeMode(i, QHeaderView.ResizeToContents)
            header.setMinimumSectionSize(110)

        # Add given lifecycles
        for lifecycle in lifecycles:
            self.add_lifecycle_row(lifecycle)

        # If 0 rows, initialize 1 row since Plan needs at least one lifecycle
        if self.rowCount() == 0:
            self.add_new_lifecycle_row()

    def add_new_lifecycle_row(self):
        self.add_lifecycle_row(LifeCycle())

    def add_lifecycle_row(self, lifecycle: LifeCycle):
        row_position = self.rowCount()
        self.insertRow(row_position)

        status = CodeComboBox()
        status.populate_from_code_layer(LifeCycleStatusLayer)
        status.currentIndexChanged.connect(self.table_edited.emit)
        if lifecycle.status_id:
            status.set_value(lifecycle.status_id)
        self.setCellWidget(row_position, 0, status)

        start_date_edit = QgsDateTimeEdit()
        start_date_edit.setDisplayFormat("yyyy-MM-dd")
        start_date_edit.setCalendarPopup(True)
        start_date_edit.valueChanged.connect(self.table_edited.emit)
        if lifecycle.starting_at:
            start_date_edit.setDate(lifecycle.starting_at.date())
        self.setCellWidget(row_position, 1, start_date_edit)

        end_date_edit = QgsDateTimeEdit()
        end_date_edit.setDisplayFormat("yyyy-MM-dd")
        end_date_edit.setCalendarPopup(True)
        end_date_edit.setSpecialValueText("")  # Allow empty value
        if lifecycle.ending_at:
            end_date_edit.setDate(lifecycle.ending_at.date())
        else:
            end_date_edit.clear()
        self.setCellWidget(row_position, 2, end_date_edit)

        # Store ID in a hidden column
        id_item = QTableWidgetItem(str(lifecycle.id_) if lifecycle.id_ else "")
        id_item.setData(Qt.UserRole, lifecycle.id_)
        self.setItem(row_position, 3, id_item)

        self.table_edited.emit()

    def is_ok(self) -> bool:
        for row in range(self.rowCount()):
            status_item = self.cellWidget(row, 0)
            start_date_item = self.cellWidget(row, 1)
            if status_item.value() is None or start_date_item.date().toString("yyyy-MM-dd") == "":
                return False

        return True

    def row_into_model(self, row_i: int) -> LifeCycle:
        status_item = self.cellWidget(row_i, 0)
        start_date_item = self.cellWidget(row_i, 1)
        end_date_item = self.cellWidget(row_i, 2)
        id_item = self.item(row_i, 3)

        start_date = start_date_item.date().toString("yyyy-MM-dd") if start_date_item.date() else ""
        end_date = end_date_item.date().toString("yyyy-MM-dd") if end_date_item.date() else None

        return LifeCycle(
            status_id=status_item.value(),
            starting_at=start_date,
            ending_at=end_date,
            id_=id_item.data(Qt.UserRole) if id_item else None,  # Retrieve ID from the hidden column
        )

    def into_model(self) -> list[LifeCycle]:
        """Extracts all lifecycle data from the table into a list of LifeCycle objects."""
        return [self.row_into_model(row) for row in range(self.rowCount())]
