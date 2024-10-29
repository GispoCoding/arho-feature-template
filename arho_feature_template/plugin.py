from __future__ import annotations

import os
from typing import TYPE_CHECKING, Callable

from qgis.PyQt.QtCore import QCoreApplication, Qt, QTranslator
from qgis.PyQt.QtGui import QIcon
from qgis.PyQt.QtWidgets import QAction, QDialog, QMessageBox, QWidget

from arho_feature_template.core.exceptions import UnexpectedNoneError
from arho_feature_template.core.feature_template_library import FeatureTemplater, TemplateGeometryDigitizeMapTool
from arho_feature_template.core.new_plan import NewPlan
from arho_feature_template.core.update_plan import LandUsePlan, update_selected_plan
from arho_feature_template.gui.load_plan_dialog import LoadPlanDialog
from arho_feature_template.qgis_plugin_tools.tools.custom_logging import setup_logger, teardown_logger
from arho_feature_template.qgis_plugin_tools.tools.i18n import setup_translation
from arho_feature_template.qgis_plugin_tools.tools.resources import plugin_name
from arho_feature_template.utils.db_utils import get_existing_database_connection_names
from arho_feature_template.utils.misc_utils import PLUGIN_PATH
from arho_feature_template.utils.qgis_utils import iface

if TYPE_CHECKING:
    from qgis.gui import QgsMapTool


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
        self.new_plan = NewPlan()

        plan_icon_path = os.path.join(PLUGIN_PATH, "resources/icons/city.png")  # A placeholder icon
        load_icon_path = os.path.join(PLUGIN_PATH, "resources/icons/folder.png")  # A placeholder icon

        iface.addDockWidget(Qt.RightDockWidgetArea, self.templater.template_dock)
        self.templater.template_dock.visibilityChanged.connect(self.dock_visibility_changed)

        canvas = iface.mapCanvas()
        if canvas is None:
            raise UnexpectedNoneError
        canvas.mapToolSet.connect(self.templater.digitize_map_tool.deactivate)

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

        self.new_land_use_plan_action = self.add_action(
            plan_icon_path,
            "Create New Land Use Plan",
            self.add_new_plan,
            add_to_menu=True,
            add_to_toolbar=True,
            status_tip="Create a new land use plan",
        )

        self.load_land_use_plan_action = self.add_action(
            load_icon_path,
            text="Load existing land use plan",
            triggered_callback=self.load_existing_land_use_plan,
            parent=iface.mainWindow(),
            add_to_toolbar=True,
        )

    def on_map_tool_changed(self, new_tool: QgsMapTool, old_tool: QgsMapTool) -> None:  # noqa: ARG002
        if not isinstance(new_tool, TemplateGeometryDigitizeMapTool):
            self.template_dock_action.setChecked(False)

    def add_new_plan(self) -> None:
        self.new_plan.add_new_plan()

    def load_existing_land_use_plan(self) -> None:
        """Open existing land use plan."""

        connections = get_existing_database_connection_names()

        if not connections:
            QMessageBox.critical(None, "Error", "No database connections found.")
            return

        main_window = iface.mainWindow()
        if main_window is None:
            raise UnexpectedNoneError
        dialog = LoadPlanDialog(main_window, connections)

        if dialog.exec_() == QDialog.Accepted:
            selected_plan_id = dialog.get_selected_plan_id()

            if not selected_plan_id:
                QMessageBox.critical(None, "Error", "No plan was selected.")
                return

            plan = LandUsePlan(selected_plan_id)

            update_selected_plan(plan)

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
