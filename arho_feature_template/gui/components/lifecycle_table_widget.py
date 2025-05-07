from __future__ import annotations

from qgis.gui import QgsDateTimeEdit
from qgis.PyQt.QtCore import QDate, Qt, pyqtSignal
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
        self.existing_lifecycles: dict[str, LifeCycle] = {}

        # Initialize table widget
        self.setColumnCount(3)
        self.setHorizontalHeaderLabels(["Elinkaaren tila", "Alkupäivämäärä", "Loppupäivämäärä"])

        header = self.horizontalHeader()
        header.setSectionResizeMode(0, QHeaderView.Stretch)
        self.setMinimumWidth(600)
        self.setColumnWidth(1, 120)
        self.setColumnWidth(2, 120)

        # Add existing lifecycles
        for lifecycle in sorted(lifecycles, key=lambda x: x.starting_at):  # type: ignore[arg-type, return-value]
            self.add_lifecycle_row(lifecycle)
            self.existing_lifecycles[str(lifecycle.id_)] = lifecycle

        # If 0 rows, initialize 1 row since Plan needs at least one lifecycle
        if self.rowCount() == 0:
            self.add_new_lifecycle_row()

    def add_new_lifecycle_row(self):
        self.add_lifecycle_row(LifeCycle())

    def add_lifecycle_row(self, lifecycle: LifeCycle):
        row_position = self.rowCount()
        self.insertRow(row_position)

        id_item = QTableWidgetItem()
        id_item.setData(Qt.UserRole, lifecycle.id_)
        self.setItem(row_position, 0, id_item)

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
            start_date_edit.setDate(lifecycle.starting_at)
        self.setCellWidget(row_position, 1, start_date_edit)

        end_date_edit = QgsDateTimeEdit()
        end_date_edit.setDisplayFormat("yyyy-MM-dd")
        end_date_edit.setCalendarPopup(True)
        end_date_edit.setSpecialValueText("")  # Allow empty value
        if lifecycle.ending_at:
            end_date_edit.setDate(lifecycle.ending_at)
        else:
            end_date_edit.clear()
        self.setCellWidget(row_position, 2, end_date_edit)

        self.table_edited.emit()

    def is_ok(self) -> bool:
        for row in range(self.rowCount()):
            status_item = self.cellWidget(row, 0)
            start_date_item = self.cellWidget(row, 1)
            if status_item.value() is None or start_date_item.date().isNull():
                return False

        return True

    def row_into_model(self, row_i: int) -> LifeCycle:
        status_item = self.cellWidget(row_i, 0)
        start_date_item = self.cellWidget(row_i, 1)
        end_date_item = self.cellWidget(row_i, 2)

        id_item = self.item(row_i, 0)

        model = LifeCycle(
            status_id=status_item.value(),
            starting_at=start_date_item.date(),
            ending_at=end_date_item.date() if end_date_item.date() != QDate() else None,
            id_=id_item.data(Qt.UserRole),
        )
        if model.id_:
            previous_model = self.existing_lifecycles.get(model.id_)
            if previous_model and model == previous_model:
                model.modified = False

        return model

    def into_model(self) -> list[LifeCycle]:
        """Extracts all lifecycle data from the table into a list of LifeCycle objects."""
        return [self.row_into_model(row) for row in range(self.rowCount())]
