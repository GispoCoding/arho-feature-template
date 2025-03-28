from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import Qgis
from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import QDialog, QMessageBox, QProgressBar, QVBoxLayout

from arho_feature_template.core.lambda_service import LambdaService
from arho_feature_template.gui.docks.validation_tree_view import ValidationTreeView
from arho_feature_template.utils.misc_utils import get_active_plan_id, iface

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QPushButton

# Load the UI file
ui_path = resources.files(__package__) / "post_plan.ui"
FormClass, _ = uic.loadUiType(ui_path)


class PostPlan(QDialog, FormClass):  # type: ignore
    def __init__(self, parent=None) -> None:
        super().__init__(parent)
        self.setupUi(self)

        self.validation_result_tree_view = ValidationTreeView(self)
        self.mainLayout: QVBoxLayout = self.findChild(QVBoxLayout, "mainLayout")
        self.mainLayout.insertWidget(0, self.validation_result_tree_view)

        # Initially hide the ValidationTreeView
        self.validation_result_tree_view.hide()

        # Initialize progress bar
        self.progress_bar: QProgressBar = self.progressBar
        self.progress_bar.setRange(0, 0)
        self.progress_bar.hide()

        # Initialize buttons
        self.export_button: QPushButton = self.exportButton
        self.export_button.clicked.connect(self.post_plan)
        self.dialogButtonBox.rejected.connect(self.reject)

        # Lambda service for API calls
        self.lambda_service = LambdaService()
        self.lambda_service.plan_matter_received.connect(self.update_message_list)

    def post_plan(self):
        """Triggers Ryhti export."""
        self.export_button.setEnabled(False)
        self.progress_bar.show()  # Show progress bar

        plan_id = get_active_plan_id()
        if not plan_id:
            QMessageBox.critical(self, "Virhe", "Ei aktiivista kaavaa.")
            self._enable_export_button()
            return

        self.lambda_service.post_plan_matter(plan_id)

    def update_message_list(self, post_json):
        """Handles the Lambda response and displays validation errors in ValidationTreeView."""
        self.progress_bar.hide()

        if not post_json:
            QMessageBox.critical(self, "Virhe", "Lambda palautti tyhjän vastauksen.")
            self._enable_export_button()
            return

        # Clear previous errors and hide tree view initially
        self.validation_result_tree_view.clear_errors()
        self.validation_result_tree_view.hide()

        errors_found = False
        warnings_found = False

        for error_data in post_json.values():
            if not isinstance(error_data, dict):
                continue

            # Process errors
            errors = error_data.get("errors") or []
            for error in errors:
                self.validation_result_tree_view.add_error(
                    error.get("ruleId", ""),
                    error.get("instance", ""),
                    error.get("message", ""),
                )
                errors_found = True

            # Process warnings
            warnings = error_data.get("warnings") or []
            for warning in warnings:
                self.validation_result_tree_view.add_warning(
                    warning.get("ruleId", ""),
                    warning.get("instance", ""),
                    warning.get("message", ""),
                )
                warnings_found = True

        # If there are errors or warnings, show the tree view
        if errors_found or warnings_found:
            self.validation_result_tree_view.show()

        if not errors_found:
            iface.messageBar().pushMessage("Kaava viety Rythiin onnistuneesti", level=Qgis.Success)

        self.validation_result_tree_view.expandAll()
        self.validation_result_tree_view.resizeColumnToContents(0)

        self._enable_export_button()

    def _enable_export_button(self):
        """Hides progress bar and re-enables export_button"""
        self.export_button.setEnabled(True)
