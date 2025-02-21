from __future__ import annotations

import json
import logging
from collections import defaultdict
from typing import TYPE_CHECKING

from qgis.core import QgsProject, QgsVectorLayer, QgsWkbTypes
from qgis.gui import QgsMapToolDigitizeFeature
from qgis.PyQt.QtWidgets import QDialog, QMessageBox

from arho_feature_template.core.lambda_service import LambdaService
from arho_feature_template.core.models import (
    AdditionalInformation,
    Document,
    FeatureTemplateLibrary,
    LifeCycle,
    Plan,
    PlanFeature,
    RegulationGroup,
    RegulationGroupCategory,
    RegulationGroupLibrary,
)
from arho_feature_template.exceptions import UnsavedChangesError
from arho_feature_template.gui.dialogs.lifecycle_editor import LifecycleEditor
from arho_feature_template.gui.dialogs.load_plan_dialog import LoadPlanDialog
from arho_feature_template.gui.dialogs.plan_attribute_form import PlanAttributeForm
from arho_feature_template.gui.dialogs.plan_feature_form import PlanFeatureForm
from arho_feature_template.gui.dialogs.plan_regulation_group_form import PlanRegulationGroupForm
from arho_feature_template.gui.dialogs.serialize_plan import SerializePlan
from arho_feature_template.gui.docks.new_feature_dock import NewFeatureDock
from arho_feature_template.gui.docks.regulation_groups_dock import RegulationGroupsDock
from arho_feature_template.gui.tools.inspect_plan_features_tool import InspectPlanFeatures
from arho_feature_template.project.layers.code_layers import PlanRegulationGroupTypeLayer, code_layers
from arho_feature_template.project.layers.plan_layers import (
    AdditionalInformationLayer,
    DocumentLayer,
    LandUseAreaLayer,
    LandUsePointLayer,
    LifeCycleLayer,
    LineLayer,
    OtherAreaLayer,
    OtherPointLayer,
    PlanFeatureLayer,
    PlanLayer,
    PlanPropositionLayer,
    PlanRegulationLayer,
    RegulationGroupAssociationLayer,
    RegulationGroupLayer,
    plan_layers,
)
from arho_feature_template.resources.libraries.feature_templates import feature_template_library_config_files
from arho_feature_template.resources.libraries.regulation_groups import regulation_group_library_config_files
from arho_feature_template.utils.db_utils import get_existing_database_connection_names
from arho_feature_template.utils.misc_utils import (
    LANGUAGE,
    check_layer_changes,
    disconnect_signal,
    get_active_plan_id,
    handle_unsaved_changes,
    iface,
    set_active_plan_id,
)

if TYPE_CHECKING:
    from qgis.core import QgsFeature

    from arho_feature_template.core.models import Proposition, Regulation

logger = logging.getLogger(__name__)

FEATURE_LAYER_NAME_TO_CLASS_MAP: dict[str, type[PlanFeatureLayer]] = {
    LandUsePointLayer.name: LandUsePointLayer,
    OtherPointLayer.name: OtherPointLayer,
    LineLayer.name: LineLayer,
    OtherAreaLayer.name: OtherAreaLayer,
    LandUseAreaLayer.name: LandUseAreaLayer,
}


class PlanDigitizeMapTool(QgsMapToolDigitizeFeature): ...


class PlanFeatureDigitizeMapTool(QgsMapToolDigitizeFeature):
    def __init__(self, mode: QgsMapToolDigitizeFeature.CaptureMode):
        super().__init__(iface.mapCanvas(), iface.cadDockWidget(), mode)


