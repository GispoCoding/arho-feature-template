from __future__ import annotations

import logging
from collections import defaultdict
from typing import TYPE_CHECKING

from qgis.gui import QgsMapToolDigitizeFeature
from qgis.PyQt.QtCore import QItemSelectionModel
from qgis.PyQt.QtGui import QStandardItem, QStandardItemModel
from qgis.utils import iface

from arho_feature_template.exceptions import LayerNotFoundError, LayerNotVectorTypeError
from arho_feature_template.plan_feature.plan_feature_form import PlanFeatureForm
from arho_feature_template.plan_feature.template_dock import TemplateLibraryDock
from arho_feature_template.plan_feature.template_library_config import (
    FeatureTemplate,
    TemplateLibraryConfig,
    TemplateLibraryVersionError,
    TemplateSyntaxError,
    parse_template_library_config,
)
from arho_feature_template.resources.template_libraries import library_config_files
from arho_feature_template.utils.project_utils import get_layer_from_project

if TYPE_CHECKING:
    from qgis.core import QgsFeature, QgsVectorLayer

logger = logging.getLogger(__name__)


class TemplateItem(QStandardItem):
    def __init__(self, template_config: FeatureTemplate) -> None:
        self.config = template_config
        super().__init__(template_config.name)

    def is_valid(self) -> bool:
        """Check if the template is valid agains current QGIS project

        Checks if the layer and attributes defined in the template acutally exists"""
        try:
            get_layer_from_project(self.config.feature.layer)  # TODO: check child features recursively
        except (LayerNotFoundError, LayerNotVectorTypeError):
            return False
        else:
            return True


class TemplateGeometryDigitizeMapTool(QgsMapToolDigitizeFeature): ...


class FeatureTemplater:
    def __init__(self) -> None:
        self.library_configs: dict[str, TemplateLibraryConfig] = {}

        self.template_dock = TemplateLibraryDock()
        self.template_dock.hide()

        self.template_model = QStandardItemModel()
        self.template_dock.template_list.setModel(self.template_model)

        # Set the selection mode to allow single selection
        self.template_dock.template_list.setSelectionMode(self.template_dock.template_list.SingleSelection)

        self._read_library_configs()

        self.template_dock.library_selection.addItems(self.get_library_names())

        # Update template tree when library selection changes
        self.template_dock.library_selection.currentIndexChanged.connect(
            lambda: self.set_active_library(self.template_dock.library_selection.currentText())
        )

        # Update template tree when search text changes
        self.template_dock.search_box.valueChanged.connect(self.on_template_search_text_changed)

        # Activate map tool when template is selected
        self.template_dock.template_list.clicked.connect(self.on_template_item_clicked)

        self.digitize_map_tool = TemplateGeometryDigitizeMapTool(iface.mapCanvas(), iface.cadDockWidget())
        self.digitize_map_tool.digitizingCompleted.connect(self.ask_for_feature_attributes)
        self.digitize_map_tool.deactivated.connect(self.template_dock.template_list.clearSelection)

    def on_template_item_clicked(self, index):
        item = self.template_model.itemFromIndex(index)

        # Do nothing if clicked item is a group
        if item.hasChildren():
            return

        try:
            layer = get_layer_from_project(item.config.feature.layer)
        except (LayerNotFoundError, LayerNotVectorTypeError):
            logger.exception("Failed to activate template")
            return

        self.active_template = item
        self.start_digitizing_for_layer(layer)

        # Reselect as a workaround for first selection visual clarity
        self.template_dock.template_list.selectionModel().select(
            index, QItemSelectionModel.Select | QItemSelectionModel.Rows
        )

    def on_template_search_text_changed(self, search_text: str) -> None:
        search_text = search_text.lower()

        for row in range(self.template_model.rowCount()):
            group_item = self.template_model.item(row)
            group_visible = False

            for child_row in range(group_item.rowCount()):
                child_item = group_item.child(child_row)

                if child_item.hasChildren():
                    subgroup_visible = False

                    for template_row in range(child_item.rowCount()):
                        template_item = child_item.child(template_row)
                        matches = search_text in template_item.text().lower()
                        template_item.setEnabled(matches)

                        if matches:
                            subgroup_visible = True

                    child_item.setEnabled(subgroup_visible)
                    group_visible = group_visible or subgroup_visible

                    index = self.template_model.indexFromItem(child_item)
                    self.template_dock.template_list.setExpanded(index, subgroup_visible)

                else:
                    template_item = child_item
                    matches = search_text in template_item.text().lower()
                    template_item.setEnabled(matches)

                    if matches:
                        group_visible = True

            group_item.setEnabled(group_visible)

            index = self.template_model.indexFromItem(group_item)
            self.template_dock.template_list.setExpanded(index, group_visible)

    def start_digitizing_for_layer(self, layer: QgsVectorLayer) -> None:
        self.digitize_map_tool.clean()
        self.digitize_map_tool.setLayer(layer)
        if not layer.isEditable():
            succeeded = layer.startEditing()
            if not succeeded:
                logger.warning("Failed to start editing layer %s", layer.name())
                return
        iface.mapCanvas().setMapTool(self.digitize_map_tool)

    def ask_for_feature_attributes(self, feature: QgsFeature) -> None:
        """Shows a dialog to ask for feature attributes and creates the feature"""

        if not self.active_template:
            return

        attribute_form = PlanFeatureForm(self.active_template.config)

        if attribute_form.exec_():
            layer = get_layer_from_project(self.active_template.config.feature.layer)
            # Save the feature
            attribute_form.set_feature_attributes(feature)

            layer.beginEditCommand("Create feature from template")
            layer.addFeature(feature)
            layer.commitChanges(stopEditing=False)

    def get_library_names(self) -> list[str]:
        return list(self.library_configs.keys())

    def set_active_library(self, library_name: str) -> None:
        self.template_model.clear()

        grouped_templates: defaultdict[str, defaultdict[str, list[FeatureTemplate]]] = defaultdict(
            lambda: defaultdict(list)
        )

        # Group templates by 'group' and 'sub_group'
        for template in self.library_configs[library_name].templates:
            group = getattr(template, "group", None) or "Ryhmittelemättömät"
            sub_group = getattr(template, "sub_group", None)
            if sub_group:
                grouped_templates[group][sub_group].append(template)
            else:
                grouped_templates[group][""].append(template)

        for group_name, sub_group_dict in grouped_templates.items():
            group_item = QStandardItem(group_name)
            group_item.setEditable(False)

            for sub_group_name, templates in sub_group_dict.items():
                if sub_group_name:
                    sub_group_item = QStandardItem(sub_group_name)
                    sub_group_item.setEditable(False)
                    group_item.appendRow(sub_group_item)
                    target_item = sub_group_item
                else:
                    # If template has no sub_group set, list it directly under group
                    target_item = group_item

                for template in templates:
                    template_item = TemplateItem(template)
                    template_item.setEditable(False)
                    target_item.appendRow(template_item)

            self.template_model.appendRow(group_item)

        self.template_dock.template_list.expandAll()

    def _read_library_configs(self) -> None:
        for config_file in library_config_files():
            try:
                config = parse_template_library_config(config_file)
                self.library_configs[config.meta.name] = config
            except (TemplateLibraryVersionError, TemplateSyntaxError) as e:
                logger.warning("Failed to parse template library configuration: %s", e)

        first_library_name = next(iter(self.library_configs), None)
        if first_library_name:
            self.set_active_library(first_library_name)
