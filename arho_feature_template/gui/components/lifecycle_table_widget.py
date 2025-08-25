from __future__ import annotations

# from datetime import datetime
from qgis.gui import QgsDateTimeEdit
from qgis.PyQt.QtCore import QDate, Qt, pyqtSignal
from qgis.PyQt.QtWidgets import (
    QHeaderView,
    QTableWidget,
    QTableWidgetItem,
)

from arho_feature_template.core.models import EventDate, LifeCycle
from arho_feature_template.gui.components.code_combobox import CodeComboBox
from arho_feature_template.project.layers.code_layers import LifeCycleStatusLayer


class LifecycleTableWidget(QTableWidget):
    table_edited = pyqtSignal()
    row_added = pyqtSignal(object)
    lifecycle_selected = pyqtSignal(LifeCycle)
    status_changed = pyqtSignal(int, object)

    def __init__(self, lifecycles: list[LifeCycle], parent=None):
        super().__init__(parent)

        self.lifecycles = lifecycles
        self.existing_lifecycles: dict[str, LifeCycle] = {}

        self.setColumnCount(4)
        self.setHorizontalHeaderLabels(["Elinkaaren tila", "Alkupäivämäärä", "Loppupäivämäärä", "lifecycle_id"])
        self.setColumnHidden(3, True)  # hide the lifecycle_id column

        header = self.horizontalHeader()
        header.setSectionResizeMode(0, QHeaderView.Stretch)
        self.setMinimumWidth(600)
        self.setColumnWidth(1, 120)
        self.setColumnWidth(2, 120)

        # Add existing lifecycles
        for lifecycle in sorted(lifecycles, key=lambda x: x.starting_at or QDate(), reverse=True):
            self.add_lifecycle_row(lifecycle)
            if lifecycle.id_:
                self.existing_lifecycles[str(lifecycle.id_)] = lifecycle

        if self.rowCount() == 0:
            self.add_new_lifecycle_row()

    def add_new_lifecycle_row(self):
        self.add_lifecycle_row(LifeCycle())
        self.row_added.emit(LifeCycle())

    def get_lifecycle_at(self, row_index: int) -> LifeCycle:
        return self.row_into_model(row_index)

    def add_lifecycle_row(self, lifecycle: LifeCycle):
        row_position = self.rowCount()
        self.insertRow(row_position)

        id_item = QTableWidgetItem()
        id_item.setData(Qt.UserRole, lifecycle.id_)
        self.setItem(row_position, 3, id_item)

        status = CodeComboBox()
        status.populate_from_code_layer(LifeCycleStatusLayer)

        status.currentIndexChanged.connect(
            lambda _, row=row_position, s=status: self.status_changed.emit(row, s.value())
        )

        if lifecycle.status_id:
            status.set_value(lifecycle.status_id)

        self.setCellWidget(row_position, 0, status)

        start_date_edit = QgsDateTimeEdit()
        start_date_edit.setDisplayFormat("yyyy-MM-dd")
        start_date_edit.setCalendarPopup(True)
        start_date_edit.setAllowNull(True)
        start_date_edit.valueChanged.connect(self.table_edited.emit)

        if lifecycle.starting_at:
            start_date_edit.setDate(lifecycle.starting_at)
        else:
            start_date_edit.clear()

        self.setCellWidget(row_position, 1, start_date_edit)

        end_date_edit = QgsDateTimeEdit()
        end_date_edit.setDisplayFormat("yyyy-MM-dd")
        end_date_edit.setCalendarPopup(True)
        end_date_edit.setSpecialValueText("")
        end_date_edit.setAllowNull(True)
        end_date_edit.valueChanged.connect(self.table_edited.emit)

        if lifecycle.ending_at:
            end_date_edit.setDate(lifecycle.ending_at)
        else:
            end_date_edit.clear()

        self.setCellWidget(row_position, 2, end_date_edit)
        self.table_edited.emit()

    def is_ok(self) -> bool:
        is_table_ok = True
        for row in range(self.rowCount()):
            status_item = self.cellWidget(row, 0)
            start_date_item = self.cellWidget(row, 1)
            if status_item is None or start_date_item is None:
                is_table_ok = False
                break
            if status_item.value() is None or not start_date_item.date().isValid():
                is_table_ok = False
                break
        return is_table_ok

    def row_into_model(
        self,
        row_i: int,
        event_dates_by_lifecycle_id: dict[str | None, list[EventDate]] | None = None,
    ) -> LifeCycle:
        status_item = self.cellWidget(row_i, 0)
        start_date_item = self.cellWidget(row_i, 1)
        end_date_item = self.cellWidget(row_i, 2)
        id_item = self.item(row_i, 3)

        lifecycle_id = id_item.data(Qt.UserRole) if id_item else None

        model = LifeCycle(
            status_id=status_item.value(),
            starting_at=start_date_item.date(),
            ending_at=end_date_item.date() if end_date_item.date() != QDate() else None,
            id_=lifecycle_id,
            event_dates=event_dates_by_lifecycle_id.get(lifecycle_id, []) if event_dates_by_lifecycle_id else [],
        )

        if model.id_ and model.id_ in self.existing_lifecycles:
            previous_model = self.existing_lifecycles.get(model.id_)
            if previous_model and model == previous_model:
                model.modified = False
        return model

    def into_model(
        self, event_dates_by_lifecycle_id: dict[str | None, list[EventDate]] | None = None
    ) -> list[LifeCycle]:
        lifecycles_from_table = []
        for row in range(self.rowCount()):
            lifecycle = self.row_into_model(row, event_dates_by_lifecycle_id)
            lifecycles_from_table.append(lifecycle)
        return lifecycles_from_table