class PlanManager:
    def __init__(self):
        self.json_plan_path = None
        self.json_plan_outline_path = None

        self.feature_template_libraries = []
        self.regulation_group_libraries = []

        # Initialize new feature dock
        self.new_feature_dock = NewFeatureDock()
        self.new_feature_dock.tool_activated.connect(self.add_new_plan_feature)
        self.new_feature_dock.hide()

        # Initialize regulation groups dock
        self.regulation_groups_dock = RegulationGroupsDock()
        self.regulation_groups_dock.new_regulation_group_requested.connect(self.create_new_regulation_group)
        self.regulation_groups_dock.edit_regulation_group_requested.connect(self.edit_regulation_group)
        self.regulation_groups_dock.delete_regulation_group_requested.connect(self.delete_regulation_group)
        self.update_active_plan_regulation_group_library()
        self.regulation_groups_dock.hide()

        # Initialize digitize tools
        self.plan_digitize_map_tool = PlanDigitizeMapTool(iface.mapCanvas(), iface.cadDockWidget())
        self.plan_digitize_map_tool.digitizingCompleted.connect(self._plan_geom_digitized)

        self.feature_digitize_map_tool = None
        self.initialize_feature_digitize_map_tool()

        # Initialize plan feature inspect tool
        self.inspect_plan_feature_tool = InspectPlanFeatures(
            iface.mapCanvas(), list(FEATURE_LAYER_NAME_TO_CLASS_MAP.values())
        )
        self.inspect_plan_feature_tool.edit_feature_requested.connect(self.edit_plan_feature)

        # Initialize lambda service
        self.lambda_service = LambdaService()
        self.lambda_service.jsons_received.connect(self.save_plan_jsons)

    def initialize_from_project(self):
        # # If project is not open, don't try to initialize
        # # NOTE: QgsProject.instance(), QgsProject().fileInfo() and QgsProject().fileIName()
        # # don't seem to work as indicators whether a project is open?
        # if not QgsProject.instance() or not QgsProject().fileInfo():
        #     return
        self.initialize_libraries()

    def check_required_layers(self):
        missing_layers = []
        for layer in code_layers + plan_layers:
            if not layer.exists():
                missing_layers.append(layer.name)  # noqa: PERF401
        if len(missing_layers) > 0:  # noqa: SIM103
            # iface.messageBar().pushWarning("", f"Project is missing required layers: {', '.join(missing_layers)}")
            return False
        return True

    def initialize_libraries(self):
        if not self.check_required_layers():
            return

        self.regulation_group_libraries = [
            RegulationGroupLibrary.from_config_file(file) for file in regulation_group_library_config_files()
        ]
        self.feature_template_libraries = [
            FeatureTemplateLibrary.from_config_file(file, self.regulation_group_libraries)
            for file in feature_template_library_config_files()
        ]
        self.new_feature_dock.initialize_feature_template_libraries(self.feature_template_libraries)

    def update_active_plan_regulation_group_library(self):
        self.active_plan_regulation_group_library = regulation_group_library_from_active_plan()
        self.regulation_groups_dock.update_regulation_groups(self.active_plan_regulation_group_library)

    def create_new_regulation_group(self):
        self._open_regulation_group_form(RegulationGroup())

    def edit_regulation_group(self, regulation_group: RegulationGroup):
        self._open_regulation_group_form(regulation_group)

    def _open_regulation_group_form(self, regulation_group: RegulationGroup):
        regulation_group_form = PlanRegulationGroupForm(regulation_group, self.active_plan_regulation_group_library)
        if regulation_group_form.exec_():
            if regulation_group_form.save_as_config:
                save_regulation_group_as_config(regulation_group_form.model)
            else:
                save_regulation_group(regulation_group_form.model)
            self.update_active_plan_regulation_group_library()

    def delete_regulation_group(self, group: RegulationGroup):
        delete_regulation_group(group)
        self.update_active_plan_regulation_group_library()

    def toggle_identify_plan_features(self, activate: bool):  # noqa: FBT001
        if activate:
            self.previous_map_tool = iface.mapCanvas().mapTool()
            iface.mapCanvas().setMapTool(self.inspect_plan_feature_tool)
        else:
            iface.mapCanvas().setMapTool(self.previous_map_tool)

    def initialize_feature_digitize_map_tool(self, layer: QgsVectorLayer | None = None):
        # Get matcing capture mode for given layer
        if layer is None:
            mode = PlanFeatureDigitizeMapTool.CaptureMode.CaptureNone
        elif layer.geometryType() == QgsWkbTypes.PointGeometry:
            mode = PlanFeatureDigitizeMapTool.CaptureMode.CapturePoint
        elif layer.geometryType() == QgsWkbTypes.LineGeometry:
            mode = PlanFeatureDigitizeMapTool.CaptureMode.CaptureLine
        elif layer.geometryType() == QgsWkbTypes.PolygonGeometry:
            mode = PlanFeatureDigitizeMapTool.CaptureMode.CapturePolygon

        # Disconnect signals first to not trigger them unwantedly
        if self.feature_digitize_map_tool:
            disconnect_signal(self.feature_digitize_map_tool.digitizingCompleted)
            disconnect_signal(self.feature_digitize_map_tool.digitizingFinished)

        # Reinitialize and reconnect signals
        self.feature_digitize_map_tool = PlanFeatureDigitizeMapTool(mode)
        self.feature_digitize_map_tool.digitizingCompleted.connect(self._plan_feature_geom_digitized)
        self.feature_digitize_map_tool.digitizingFinished.connect(self.new_feature_dock.deactivate_and_clear_selections)

        # Set layer if given
        if layer:
            self.feature_digitize_map_tool.setLayer(layer)

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
        self.plan_digitize_map_tool.setLayer(plan_layer)
        iface.mapCanvas().setMapTool(self.plan_digitize_map_tool)

    def edit_plan(self):
        plan_layer = PlanLayer.get_from_project()
        if not plan_layer:
            return

        feature = PlanLayer.get_feature_by_id(get_active_plan_id(), no_geometries=False)
        if feature is None:
            return
        plan_model = PlanLayer.model_from_feature(feature)

        attribute_form = PlanAttributeForm(plan_model, self.regulation_group_libraries)
        if attribute_form.exec_():
            feature = save_plan(attribute_form.model)
            self.update_active_plan_regulation_group_library()

    def edit_lifecycles(self):
        plan_layer = PlanLayer.get_from_project()
        if not plan_layer:
            return

        feature = PlanLayer.get_feature_by_id(get_active_plan_id(), no_geometries=False)
        if feature is None:
            return
        plan_model = PlanLayer.model_from_feature(feature)

        lifecycle_editor = LifecycleEditor(plan=plan_model)

        if lifecycle_editor.exec_():
            save_plan(plan_model)

    def add_new_plan_feature(self):
        if not handle_unsaved_changes():
            return

        layer_name = self.new_feature_dock.active_feature_layer
        if layer_name is None:
            msg = "No plan feature type selected"
            iface.messageBar().pushWarning("", msg)
            return

        layer_class = FEATURE_LAYER_NAME_TO_CLASS_MAP.get(layer_name)
        if not layer_class:
            msg = f"Could not find plan feature layer class for layer name {layer_name}"
            raise ValueError(msg)
        layer = layer_class.get_from_project()
        layer.startEditing()

        self.initialize_feature_digitize_map_tool(layer)
        iface.mapCanvas().setMapTool(self.feature_digitize_map_tool)

    def _plan_geom_digitized(self, feature: QgsFeature):
        """Callback for when a new feature is added to the Kaava layer."""
        plan_layer = PlanLayer.get_from_project()
        if not plan_layer:
            return

        plan_model = Plan(geom=feature.geometry())
        attribute_form = PlanAttributeForm(plan_model, self.regulation_group_libraries)
        if attribute_form.exec_():
            feature = save_plan(attribute_form.model)
            plan_to_be_activated = feature["id"]
        else:
            plan_to_be_activated = self.previous_active_plan_id

        self.set_active_plan(plan_to_be_activated)

        if self.previously_editable:
            plan_layer.startEditing()

        iface.mapCanvas().setMapTool(self.previous_map_tool)

    def _plan_feature_geom_digitized(self, feature: QgsFeature):
        # NOTE: What if user has changed dock selections while digitizng?
        if self.new_feature_dock.active_template:
            plan_feature = self.new_feature_dock.active_template
            title = plan_feature.name
        else:
            plan_feature = PlanFeature(
                layer_name=self.new_feature_dock.active_feature_layer,
            )
            title = self.new_feature_dock.active_feature_type

        plan_feature.geom = feature.geometry()
        attribute_form = PlanFeatureForm(
            plan_feature, title, self.regulation_group_libraries, self.active_plan_regulation_group_library
        )
        if attribute_form.exec_():
            save_plan_feature(attribute_form.model)
            self.update_active_plan_regulation_group_library()

    def edit_plan_feature(self, feature: QgsFeature, layer_name: str):
        layer_class = FEATURE_LAYER_NAME_TO_CLASS_MAP[layer_name]
        plan_feature = layer_class.model_from_feature(feature)

        title = plan_feature.name if plan_feature.name else layer_name
        attribute_form = PlanFeatureForm(
            plan_feature, title, self.regulation_group_libraries, self.active_plan_regulation_group_library
        )
        if attribute_form.exec_():
            save_plan_feature(attribute_form.model)
            self.update_active_plan_regulation_group_library()

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

        set_active_plan_id(plan_id)
        for layer in plan_layers:
            layer.apply_filter(plan_id)

        if previously_in_edit_mode:
            plan_layer.startEditing()

        self.update_active_plan_regulation_group_library()

    def load_land_use_plan(self):
        """Load an existing land use plan using a dialog selection."""
        connection_names = get_existing_database_connection_names()

        if not connection_names:
            QMessageBox.critical(None, "Error", "No database connections found.")
            return

        if not handle_unsaved_changes():
            return

        dialog = LoadPlanDialog(None, connection_names)

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

    def unload(self):
        # Set pan map tool as active (to deactivate our custom tools to avoid errors)
        iface.actionPan().trigger()

        # Lambda service
        disconnect_signal(self.lambda_service.jsons_received)
        self.lambda_service.deleteLater()

        # Feature digitize tool
        if self.feature_digitize_map_tool:
            disconnect_signal(self.feature_digitize_map_tool.digitizingCompleted)
            disconnect_signal(self.feature_digitize_map_tool.digitizingFinished)
            self.feature_digitize_map_tool.deleteLater()

        # Plan digitize tool
        disconnect_signal(self.plan_digitize_map_tool.digitizingCompleted)
        self.plan_digitize_map_tool.deleteLater()

        # Inspect plan feature tool
        self.inspect_plan_feature_tool.unload()
        self.inspect_plan_feature_tool.deleteLater()

        # New feature dock
        disconnect_signal(self.new_feature_dock.tool_activated)
        iface.removeDockWidget(self.new_feature_dock)
        self.new_feature_dock.deleteLater()

        # Regulation group dock
        self.regulation_groups_dock.unload()
        iface.removeDockWidget(self.regulation_groups_dock)
        self.regulation_groups_dock.deleteLater()


