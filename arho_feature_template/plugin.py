from __future__ import annotations

import os

from typing import TYPE_CHECKING, Callable, cast

from qgis.core import QgsProject
from qgis.PyQt.QtCore import QCoreApplication, QTranslator, Qt
from qgis.PyQt.QtGui import QIcon
from qgis.PyQt.QtWidgets import QAction, QWidget, QDialog
from qgis.utils import iface

from arho_feature_template.core.feature_template_library import FeatureTemplater, TemplateGeometryDigitizeMapTool
from arho_feature_template.qgis_plugin_tools.tools.custom_logging import setup_logger, teardown_logger
from arho_feature_template.qgis_plugin_tools.tools.i18n import setup_translation
from arho_feature_template.qgis_plugin_tools.tools.resources import plugin_name

from arho_feature_template.utils.misc_utils import PLUGIN_PATH
from arho_feature_template.update_plan import update_selected_plan, _check_vector_layer, LandUsePlan
from arho_feature_template.LandUsePlanDialog import LandUsePlanDialog

if TYPE_CHECKING:
    from qgis.gui import QgisInterface, QgsMapTool

    iface: QgisInterface = cast("QgisInterface", iface)  # type: ignore[no-redef]


class Plugin:
    """QGIS Plugin Implementation."""

    name = plugin_name()

    def __init__(self) -> None:
        setup_logger(Plugin.name)
        self.digitizing_tool = None

        # initialize locale
        locale, file_path = setup_translation()
        if file_path:
            self.translator = QTranslator()
            self.translator.load(file_path)
            # noinspection PyCallByClass
            QCoreApplication.installTranslator(self.translator)
        else:
            pass
        self.actions: list[QAction] = []
        self.menu = Plugin.name

    def add_action(
        self,
        icon_path: str,
        text: str,
        triggered_callback: Callable | None = None,
        *,
        toggled_callback: Callable | None = None,
        object_name: str | None = None,
        enabled_flag: bool = True,
        add_to_menu: bool = True,
        add_to_toolbar: bool = True,
        status_tip: str | None = None,
        whats_this: str | None = None,
        parent: QWidget | None = None,
        checkable: bool = False,
    ) -> QAction:
        """Add a toolbar icon to the toolbar.

        :param icon_path: Path to the icon for this action. Can be a resource
            path (e.g. ':/plugins/foo/bar.png') or a normal file system path.

        :param text: Text that should be shown in menu items for this action.

        :param callback: Function to be called when the action is triggered.

        :param enabled_flag: A flag indicating if the action should be enabled
            by default. Defaults to True.

        :param add_to_menu: Flag indicating whether the action should also
            be added to the menu. Defaults to True.

        :param add_to_toolbar: Flag indicating whether the action should also
            be added to the toolbar. Defaults to True.

        :param status_tip: Optional text to show in a popup when mouse pointer
            hovers over the action.

        :param parent: Parent widget for the new action. Defaults None.

        :param whats_this: Optional text to show in the status bar when the
            mouse pointer hovers over the action.

        :returns: The action that was created. Note that the action is also
            added to self.actions list.
        :rtype: QAction
        """

        icon = QIcon(icon_path)
        action = QAction(icon, text, parent)
        # noinspection PyUnresolvedReferences
        if triggered_callback:
            action.triggered.connect(triggered_callback)

        if toggled_callback:
            action.toggled.connect(toggled_callback)

        action.setEnabled(enabled_flag)

        if status_tip is not None:
            action.setStatusTip(status_tip)

        if whats_this is not None:
            action.setWhatsThis(whats_this)

        if object_name:
            action.setObjectName(object_name)

        if checkable:
            action.setCheckable(True)

        if add_to_toolbar:
            iface.addToolBarIcon(action)

        if add_to_menu:
            iface.addPluginToMenu(self.menu, action)

        self.actions.append(action)

        return action

    def initGui(self) -> None:  # noqa N802
        self.templater = FeatureTemplater()

        new_path = os.path.join(PLUGIN_PATH, "resources/icons/city.png")  # A placeholder icon
        # <a href="https://www.flaticon.com/free-icons/land-use" title="land use icons">Land use icons created by Fusion5085 - Flaticon</a>
        load_path = os.path.join(PLUGIN_PATH, "resources/icons/folder.png")
        # <a href="https://www.flaticon.com/free-icons/open" title="open icons">Open icons created by Smashicons - Flaticon</a>

        iface.addDockWidget(Qt.RightDockWidgetArea, self.templater.template_dock)
        self.templater.template_dock.visibilityChanged.connect(self.dock_visibility_changed)

        iface.mapCanvas().mapToolSet.connect(self.templater.digitize_map_tool.deactivate)

        # Add main plugin action to the toolbar
        self.template_dock_action = self.add_action(
            "",
            "Feature Templates",
            None,
            toggled_callback=self.toggle_template_dock,
            checkable=True,
            add_to_menu=True,
            add_to_toolbar=True,
        )

        # Add additional action for "Lisää kaava"
        new_action = self.add_action(
            new_path,
            text="Lisää kaava",
            triggered_callback=self.start_digitizing,
            parent=iface.mainWindow(),  # Use iface instead of self.iface
            add_to_toolbar=True,
        )

        # Add additional action for "Avaa kaava"
        load_action = self.add_action(
            load_path,
            text="Avaa kaava",
            triggered_callback=self.open_plan,
            parent=iface.mainWindow(),  # Use iface instead of self.iface
            add_to_toolbar=True,
        )

    def on_map_tool_changed(self, new_tool: QgsMapTool, old_tool: QgsMapTool) -> None:  # noqa: ARG002
        if not isinstance(new_tool, TemplateGeometryDigitizeMapTool):
            self.template_dock_action.setChecked(False)

    def start_digitizing(self) -> None:
        dialog = LandUsePlanDialog()
        if dialog.exec_() != QDialog.Accepted:
            return

        # Create the LandUsePlan object from user input
        new_plan = LandUsePlan(id=dialog.plan_id, name=dialog.plan_name)
        plan_type = dialog.plan_type

        update_selected_plan(new_plan)

        layer_name = "Kaava"

        layers = QgsProject.instance().mapLayersByName(layer_name)
        kaava_layer = layers[0]
        
        if not kaava_layer:
            iface.messageBar().pushMessage("Error", f"Layer '{layer_name}' not found in the project", level=3)
            return

        # new_layer = layers[0]

        if not _check_vector_layer(kaava_layer):
            iface.messageBar().pushMessage("Error", f"Layer '{layer_name}' is not a valid vector layer", level=3)
            return

        iface.setActiveLayer(kaava_layer)
        if not kaava_layer.isEditable():
            kaava_layer.startEditing()

        # digitizing_tool = SimpleDrawTool(iface.mapCanvas())

        # Set the custom draw tool as the active tool on the canvas
        # iface.mapCanvas().setMapTool(digitizing_tool)

        # Notify the user
        iface.messageBar().pushMessage(
            "Info",
            f"Layer '{layer_name}' is filtered by plan '{new_plan.name}' of type '{plan_type}' and ready for digitizing.",
            level=0,
        )

    def open_plan(self) -> None:
        """Open existing land use plan."""
        pass

    def unload(self) -> None:
        """Removes the plugin menu item and icon from QGIS GUI."""
        for action in self.actions:
            iface.removePluginMenu(Plugin.name, action)
            iface.removeToolBarIcon(action)
        teardown_logger(Plugin.name)

        self.templater.template_dock.close()

    def dock_visibility_changed(self, visible: bool) -> None:  # noqa: FBT001
        self.template_dock_action.setChecked(visible)

    def toggle_template_dock(self, show: bool) -> None:  # noqa: FBT001
        self.templater.template_dock.setUserVisible(show)