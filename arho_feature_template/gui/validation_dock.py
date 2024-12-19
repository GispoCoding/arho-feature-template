from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.gui import QgsDockWidget
from qgis.PyQt import uic
from qgis.PyQt.QtCore import QStringListModel
from qgis.utils import iface

from arho_feature_template.core.lambda_service import LambdaService
from arho_feature_template.utils.misc_utils import get_active_plan_id

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QListView, QProgressBar

ui_path = resources.files(__package__) / "validation_dock.ui"
DockClass, _ = uic.loadUiType(ui_path)


class ValidationDock(QgsDockWidget, DockClass):  # type: ignore
    error_list_view: QListView
    progress_bar: QProgressBar

    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.lambda_service = LambdaService()
        self.lambda_service.validation_received.connect(self.list_validation_errors)
        self.error_list_model = QStringListModel()
        self.error_list_view.setModel(self.error_list_model)
        self.validate_button.clicked.connect(self.validate)

    def validate(self):
        """Handles the button press to trigger the validation process."""
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
        # Clear the existing errors from the list view
        self.error_list_model.setStringList([])

        new_errors = []

        if not validation_json:
            # If no errors or warnings, display a message and exit
            iface.messageBar().pushMessage("Virhe", "Ei virheitä havaittu.", level=1)
            return

        for error_data in validation_json.values():
            if isinstance(error_data, dict):
                # Get the errors for this plan
                errors = error_data.get("errors", [])
                for error in errors:
                    rule_id = error.get("ruleId", "Tuntematon sääntö")
                    message = error.get("message", "Ei viestiä")
                    instance = error.get("instance", "Tuntematon instance")
                    error_message = f"Validointivirhe - Sääntö: {rule_id}, Viesti: {message}, Instance: {instance}"
                    new_errors.append(error_message)

                # Get any warnings for this plan using list comprehension
                warnings = error_data.get("warnings", [])
                new_errors.extend([f"Varoitus: {warning}" for warning in warnings])

        # If no errors or warnings, display a message
        if not new_errors:
            new_errors.append("Kaava on validi. Ei virheitä tai varoituksia havaittu.")
            return

        # Update the list view with the new errors and warnings
        self.error_list_model.setStringList(new_errors)
        # Hide progress bar and re-enable the button
        self.progress_bar.setVisible(False)
        self.validate_button.setEnabled(True)