def regulation_group_library_from_active_plan() -> RegulationGroupLibrary:
    if not get_active_plan_id():
        return RegulationGroupLibrary(
            name="Käytössä olevat kaavamääräysryhmät", version=None, description=None, regulation_group_categories=[]
        )

    id_of_general_regulation_group_type = PlanRegulationGroupTypeLayer.get_attribute_value_by_another_attribute_value(
        "id", "value", "generalRegulations"
    )
    category_id_to_name: dict[str, str] = {
        category["id"]: category["name"][LANGUAGE] for category in PlanRegulationGroupTypeLayer.get_features()
    }

    regulation_groups_by_category = defaultdict(list)
    for feat in RegulationGroupLayer.get_features():
        if feat["type_of_plan_regulation_group_id"] == id_of_general_regulation_group_type:
            # Exclude general regulations from the library
            continue
        category_name = category_id_to_name[feat["type_of_plan_regulation_group_id"]]
        regulation_groups_by_category[category_name].append(feat)

    return RegulationGroupLibrary(
        name="Käytössä olevat kaavamääräysryhmät",
        version=None,
        description=None,
        regulation_group_categories=[
            RegulationGroupCategory(
                category_code=None,
                name=category_name,
                regulation_groups=[RegulationGroupLayer.model_from_feature(feat) for feat in regulation_groups],
            )
            for category_name, regulation_groups in regulation_groups_by_category.items()
        ],
    )


