from __future__ import annotations

import json
import logging
from string import Template
from textwrap import dedent

from qgis.core import QgsExpressionContextUtils, QgsProject, QgsVectorLayer
from qgis.PyQt.QtWidgets import QDialog, QMessageBox
from qgis.utils import iface

from arho_feature_template.plan.load_plan_dialog import LoadPlanDialog
from arho_feature_template.plan.serialize_plan import SerializePlan
from arho_feature_template.utils.db_utils import get_existing_database_connection_names
from arho_feature_template.utils.lambda_service import LambdaService
from arho_feature_template.utils.misc_utils import get_active_plan_id, get_layer_by_name, handle_unsaved_changes

logger = logging.getLogger(__name__)

LAYER_NAME_PLAN = "Kaava"
LAYER_NAME_LAND_USE_POINT = "Maankäytön kohteet"
LAYER_NAME_OTHER_POINT = "Muut pisteet"
LAYER_NAME_LINE = "Viivat"
LAYER_NAME_OTHER_AREA = "Osa-alue"
LAYER_NAME_LAND_USE_AREA = "Aluevaraus"
LAYER_NAME_PLAN_REGULATION_GROUP = "Kaavamääräysryhmät"
LAYER_NAME_PLAN_REGULATION = "Kaavamääräys"
LAYER_NAME_PLAN_PROPOSITION = "Kaavasuositus"
LAYER_NAME_DOCUMENT = "Asiakirjat"
LAYER_NAME_SOURCE_DATA = "Lähtötietoaineistot"
LAYER_NAME_REGULATION_GROUP_ASSOCIATION = "Kaavamääräysryhmien assosiaatiot"

PLAN_FILTER_TEMPLATES = {
    LAYER_NAME_PLAN: Template("id = '$plan_id'"),
    LAYER_NAME_LAND_USE_POINT: Template("plan_id = '$plan_id'"),
    LAYER_NAME_OTHER_POINT: Template("plan_id = '$plan_id'"),
    LAYER_NAME_LINE: Template("plan_id = '$plan_id'"),
    LAYER_NAME_LAND_USE_AREA: Template("plan_id = '$plan_id'"),
    LAYER_NAME_OTHER_AREA: Template("plan_id = '$plan_id'"),
    LAYER_NAME_PLAN_REGULATION_GROUP: Template("plan_id = '$plan_id'"),
    LAYER_NAME_REGULATION_GROUP_ASSOCIATION: Template(
        dedent(
            """\
            EXISTS (
                SELECT 1
                FROM hame.plan_regulation_group prg
                WHERE
                    hame.regulation_group_association.plan_regulation_group_id = prg.id
                    AND prg.plan_id = '$plan_id'
            )"""
        )
    ),
    LAYER_NAME_PLAN_REGULATION: Template(
        dedent(
            """\
            EXISTS (
                SELECT 1
                FROM hame.plan_regulation_group prg
                WHERE
                    hame.plan_regulation.plan_regulation_group_id = prg.id
                    AND prg.plan_id = '$plan_id'
            )"""
        )
    ),
    LAYER_NAME_PLAN_PROPOSITION: Template(
        dedent(
            """\
            EXISTS (
                SELECT 1
                FROM hame.plan_regulation_group rg
                WHERE
                    hame.plan_proposition.plan_regulation_group_id = rg.id
                    AND rg.plan_id = '$plan_id'
            )"""
        )
    ),
    LAYER_NAME_DOCUMENT: Template("plan_id = '$plan_id'"),
    LAYER_NAME_SOURCE_DATA: Template("plan_id = '$plan_id'"),
}


