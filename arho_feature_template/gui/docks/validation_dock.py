from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.gui import QgsDockWidget
from qgis.PyQt import uic
from qgis.utils import iface

from arho_feature_template.core.lambda_service import LambdaService
from arho_feature_template.utils.misc_utils import get_active_plan_id

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QProgressBar, QPushButton

    from arho_feature_template.gui.docks.validation_tree_view import ValidationTreeView

ui_path = resources.files(__package__) / "validation_dock.ui"
DockClass, _ = uic.loadUiType(ui_path)


class ValidationDock(QgsDockWidget, DockClass):  # type: ignore
    progress_bar: QProgressBar
    validation_result_tree_view: ValidationTreeView
    validate_button: QPushButton

    def __init__(self, parent=None):
        super().__init__(parent)
        self.setupUi(self)

        self.lambda_service = LambdaService()
        self.lambda_service.validation_received.connect(self.list_validation_errors)
        self.validate_button.clicked.connect(self.validate)

    def validate(self):
        """Handles the button press to trigger the validation process."""

        # Clear the existing errors from the list view
        self.validation_result_tree_view.clear_errors()

        active_plan_id = get_active_plan_id()
        if not active_plan_id:
            iface.messageBar().pushMessage("Virhe", "Ei aktiivista kaavaa.", level=3)
            return

        # Disable button and show progress bar
        self.validate_button.setEnabled(False)
        self.progress_bar.setVisible(True)

        self.lambda_service.validate_plan(active_plan_id)

    def list_validation_errors(self, validation_json):
        """Slot for listing validation errors and warnings."""
        if not validation_json:
            iface.messageBar().pushMessage("Virhe", "Validaatio json puuttuu.", level=1)
            return

        if not validation_json:
            # If no errors or warnings, display a message and exit
            iface.messageBar().pushMessage("Virhe", "Ei virheitä havaittu.", level=1)
            return

        for error_data in validation_json.values():
            if not isinstance(error_data, dict):
                continue

            errors = error_data.get("errors") or []
            for error in errors:
                self.validation_result_tree_view.add_error(
                    error.get("ruleId", ""),
                    error.get("instance", ""),
                    error.get("message", ""),
                )

            warnings = error_data.get("warnings") or []
            for warning in warnings:
                self.validation_result_tree_view.add_warning(
                    warning.get("ruleId", ""),
                    warning.get("instance", ""),
                    warning.get("message", ""),
                )

        # Hide progress bar and re-enable the button
        self.progress_bar.setVisible(False)
        self.validate_button.setEnabled(True)
        self.validation_result_tree_view.expandAll()
        self.validation_result_tree_view.resizeColumnToContents(0)