def _save_feature(feature: QgsFeature, layer: QgsVectorLayer, id_: str | None, edit_text: str = ""):
    if not layer.isEditable():
        layer.startEditing()
    layer.beginEditCommand(edit_text)

    if id_ is None:
        layer.addFeature(feature)
    else:
        layer.updateFeature(feature)

    layer.endEditCommand()
    layer.commitChanges(stopEditing=False)


def _delete_feature(feature: QgsFeature, layer: QgsVectorLayer, delete_text: str = ""):
    if not layer.isEditable():
        layer.startEditing()
    layer.beginEditCommand(delete_text)

    layer.deleteFeature(feature.id())

    layer.endEditCommand()
    layer.commitChanges(stopEditing=False)


def save_plan(plan: Plan) -> QgsFeature:
    feature = PlanLayer.feature_from_model(plan)
    layer = PlanLayer.get_from_project()

    _save_feature(
        feature=feature,
        layer=layer,
        id_=plan.id_,
        edit_text="Kaavan muokkaus" if plan.id_ is not None else "Kaavan luominen",
    )

    plan_id = feature["id"]
    if plan.id_ is not None:
        # Check for deleted general regulations
        for association in RegulationGroupAssociationLayer.get_dangling_associations(
            plan.general_regulations, plan.id_, PlanLayer.name
        ):
            _delete_feature(
                association,
                RegulationGroupAssociationLayer.get_from_project(),
                "Kaavamääräysryhmän assosiaation poisto",
            )

        # Check for documents to be deleted
        doc_layer = DocumentLayer.get_from_project()
        for doc_feature in DocumentLayer.get_documents_to_delete(plan.documents, plan.id_):
            _delete_feature(doc_feature, doc_layer, "Asiakirjan poisto")

    # Save general regulations
    if plan.general_regulations:
        for regulation_group in plan.general_regulations:
            regulation_group_feature = save_regulation_group(regulation_group, plan_id)
            save_regulation_group_association(regulation_group_feature["id"], PlanLayer.name, plan_id)

    # Save documents
    for document in plan.documents:
        document.plan_id = plan_id
        save_document(document)

    # Save lifecycles
    for lifecycle in plan.lifecycles:
        lifecycle.plan_id = plan_id
        save_lifecycle(lifecycle)

    return feature


