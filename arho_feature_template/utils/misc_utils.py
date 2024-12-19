from __future__ import annotations

import os
from typing import TYPE_CHECKING, cast

from qgis.core import QgsExpressionContextUtils, QgsProject, QgsVectorLayer
from qgis.PyQt.QtCore import QSettings
from qgis.PyQt.QtWidgets import QMessageBox
from qgis.utils import iface

if TYPE_CHECKING:
    from typing import Literal

    from qgis.core import QgsMapLayer
    from qgis.gui import QgisInterface

    iface: QgisInterface = cast("QgisInterface", iface)  # type: ignore[no-redef]

PLUGIN_PATH = os.path.dirname(os.path.dirname(__file__))


# NOTE: Consider creating "layer_utils.py" or similar for layer related utils in the future
def get_layer_by_name(layer_name: str) -> QgsMapLayer | None:
    """
    Retrieve a layer by name from the project.

    If multiple layers with the same name exist, returns the first one. Returns None
    if layer with a matching name is not found.
    """
    layers = QgsProject.instance().mapLayersByName(layer_name)
    if layers:
        return layers[0]
    iface.messageBar().pushWarning("Error", f"Layer '{layer_name}' not found")
    return None


def get_additional_information_name(info_type: str, language: Literal["fin", "eng", "swe"] = "fin") -> str:
    """
    Retrieve name of input additional information type from associated QGIS layer.

    Returns input `info_type` if name is not found.
    """
    type_of_additional_information_layer_name = "Lisätiedonlaji"
    layer = get_layer_by_name(type_of_additional_information_layer_name)
    if layer:
        for feature in layer.getFeatures():
            if feature["value"] == info_type:
                return feature["name"][language]
    return info_type


def check_layer_changes() -> bool:
    """Check if there are unsaved changes in any QGIS layers."""
    project = QgsProject.instance()
    layers = project.mapLayers().values()

    return any(layer.isModified() for layer in layers if isinstance(layer, QgsVectorLayer))


def prompt_commit_changes() -> bool:
    """Ask user if changes should be committed."""
    response = QMessageBox.question(
        None,
        "Tallentamattomat muutokset",
        "Tasoilla on tallentamattomia muutoksia. Tallenetaanko muutokset?",
        QMessageBox.Yes | QMessageBox.No,
    )
    return response == QMessageBox.Yes


def commit_all_layer_changes() -> bool:
    """
    Commit changes to all modified layers in the QGIS project.
    Returns True if all changes were successfully committed, False if any failed.
    """
    project = QgsProject.instance()
    layers = project.mapLayers().values()
    all_committed = True

    for layer in layers:
        if isinstance(layer, QgsVectorLayer) and layer.isModified() and not layer.commitChanges():
            QMessageBox.critical(None, "Virhe", f"Tason {layer.name()} muutosten tallentaminen epäonnistui.")
            all_committed = False

    return all_committed


def handle_unsaved_changes() -> bool:
    """
    Wrapper function to check for unsaved changes, prompt user to commit, and commit changes if chosen.
    Returns:
        bool: True if changes are committed or no changes were found;
            False if user does not want to commit or if commit fails.
    """
    if check_layer_changes():
        if not prompt_commit_changes():
            return False
        if not commit_all_layer_changes():
            return False
    return True


def get_active_plan_id():
    """Retrieve the active plan ID stored as a project variable."""
    return QgsExpressionContextUtils.projectScope(QgsProject.instance()).variable("active_plan_id")


def get_settings():
    """Retrieve stored settings, using defaults if not set."""
    settings = QSettings("ArhoFeatureTemplate")
    proxy_host = settings.value("proxy_host", "localhost")
    proxy_port = settings.value("proxy_port", "5443")
    lambda_url = settings.value("lambda_url", "https://t5w26iqnsf.execute-api.eu-central-1.amazonaws.com/v0/ryhti")
    return proxy_host, proxy_port, lambda_url


def get_plan_name(plan_id: str, language: Literal["fin", "eng", "swe"] = "fin") -> str:
    """Retrieve the name of a plan from the 'Kaava' layer based on its ID."""
    layer = get_layer_by_name("Kaava")
    if layer:
        for feature in layer.getFeatures():
            if feature["id"] == plan_id:
                name_field = feature["name"]
                name = name_field.get(language, "")
                # Return "Nimetön" if the name is an empty string
                return name if name.strip() else "Nimetön"
    return "Nimetön"


def form_validation_messages(ryhti_json: dict) -> list[str]:
    # Prepare errors and warnings for display
    new_errors = []
    for error_data in ryhti_json.values():
        if isinstance(error_data, dict):
            # Get the errors
            errors = error_data.get("errors", [])
            for error in errors:
                rule_id = error.get("ruleId", "Tuntematon sääntö")
                message = error.get("message", "Ei viestiä")
                instance = error.get("instance", "Tuntematon instance")
                error_message = f"Validointivirhe - Sääntö: {rule_id}, Viesti: {message}, Instance: {instance}"
                new_errors.append(error_message)

            # Get warnings
            warnings = error_data.get("warnings", [])
            new_errors.extend([f"Varoitus: {warning}" for warning in warnings])
    # If no errors or warnings, display a success message
    if not new_errors:
        new_errors.append("Kaava on validi. Ei virheitä tai varoituksia havaittu.")

    return new_errors