class PlanManager:
    def __init__(self):
        self.json_plan_path = None
        self.json_plan_outline_path = None

    def add_new_plan(self):
        """Initiate the process to add a new plan to the Kaava layer."""
        if not handle_unsaved_changes():
            return

        plan_layer = get_layer_by_name(LAYER_NAME_PLAN)

        if not plan_layer:
            return
        self.set_active_plan(None)

        if not plan_layer.isEditable():
            plan_layer.startEditing()

        iface.setActiveLayer(plan_layer)
        iface.actionAddFeature().trigger()

        # Connect the featureAdded signal to a callback method
        plan_layer.featureAdded.connect(self._feature_added)

    def _feature_added(self):
        """Callback for when a new feature is added to the Kaava layer."""
        plan_layer = get_layer_by_name(LAYER_NAME_PLAN)
        if not plan_layer:
            return

        # Disconnect the signal to avoid repeated triggers
        plan_layer.featureAdded.disconnect(self._feature_added)

        feature_ids_before_commit = plan_layer.allFeatureIds()

        if plan_layer.isEditable():
            if not plan_layer.commitChanges():
                iface.messageBar().pushMessage("Error", "Failed to commit changes to the layer.", level=3)
                return
        else:
            iface.messageBar().pushMessage("Error", "Layer is not editable.", level=3)
            return

        feature_ids_after_commit = plan_layer.allFeatureIds()
        new_feature_id = next(
            (fid for fid in feature_ids_after_commit if fid not in feature_ids_before_commit),
            None,
        )

        if new_feature_id is not None:
            new_feature = plan_layer.getFeature(new_feature_id)
            if new_feature.isValid():
                feature_id_value = new_feature["id"]
                self.set_active_plan(feature_id_value)
            else:
                iface.messageBar().pushMessage("Error", "Invalid feature retrieved.", level=3)
        else:
            iface.messageBar().pushMessage("Error", "No new feature was added.", level=3)

    def set_active_plan(self, plan_id: str | None):
        """Update the project layers based on the selected land use plan."""
        QgsExpressionContextUtils.setProjectVariable(QgsProject.instance(), "active_plan_id", plan_id)

        for layer_name, filter_template in PLAN_FILTER_TEMPLATES.items():
            """Set a filter for the given vector layer."""
            filter_expression = filter_template.substitute(plan_id=plan_id) if plan_id else None
            layer = get_layer_by_name(layer_name)
            if not layer:
                logger.warning("Layer %s not found", layer_name)
                continue
            result = layer.setSubsetString(filter_expression)
            if result is False:
                iface.messageBar().pushMessage(
                    "Error",
                    f"Failed to filter layer {layer_name} with query {filter_expression}",
                    level=3,
                )

    def load_land_use_plan(self):
        """Load an existing land use plan using a dialog selection."""
        connections = get_existing_database_connection_names()

        if not connections:
            QMessageBox.critical(None, "Error", "No database connections found.")
            return

        if not handle_unsaved_changes():
            return

        dialog = LoadPlanDialog(None, connections)

        if dialog.exec_() == QDialog.Accepted:
            selected_plan_id = dialog.get_selected_plan_id()
            self.commit_all_editable_layers()

            if not selected_plan_id:
                QMessageBox.critical(None, "Error", "No plan was selected.")
                return

            self.set_active_plan(selected_plan_id)

    def commit_all_editable_layers(self):
        """Commit all changes in any editable layers."""
        for layer in QgsProject.instance().mapLayers().values():
            if isinstance(layer, QgsVectorLayer) and layer.isEditable():
                layer.commitChanges()

    def get_plan_json(self):
        """Serializes plan and plan outline to JSON"""
        dialog = SerializePlan()
        if dialog.exec_() == QDialog.Accepted:
            self.json_plan_path = dialog.plan_path_edit.text()
            self.json_plan_outline_path = dialog.plan_outline_path_edit.text()

            plan_id = get_active_plan_id()
            if not plan_id:
                QMessageBox.critical(None, "Virhe", "Ei aktiivista kaavaa.")
                return

            self.lambda_service = LambdaService()
            self.lambda_service.jsons_received.connect(self.save_plan_jsons)
            self.lambda_service.send_request("get_plans", plan_id)

    def save_plan_jsons(self, plan_json, outline_json):
        """This slot saves the plan and outline JSONs to files."""
        if plan_json is None or outline_json is None:
            QMessageBox.critical(None, "Virhe", "Kaava tai sen ulkoraja ei löytynyt.")
            return

        # Retrieve paths
        if self.json_plan_path is None or self.json_plan_outline_path is None:
            QMessageBox.critical(None, "Virhe", "Tiedostopolut eivät ole saatavilla.")
            return

        # Save the JSONs
        with open(self.json_plan_path, "w", encoding="utf-8") as full_file:
            json.dump(plan_json, full_file, ensure_ascii=False, indent=2)

        with open(self.json_plan_outline_path, "w", encoding="utf-8") as outline_file:
            json.dump(outline_json, outline_file, ensure_ascii=False, indent=2)

        QMessageBox.information(None, "Tallennus onnistui", "Kaava ja sen ulkoraja tallennettu onnistuneesti.")
