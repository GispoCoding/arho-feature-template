from __future__ import annotations

import json
import logging
from typing import TYPE_CHECKING

from qgis.core import (
    QgsExpressionContextUtils,
    QgsProject,
    QgsVectorLayer,
)
from qgis.gui import QgsMapToolDigitizeFeature
from qgis.PyQt.QtWidgets import QDialog, QMessageBox
from qgis.utils import iface

from arho_feature_template.core.lambda_service import LambdaService
from arho_feature_template.core.models import RegulationGroupCategory, RegulationGroupLibrary
from arho_feature_template.exceptions import UnsavedChangesError
from arho_feature_template.gui.load_plan_dialog import LoadPlanDialog
from arho_feature_template.gui.new_plan_regulation_group_form import NewPlanRegulationGroupForm
from arho_feature_template.gui.plan_attribure_form import PlanAttributeForm
from arho_feature_template.gui.serialize_plan import SerializePlan
from arho_feature_template.project.layers.code_layers import PlanRegulationGroupTypeLayer
from arho_feature_template.project.layers.plan_layers import (
    LandUseAreaLayer,
    LandUsePointLayer,
    LineLayer,
    OtherAreaLayer,
    OtherPointLayer,
    PlanFeatureLayer,
    PlanLayer,
    PlanRegulationLayer,
    RegulationGroupAssociationLayer,
    RegulationGroupLayer,
    plan_layers,
)
from arho_feature_template.utils.db_utils import get_existing_database_connection_names
from arho_feature_template.utils.misc_utils import (
    check_layer_changes,
    get_active_plan_id,
    handle_unsaved_changes,
)

if TYPE_CHECKING:
    from qgis.core import QgsFeature

    from arho_feature_template.core.models import Plan, PlanFeature, Regulation, RegulationGroup

logger = logging.getLogger(__name__)


class PlanDigitizeMapTool(QgsMapToolDigitizeFeature): ...


class PlanManager:
    def __init__(self):
        self.json_plan_path = None
        self.json_plan_outline_path = None

        self.digitize_map_tool = PlanDigitizeMapTool(iface.mapCanvas(), iface.cadDockWidget())
        self.digitize_map_tool.digitizingCompleted.connect(self._plan_geom_digitized)

    def add_new_plan(self):
        """Initiate the process to add a new plan to the Kaava layer."""

        self.previous_map_tool = iface.mapCanvas().mapTool()
        self.previous_active_plan_id = get_active_plan_id()

        if not handle_unsaved_changes():
            return

        plan_layer = PlanLayer.get_from_project()
        if not plan_layer:
            return
        self.previously_editable = plan_layer.isEditable()

        self.set_active_plan(None)

        plan_layer.startEditing()
        self.digitize_map_tool.setLayer(plan_layer)
        iface.mapCanvas().setMapTool(self.digitize_map_tool)

    def _plan_geom_digitized(self, feature: QgsFeature):
        """Callback for when a new feature is added to the Kaava layer."""
        plan_layer = PlanLayer.get_from_project()
        if not plan_layer:
            return

        attribute_form = PlanAttributeForm()
        if attribute_form.exec_():
            plan_attributes = attribute_form.get_plan_attributes()
            plan_attributes.geom = feature.geometry()
            feature = save_plan(plan_attributes)
            plan_to_be_activated = feature["id"]
        else:
            plan_to_be_activated = self.previous_active_plan_id

        self.set_active_plan(plan_to_be_activated)

        if self.previously_editable:
            plan_layer.startEditing()

        iface.mapCanvas().setMapTool(self.previous_map_tool)

    def set_active_plan(self, plan_id: str | None):
        """Update the project layers based on the selected land use plan.

        Layers to be filtered cannot be in edit mode.
        This method disables edit mode temporarily if needed.
        Therefore if there are unsaved changes, this method will raise an exception.
        """

        if check_layer_changes():
            raise UnsavedChangesError

        plan_layer = PlanLayer.get_from_project()
        previously_in_edit_mode = plan_layer.isEditable()
        if previously_in_edit_mode:
            plan_layer.rollBack()

        QgsExpressionContextUtils.setProjectVariable(QgsProject.instance(), "active_plan_id", plan_id)
        for layer in plan_layers:
            layer.apply_filter(plan_id)

        if previously_in_edit_mode:
            plan_layer.startEditing()

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
            self.json_plan_path = str(dialog.plan_file.filePath())
            self.json_plan_outline_path = str(dialog.plan_outline_file.filePath())

            plan_id = get_active_plan_id()
            if not plan_id:
                QMessageBox.critical(None, "Virhe", "Ei aktiivista kaavaa.")
                return

            self.lambda_service = LambdaService()
            self.lambda_service.jsons_received.connect(self.save_plan_jsons)
            self.lambda_service.serialize_plan(plan_id)

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

        QMessageBox.information(
            None,
            "Tallennus onnistui",
            "Kaava ja sen ulkoraja tallennettu onnistuneesti.",
        )

    def create_new_regulation_group(self):
        new_regulation_group_form = NewPlanRegulationGroupForm()
        if new_regulation_group_form.exec_():
            if new_regulation_group_form.save_as_config is True:
                save_regulation_group_as_config(new_regulation_group_form.model)
            else:
                save_regulation_group(new_regulation_group_form.model)


