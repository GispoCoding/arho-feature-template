from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.PyQt import uic
from qgis.PyQt.QtCore import QStringListModel
from qgis.PyQt.QtWidgets import QDialog, QListView, QMessageBox, QProgressBar

from arho_feature_template.core.lambda_service import LambdaService
from arho_feature_template.utils.misc_utils import form_validation_messages, get_active_plan_id

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QListView

# Load the UI file
ui_path = resources.files(__package__) / "post_plan.ui"
FormClass, _ = uic.loadUiType(ui_path)


class PostPlan(QDialog, FormClass):  # type: ignore
    def __init__(self, parent=None) -> None:
        super().__init__(parent)
        self.setupUi(self)

        # Initialize list model and assign to the list view
        self.validation_list_model: QStringListModel = QStringListModel()
        self.validation_list_view: QListView = self.validationListView
        self.validation_list_view.setModel(self.validation_list_model)

        # Initialize progress bar
        self.progress_bar: QProgressBar = self.progressBar
        self.progress_bar.setRange(0, 0)
        self.progress_bar.hide()

        # Initialize buttons
        self.export_button = self.exportButton
        self.export_button.clicked.connect(self.post_plan)
        self.dialogButtonBox.rejected.connect(self.reject)

    def post_plan(self):
        """Triggers Ryhti export."""
        # Disable the button to prevent multiple clicks
        self.export_button.setEnabled(False)
        self.progress_bar.show()

        plan_id = get_active_plan_id()
        if not plan_id:
            QMessageBox.critical(self, "Virhe", "Ei aktiivista kaavaa.")
            self._enable_export_button()
            return
        self.lambda_service = LambdaService()
        self.lambda_service.post_received.connect(self.update_message_list)
        self.lambda_service.post_plan(plan_id)

    def update_message_list(self, post_json):
        """Handles the Lambda response."""
        if not post_json:
            self.progress_bar.hide()
            QMessageBox.critical(self, "Virhe", "Lambda palautti tyhjän vastauksen.")
            self.export_button.setEnabled(True)
            self._enable_export_button()
            return

        # Clear previous validation messages
        self.validation_list_model.setStringList([])

        if not post_json:
            QMessageBox.critical(self, "Virhe", "Lambdan vastauksesta puuttuu 'ryhti_responses'.")
            self._enable_export_button()
            return
        validation_messages = form_validation_messages(post_json)

        # Update the list view with errors and warnings
        self.validation_list_model.setStringList(validation_messages)
        self._enable_export_button()

    def _enable_export_button(self):
        """Hides progress bar and re-enables export_button"""
        self.progress_bar.hide()
        self.export_button.setEnabled(True)
