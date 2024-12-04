from importlib import resources

from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import QDialog, QDialogButtonBox, QFileDialog, QLineEdit, QPushButton

ui_path = resources.files(__package__) / "serialize_plan.ui"
FormClass, _ = uic.loadUiType(ui_path)


class SerializePlan(QDialog, FormClass):  # type: ignore
    plan_outline_path_edit: QLineEdit
    plan_path_edit: QLineEdit
    plan_outline_select_button: QPushButton
    plan_select_button: QPushButton

    def __init__(self):
        super().__init__()
        self.setupUi(self)

        self.plan_outline_select_button.clicked.connect(self.select_plan_outline_file)
        self.plan_select_button.clicked.connect(self.select_plan_file)

        # Disable Save button initially
        self.buttonBox.button(QDialogButtonBox.Save).setEnabled(False)
        self.buttonBox.accepted.connect(self.accept)
        self.buttonBox.rejected.connect(self.reject)

    def select_plan_outline_file(self):
        file_path, _ = QFileDialog.getSaveFileName(
            self, "Valitse kaavan ulkorajan tallennuspolku", "", "JSON Files (*.json)"
        )
        if file_path:
            self.plan_outline_path_edit.setText(file_path)
            self.check_inputs()

    def select_plan_file(self):
        file_path, _ = QFileDialog.getSaveFileName(self, "Valitse kaavan tallennuspolku", "", "JSON Files (*.json)")
        if file_path:
            self.plan_path_edit.setText(file_path)
            self.check_inputs()

    def check_inputs(self):
        # Enable Save button if both text fields have paths
        if self.plan_outline_path_edit.text() and self.plan_path_edit.text():
            self.buttonBox.button(QDialogButtonBox.Save).setEnabled(True)
        else:
            self.buttonBox.button(QDialogButtonBox.Save).setEnabled(False)

    def get_paths(self):
        return self.plan_outline_path_edit.text(), self.plan_path_edit.text()