def regulation_group_library_from_active_plan() -> RegulationGroupLibrary:
    category_features = list(PlanRegulationGroupTypeLayer.get_features())
    category_id_to_name: dict[str, str] = {category["id"]: category["name"]["fin"] for category in category_features}
    category_regulation_group_map: dict[str, list[QgsFeature]] = {
        feature["name"]["fin"]: [] for feature in category_features
    }

    for feat in RegulationGroupLayer.get_features():
        name = category_id_to_name[feat["type_of_plan_regulation_group_id"]]
        category_regulation_group_map[name].append(feat)
    return RegulationGroupLibrary(
        name="Käytössä olevat kaavamääräysryhmät",
        version=None,
        description=None,
        regulation_group_categories=[
            RegulationGroupCategory(
                category_code=None,
                name=category_name,
                regulation_groups=[
                    RegulationGroupLayer.model_from_feature(feat) for feat in category_regulation_groups
                ],
            )
            for category_name, category_regulation_groups in category_regulation_group_map.items()
        ],
    )


def _save_feature(feature: QgsFeature, layer: QgsVectorLayer, id_: int | None, edit_text: str = ""):
    if not layer.isEditable():
        layer.startEditing()
    layer.beginEditCommand(edit_text)

    if id_ is None:
        layer.addFeature(feature)
    else:
        layer.updateFeature(feature)

    layer.endEditCommand()
    layer.commitChanges(stopEditing=False)


def save_plan(plan_data: Plan) -> QgsFeature:
    plan_layer = PlanLayer.get_from_project()
    in_edit_mode = plan_layer.isEditable()
    if not in_edit_mode:
        plan_layer.startEditing()

    edit_message = "Kaavan lisäys" if plan_data.id_ is None else "Kaavan muokkaus"
    plan_layer.beginEditCommand(edit_message)

    # plan_data.organisation_id = "99e20d66-9730-4110-815f-5947d3f8abd3"
    plan_feature = PlanLayer.feature_from_model(plan_data)

    if plan_data.id_ is None:
        plan_layer.addFeature(plan_feature)
    else:
        plan_layer.updateFeature(plan_feature)

    plan_layer.endEditCommand()
    plan_layer.commitChanges(stopEditing=False)

    if plan_data.general_regulations:
        for regulation_group in plan_data.general_regulations:
            plan_id = plan_feature["id"]
            regulation_group_feature = save_regulation_group(regulation_group, plan_id)
            save_regulation_group_association(regulation_group_feature["id"], PlanLayer.name, plan_id)

    return plan_feature


def save_plan_feature(plan_feature: PlanFeature, plan_id: str | None = None) -> QgsFeature:
    layer_name_to_class_map: dict[str, type[PlanFeatureLayer]] = {
        LandUsePointLayer.name: LandUsePointLayer,
        OtherAreaLayer.name: OtherAreaLayer,
        OtherPointLayer.name: OtherPointLayer,
        LandUseAreaLayer.name: LandUseAreaLayer,
        LineLayer.name: LineLayer,
    }

    if not plan_feature.layer_name:
        msg = "Cannot save plan feature without a target layer"
        raise ValueError(msg)
    layer_class = layer_name_to_class_map.get(plan_feature.layer_name)
    if not layer_class:
        msg = f"Could not find plan feature layer class for layer name {plan_feature.layer_name}"
        raise ValueError(msg)

    feature = layer_class.feature_from_model(plan_feature, plan_id)
    layer = layer_class.get_from_project()

    _save_feature(
        feature=feature,
        layer=layer,
        id_=plan_feature.id_,
        edit_text="Kaavakohteen lisäys" if plan_feature.id_ is None else "Kaavakohteen muokkaus",
    )

    # Handle regulation groups
    if plan_feature.regulation_groups:
        for group in plan_feature.regulation_groups:
            regulation_group_feature = save_regulation_group(group)
            save_regulation_group_association(regulation_group_feature["id"], plan_feature.layer_name, feature["id"])

    return feature


def save_regulation_group(regulation_group: RegulationGroup, plan_id: str | None = None) -> QgsFeature:
    feature = RegulationGroupLayer.feature_from_model(regulation_group, plan_id)
    layer = RegulationGroupLayer.get_from_project()

    _save_feature(
        feature=feature,
        layer=layer,
        id_=regulation_group.id_,
        edit_text="Kaavamääräysryhmän lisäys" if regulation_group.id_ is None else "Kaavamääräysryhmän muokkaus",
    )

    # Handle regulations
    if regulation_group.regulations:
        for regulation in regulation_group.regulations:
            regulation.regulation_group_id_ = feature["id"]  # Updating regulation group ID
            save_regulation(regulation)

    return feature


def save_regulation_group_as_config(regulation_group: RegulationGroup):
    pass


def save_regulation_group_association(regulation_group_id: str, layer_name: str, feature_id: str) -> QgsFeature:
    feature = RegulationGroupAssociationLayer.feature_from(regulation_group_id, layer_name, feature_id)
    layer = RegulationGroupAssociationLayer.get_from_project()

    _save_feature(feature=feature, layer=layer, id_=None, edit_text="Kaavamääräysryhmän assosiaation lisäys")

    return feature


def save_regulation(regulation: Regulation) -> QgsFeature:
    feature = PlanRegulationLayer.feature_from_model(regulation)
    layer = PlanRegulationLayer.get_from_project()

    _save_feature(
        feature=feature,
        layer=layer,
        id_=regulation.id_,
        edit_text="Kaavamääräyksen lisäys" if regulation.id_ is None else "Kaavamääräyksen muokkaus",
    )

    return feature