def save_plan_feature(plan_model: PlanFeature, plan_id: str | None = None) -> QgsFeature:
    layer_name = plan_model.layer_name
    if not layer_name:
        msg = "Cannot save plan feature without a target layer"
        raise ValueError(msg)
    layer_class = FEATURE_LAYER_NAME_TO_CLASS_MAP.get(layer_name)
    if not layer_class:
        msg = f"Could not find plan feature layer class for layer name {layer_name}"
        raise ValueError(msg)

    plan_feature = layer_class.feature_from_model(plan_model, plan_id)
    layer = layer_class.get_from_project()

    editing = plan_model.id_ is not None
    _save_feature(
        feature=plan_feature,
        layer=layer,
        id_=plan_model.id_,
        edit_text="Kaavakohteen muokkaus" if editing else "Kaavakohteen lisäys",
    )

    # Check for deleted regulation groups
    if editing:
        for association in RegulationGroupAssociationLayer.get_dangling_associations(
            plan_model.regulation_groups, plan_feature["id"], layer_name
        ):
            _delete_feature(
                association,
                RegulationGroupAssociationLayer.get_from_project(),
                "Kaavamääräysryhmän assosiaation poisto",
            )

    # Save regulation groups
    for group in plan_model.regulation_groups:
        regulation_group_feature = save_regulation_group(group)
        save_regulation_group_association(regulation_group_feature["id"], layer_name, plan_feature["id"])

    return plan_feature


def save_regulation_group(regulation_group: RegulationGroup, plan_id: str | None = None) -> QgsFeature:
    feature = RegulationGroupLayer.feature_from_model(regulation_group, plan_id)
    layer = RegulationGroupLayer.get_from_project()

    _save_feature(
        feature=feature,
        layer=layer,
        id_=regulation_group.id_,
        edit_text="Kaavamääräysryhmän muokkaus" if regulation_group.id_ is not None else "Kaavamääräysryhmän lisäys",
    )

    if regulation_group.id_ is not None:
        # Check for regulations to be deleted
        regulation_layer = PlanRegulationLayer.get_from_project()
        for reg_feature in PlanRegulationLayer.get_regulations_to_delete(
            regulation_group.regulations, regulation_group.id_
        ):
            _delete_feature(reg_feature, regulation_layer, "Kaavamääräyksen poisto")

        # Check for propositions to be deleted
        proposition_layer = PlanPropositionLayer.get_from_project()
        for prop_feature in PlanPropositionLayer.get_propositions_to_delete(
            regulation_group.propositions, regulation_group.id_
        ):
            _delete_feature(prop_feature, proposition_layer, "Kaavasuosituksen poisto")

    # Save regulations
    if regulation_group.regulations:
        for regulation in regulation_group.regulations:
            regulation.regulation_group_id = feature["id"]  # Updating regulation group ID
            save_regulation(regulation)

    # Save propositions
    if regulation_group.propositions:
        for proposition in regulation_group.propositions:
            proposition.regulation_group_id = feature["id"]  # Updating regulation group ID
            save_proposition(proposition)

    return feature


