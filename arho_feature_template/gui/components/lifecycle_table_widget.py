from __future__ import annotations

from qgis.gui import QgsDateTimeEdit
from qgis.PyQt.QtCore import QDate, QDateTime, Qt, pyqtSignal
from qgis.PyQt.QtWidgets import QHeaderView, QTableWidget, QTableWidgetItem

from arho_feature_template.core.models import LifeCycle
from arho_feature_template.gui.components.code_combobox import CodeComboBox
from arho_feature_template.project.layers.code_layers import LifeCycleStatusLayer


class DateTimeTableWidgetItem(QTableWidgetItem):
    def __init__(self, datetime_obj: QDateTime):
        super().__init__()
        self.set_datetime(datetime_obj)

    def set_datetime(self, datetime_obj: QDateTime):
        self.setData(Qt.UserRole, datetime_obj)
        if datetime_obj and datetime_obj.isValid():
            self.setText(datetime_obj.toString(Qt.ISODate))
        else:
            self.setText("")

    def __lt__(self, other: DateTimeTableWidgetItem) -> bool:
        dt1 = self.data(Qt.UserRole)
        dt2 = other.data(Qt.UserRole)

        if not dt1.isValid() and not dt2.isValid():
            return False  # Treat both as equal if invalid
        if not dt1.isValid():
            return False  # Invalid comes after valid
        if not dt2.isValid():
            return True  # Valid comes before invalid

        return dt1 < dt2


class LifeCycleTableWidgetItem(QTableWidgetItem):
    def __init__(self, text: str, data_value: int | None):
        super().__init__()
        self.set_text_value(text, data_value)

    def set_text_value(self, text: str, data_value: int | None):
        self.setText(text)
        self.setData(Qt.UserRole, data_value)

    def __lt__(self, other: LifeCycleTableWidgetItem) -> bool:
        val1 = self.data(Qt.UserRole)
        val2 = other.data(Qt.UserRole)

        if val1 is None and val2 is None:
            return False  # Treat both as equal if None
        if val1 is None:
            return False  # None comes before valid
        if val2 is None:
            return True  # Valid comes after None

        return val1 < val2


class LifecycleTableWidget(QTableWidget):
    table_edited = pyqtSignal()

    def __init__(self, lifecycles: list[LifeCycle], parent=None):
        super().__init__(parent)

        self.lifecycles = lifecycles
        self.existing_lifecycles: dict[str, LifeCycle] = {}
        self.lifecycle_values: dict[str, int] = {}
        for feature in LifeCycleStatusLayer.get_from_project().getFeatures():
            self.lifecycle_values[feature["name"]["fin"]] = int(feature["value"])

        # Initialize table widget
        self.setColumnCount(4)
        self.setHorizontalHeaderLabels(["Elinkaaren tila", "Alkupäivämäärä", "Loppupäivämäärä", ""])
        self.setSortingEnabled(True)

        header = self.horizontalHeader()
        header.setSectionResizeMode(0, QHeaderView.Stretch)
        self.setMinimumWidth(600)
        self.setColumnWidth(1, 120)
        self.setColumnWidth(2, 120)
        self.setColumnHidden(3, True)  # Place lifecycle.id_ into hidden column

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
        # Set sorting temporarily disabled so that the new row will be the last
        self.setSortingEnabled(False)
        row_position = self.rowCount()
        self.insertRow(row_position)

        # Life cycle status
        status = CodeComboBox()
        status.populate_from_code_layer(LifeCycleStatusLayer)

        if lifecycle.status_id:
            status.set_value(lifecycle.status_id)
        self.setCellWidget(row_position, 0, status)

        status_text = status.currentText()
        status_value = self.lifecycle_values[status_text] if status_text != "NULL" else None
        status_item = LifeCycleTableWidgetItem(status_text, status_value)
        self.setItem(row_position, 0, status_item)

        status.currentIndexChanged.connect(lambda _, cb=status: self._on_status_changed(cb))

        # Start date
        start_date_edit = QgsDateTimeEdit()
        start_date_edit.setDisplayFormat("yyyy-MM-dd")
        start_date_edit.setCalendarPopup(True)
        if lifecycle.starting_at:
            start_date_edit.setDate(lifecycle.starting_at)
        self.setCellWidget(row_position, 1, start_date_edit)

        start_date_item = DateTimeTableWidgetItem(start_date_edit.dateTime())
        self.setItem(row_position, 1, start_date_item)

        start_date_edit.dateTimeChanged.connect(
            lambda dt, row=row_position, col=1: (self._update_datetime_item(dt, row, col), self.table_edited.emit())
        )

        # End date
        end_date_edit = QgsDateTimeEdit()
        end_date_edit.setDisplayFormat("yyyy-MM-dd")
        end_date_edit.setCalendarPopup(True)
        end_date_edit.setSpecialValueText("")  # Allow empty value
        if lifecycle.ending_at:
            end_date_edit.setDate(lifecycle.ending_at)
        else:
            end_date_edit.clear()
        self.setCellWidget(row_position, 2, end_date_edit)

        end_date_item = DateTimeTableWidgetItem(end_date_edit.dateTime())
        self.setItem(row_position, 2, end_date_item)

        end_date_edit.dateTimeChanged.connect(
            lambda dt, row=row_position, col=2: (self._update_datetime_item(dt, row, col), self.table_edited.emit())
        )

        # Lifecycle status id
        id_item = QTableWidgetItem()
        id_item.setData(Qt.UserRole, lifecycle.id_)
        self.setItem(row_position, 3, id_item)

        self.table_edited.emit()
        self.setSortingEnabled(True)

    def _on_status_changed(self, combobox: CodeComboBox):
        edited_row = None
        for row in range(self.rowCount()):
            if self.cellWidget(row, 0) is combobox:
                edited_row = row
                break

        if edited_row is not None:
            self._update_cb_item(
                combobox.currentText(),
                edited_row,
                0,
                self.lifecycle_values[combobox.currentText()] if combobox.currentText() != "NULL" else None,
            )
            self.table_edited.emit()

    def _update_datetime_item(self, datetime_obj: QDateTime, row: int, col: int):
        item = self.item(row, col)
        if isinstance(item, DateTimeTableWidgetItem):
            item.set_datetime(datetime_obj)

    def _update_cb_item(self, text: str, row: int, col: int, data_value: int | None):
        item = self.item(row, col)
        if isinstance(item, LifeCycleTableWidgetItem):
            item.set_text_value(text, data_value)

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
        id_item = self.item(row_i, 3)

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
