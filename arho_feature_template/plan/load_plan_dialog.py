from importlib import resources

from qgis.core import QgsProviderRegistry
from qgis.PyQt import uic
from qgis.PyQt.QtCore import QRegularExpression, QSortFilterProxyModel, Qt
from qgis.PyQt.QtGui import QStandardItem, QStandardItemModel
from qgis.PyQt.QtWidgets import QComboBox, QDialog, QDialogButtonBox, QLineEdit, QMessageBox, QPushButton, QTableView

from arho_feature_template.exceptions import UnexpectedNoneError

ui_path = resources.files(__package__) / "load_plan_dialog.ui"

LoadPlanDialogBase, _ = uic.loadUiType(ui_path)


class PlanFilterProxyModel(QSortFilterProxyModel):
    def filterAcceptsRow(self, source_row, source_parent):  # noqa: N802
        model = self.sourceModel()
        if not model:
            return False

        filter_text = self.filterRegularExpression().pattern()
        if not filter_text:
            return True

        for column in range(5):
            index = model.index(source_row, column, source_parent)
            data = model.data(index)
            if data and filter_text.lower() in data.lower():
                return True

        return False


class LoadPlanDialog(QDialog, LoadPlanDialogBase):  # type: ignore
    connectionComboBox: QComboBox  # noqa: N815
    push_button_load: QPushButton
    planTableView: QTableView  # noqa: N815
    searchLineEdit: QLineEdit  # noqa: N815
    buttonBox: QDialogButtonBox  # noqa: N815

    def __init__(self, parent, connections):
        super().__init__(parent)
        self.setupUi(self)

        self._selected_plan_id = None

        self.buttonBox.rejected.connect(self.reject)
        self.buttonBox.accepted.connect(self.accept)
        self.buttonBox.button(QDialogButtonBox.Ok).setEnabled(False)

        self.push_button_load.clicked.connect(self.load_plans)
        self.searchLineEdit.textChanged.connect(self.filter_plans)

        self.connectionComboBox.addItems(connections)

        self.planTableView.setSelectionMode(QTableView.SingleSelection)
        self.planTableView.setSelectionBehavior(QTableView.SelectRows)

        self.model = QStandardItemModel()
        self.model.setColumnCount(5)
        self.model.setHorizontalHeaderLabels(
            [
                "ID",
                "Tuottajan kaavatunnus",
                "Nimi",
                "Kaavan elinkaaren tila",
                "Kaavalaji",
            ]
        )

        self.filterProxyModel = PlanFilterProxyModel()
        self.filterProxyModel.setSourceModel(self.model)
        self.filterProxyModel.setFilterCaseSensitivity(Qt.CaseInsensitive)

        self.planTableView.setModel(self.filterProxyModel)
        self.planTableView.selectionModel().selectionChanged.connect(self.on_selection_changed)

    def load_plans(self):
        self.model.removeRows(0, self.model.rowCount())

        selected_connection = self.connectionComboBox.currentText()
        if not selected_connection:
            self.planTableView.setModel(QStandardItemModel())
            return

        provider_registry = QgsProviderRegistry.instance()
        if provider_registry is None:
            raise UnexpectedNoneError
        postgres_provider_metadata = provider_registry.providerMetadata("postgres")
        if postgres_provider_metadata is None:
            raise UnexpectedNoneError

        try:
            connection = postgres_provider_metadata.createConnection(selected_connection)
            plans = connection.executeSql("""
                SELECT
                    p.id,
                    p.producers_plan_identifier,
                    p.name ->> 'fin' AS name_fin,
                    l.name ->> 'fin' AS lifecycle_status_fin,
                    pt.name ->> 'fin' AS plan_type_fin
                FROM
                    hame.plan p
                LEFT JOIN
                    codes.lifecycle_status l
                ON
                    p.lifecycle_status_id = l.id
                LEFT JOIN
                    codes.plan_type pt
                ON
                    p.plan_type_id = pt.id;
            """)
            for plan in plans:
                self.model.appendRow([QStandardItem(column) for column in plan])

        except Exception as e:  # noqa: BLE001
            QMessageBox.critical(self, "Error", f"Failed to load plans: {e}")
            self.model.removeRows(0, self.model.rowCount())

    def filter_plans(self):
        search_text = self.searchLineEdit.text()
        if search_text:
            search_regex = QRegularExpression(search_text)
            self.filterProxyModel.setFilterRegularExpression(search_regex)
        else:
            self.filterProxyModel.setFilterRegularExpression("")

    def on_selection_changed(self):
        # Enable the OK button only if a row is selected
        selection = self.planTableView.selectionModel().selectedRows()
        ok_button = self.buttonBox.button(QDialogButtonBox.Ok)
        if selection:
            selected_row = selection[0].row()
            self._selected_plan_id = self.planTableView.model().index(selected_row, 0).data()
            ok_button.setEnabled(True)
        else:
            self._selected_plan_id = None
            ok_button.setEnabled(False)

    def get_selected_connection(self):
        return self.connectionComboBox.currentText()

    def get_selected_plan_id(self):
        return self._selected_plan_id