def delete_regulation_group(regulation_group: RegulationGroup, plan_id: str | None = None):
    if regulation_group.id_ is None:
        return

    feature = RegulationGroupLayer.feature_from_model(regulation_group, plan_id)
    layer = RegulationGroupLayer.get_from_project()

    # Delete regulations
    for regulation in regulation_group.regulations:
        delete_regulation(regulation)

    # Delete propositions
    for proposition in regulation_group.propositions:
        delete_proposition(proposition)

    _delete_feature(feature, layer, "Kaavamääräysryhmän poisto")

    # # Handle assocations
    # associations = RegulationGroupAssociationLayer.get_associations_for_regulation_group(str(regulation_group.id_))
    # association_layer = RegulationGroupAssociationLayer.get_from_project()
    # for association in associations:
    #     _delete_feature(association, association_layer, "Kaavamääräysryhmän assosiaation poisto")


def save_regulation_group_as_config(regulation_group: RegulationGroup):
    pass


def save_regulation_group_association(regulation_group_id: str, layer_name: str, feature_id: str):
    if RegulationGroupAssociationLayer.association_exists(regulation_group_id, layer_name, feature_id):
        return
    feature = RegulationGroupAssociationLayer.feature_from(regulation_group_id, layer_name, feature_id)
    layer = RegulationGroupAssociationLayer.get_from_project()

    _save_feature(feature=feature, layer=layer, id_=None, edit_text="Kaavamääräysryhmän assosiaation lisäys")


def save_regulation(regulation: Regulation) -> QgsFeature:
    regulation_feature = PlanRegulationLayer.feature_from_model(regulation)
    layer = PlanRegulationLayer.get_from_project()

    _save_feature(
        feature=regulation_feature,
        layer=layer,
        id_=regulation.id_,
        edit_text="Kaavamääräyksen lisäys" if regulation.id_ is None else "Kaavamääräyksen muokkaus",
    )

    for additional_information in regulation.additional_information:
        additional_information.plan_regulation_id = regulation_feature["id"]
        save_additional_information(additional_information)

    return regulation_feature


def save_additional_information(additional_information: AdditionalInformation) -> QgsFeature:
    feature = AdditionalInformationLayer.feature_from_model(additional_information)
    layer = AdditionalInformationLayer.get_from_project()

    _save_feature(
        feature=feature,
        layer=layer,
        id_=additional_information.id_,
        edit_text="Lisätiedon lisäys" if additional_information.id_ is None else "Lisätiedon muokkaus",
    )
    return feature


def delete_additional_information(additional_information: AdditionalInformation):
    feature = AdditionalInformationLayer.feature_from_model(additional_information)
    layer = AdditionalInformationLayer.get_from_project()

    _delete_feature(feature, layer, "Lisätiedon poisto")


def delete_regulation(regulation: Regulation):
    feature = PlanRegulationLayer.feature_from_model(regulation)
    layer = PlanRegulationLayer.get_from_project()

    for ai in regulation.additional_information:
        delete_additional_information(ai)

    _delete_feature(feature, layer, "Kaavamääräyksen poisto")


def save_proposition(proposition: Proposition) -> QgsFeature:
    feature = PlanPropositionLayer.feature_from_model(proposition)
    layer = PlanPropositionLayer.get_from_project()

    _save_feature(
        feature=feature,
        layer=layer,
        id_=proposition.id_,
        edit_text="Kaavasuosituksen lisäys" if proposition.id_ is None else "Kaavasuosituksen muokkaus",
    )

    return feature


def delete_proposition(proposition: Proposition):
    feature = PlanPropositionLayer.feature_from_model(proposition)
    layer = PlanPropositionLayer.get_from_project()

    _delete_feature(feature, layer, "Kaavasuosituksen poisto")


def save_document(document: Document) -> QgsFeature:
    feature = DocumentLayer.feature_from_model(document)
    layer = DocumentLayer.get_from_project()

    _save_feature(
        feature=feature,
        layer=layer,
        id_=document.id_,
        edit_text="Asiakirjan lisäys" if document.id_ is None else "Asiakirjan muokkaus",
    )

    return feature


def save_lifecycle(lifecycle: LifeCycle) -> QgsFeature:
    """Save a LifeCycle object to the layer."""
    feature = LifeCycleLayer.feature_from_model(lifecycle)
    layer = LifeCycleLayer.get_from_project()

    _save_feature(
        feature=feature,
        layer=layer,
        id_=lifecycle.id_,
        edit_text="Elinkaaren lisäys" if lifecycle.id_ is None else "Elinkaaren muokkaus",
    )
    return feature
