from __future__ import annotations

from typing import TYPE_CHECKING, Callable, cast

from qgis.core import QgsApplication
from qgis.PyQt.QtCore import QCoreApplication, Qt, QTranslator
from qgis.PyQt.QtGui import QIcon
from qgis.PyQt.QtWidgets import QAction, QWidget
from qgis.utils import iface

from arho_feature_template.core.feature_template_library import FeatureTemplater, TemplateGeometryDigitizeMapTool
from arho_feature_template.core.plan_manager import PlanManager
from arho_feature_template.gui.new_plan_regulation_group_form import NewPlanRegulationGroupForm
from arho_feature_template.gui.plugin_settings import PluginSettings
from arho_feature_template.gui.post_plan import PostPlan
from arho_feature_template.gui.validation_dock import ValidationDock
from arho_feature_template.qgis_plugin_tools.tools.custom_logging import setup_logger, teardown_logger
from arho_feature_template.qgis_plugin_tools.tools.i18n import setup_translation
from arho_feature_template.qgis_plugin_tools.tools.resources import plugin_name

if TYPE_CHECKING:
    from qgis.gui import QgisInterface, QgsMapTool

    iface: QgisInterface = cast("QgisInterface", iface)  # type: ignore[no-redef]


class Plugin:
    """QGIS Plugin Implementation."""

    name = plugin_name()

    def __init__(self) -> None:
        setup_logger(Plugin.name)
        self.digitizing_tool = None
        self.plan_manager = PlanManager()

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

        self.toolbar = iface.addToolBar("ARHO Toolbar")
        self.toolbar.setToolButtonStyle(Qt.ToolButtonTextBesideIcon)

    def add_action(
        self,
        text: str,
        icon: QIcon | None = None,
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

        :param icon: Icon for this action.

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
        if not icon:
            icon = QIcon("")
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
            self.toolbar.addAction(action)

        if add_to_menu:
            iface.addPluginToMenu(self.menu, action)

        self.actions.append(action)

        return action

    def initGui(self) -> None:  # noqa N802
        self.templater = FeatureTemplater()

        # plan_icon_path = os.path.join(PLUGIN_PATH, "resources/icons/city.png")  # A placeholder icon
        # load_icon_path = os.path.join(PLUGIN_PATH, "resources/icons/folder.png")  # A placeholder icon

        iface.addDockWidget(Qt.RightDockWidgetArea, self.templater.template_dock)
        self.templater.template_dock.visibilityChanged.connect(self.dock_visibility_changed)

        iface.mapCanvas().mapToolSet.connect(self.templater.digitize_map_tool.deactivate)

        self.validation_dock = ValidationDock()
        iface.addDockWidget(Qt.RightDockWidgetArea, self.validation_dock)

        self.validation_dock.visibilityChanged.connect(self.validation_dock_visibility_changed)

        # icons to consider:
        # icon=QgsApplication.getThemeIcon("mActionStreamingDigitize.svg"),
        # icon=QgsApplication.getThemeIcon("mIconGeometryCollectionLayer.svg"),
        # icon=QgsApplication.getThemeIcon("mActionSharingExport.svg"),

        # Add main plugin action to the toolbar
        self.new_land_use_plan_action = self.add_action(
            text="Luo uusi kaava",
            icon=QgsApplication.getThemeIcon("mActionNewMap.svg"),
            triggered_callback=self.add_new_plan,
            add_to_menu=True,
            add_to_toolbar=True,
            status_tip="Luo uusi kaava",
        )

        self.load_land_use_plan_action = self.add_action(
            text="Lataa/avaa kaavaa",
            icon=QgsApplication.getThemeIcon("mActionFileOpen.svg"),
            triggered_callback=self.load_existing_land_use_plan,
            parent=iface.mainWindow(),
            add_to_menu=True,
            add_to_toolbar=True,
            status_tip="Lataa/avaa kaava",
        )

        self.template_dock_action = self.add_action(
            text="Kaavakohdetemplaatit",
            icon=QgsApplication.getThemeIcon("mIconFieldGeometry.svg"),
            toggled_callback=self.toggle_template_dock,
            checkable=True,
            add_to_menu=True,
            add_to_toolbar=True,
        )

        self.validation_dock_action = self.add_action(
            text="Validointi virheet",
            icon=QgsApplication.getThemeIcon("mActionEditNodesItem.svg"),
            toggled_callback=self.toggle_validation_dock,
            checkable=True,
            add_to_menu=True,
            add_to_toolbar=True,
        )

        self.new_plan_regulation_group = self.add_action(
            text="Luo kaavamääräysryhmä",
            icon=QgsApplication.getThemeIcon("mActionAddManualTable.svg"),
            triggered_callback=self.open_plan_regulation_group_form,
            add_to_menu=True,
            add_to_toolbar=True,
        )

        self.serialize_plan_action = self.add_action(
            text="Tallenna kaava JSON",
            icon=QgsApplication.getThemeIcon("mActionFileSaveAs.svg"),
            triggered_callback=self.serialize_plan,
            add_to_menu=True,
            add_to_toolbar=True,
            status_tip="Tallenna aktiivinen kaava JSON muodossa",
        )

        self.post_plan_action = self.add_action(
            text="Vie kaava",
            icon=QgsApplication.getThemeIcon("mActionSharingExport.svg"),
            triggered_callback=self.post_plan,
            add_to_menu=True,
            add_to_toolbar=True,
            status_tip="Vie kaava Ryhtiin",
        )

        self.plugin_settings_action = self.add_action(
            text="Asetukset",
            triggered_callback=self.open_settings,
            add_to_menu=True,
            add_to_toolbar=False,
            status_tip="Säädä pluginin asetuksia",
        )

    def on_map_tool_changed(self, new_tool: QgsMapTool, old_tool: QgsMapTool) -> None:  # noqa: ARG002
        if not isinstance(new_tool, TemplateGeometryDigitizeMapTool):
            self.template_dock_action.setChecked(False)

    def add_new_plan(self):
        self.plan_manager.add_new_plan()

    def load_existing_land_use_plan(self):
        self.plan_manager.load_land_use_plan()

    def serialize_plan(self):
        """Serializes currently active plan."""
        self.plan_manager.get_plan_json()

    def post_plan(self):
        """Posts plan to Ryhti."""
        dialog = PostPlan()
        dialog.exec_()

    def open_settings(self):
        """Open the plugin settings dialog."""
        settings = PluginSettings()
        settings.exec_()

    def unload(self) -> None:
        """Removes the plugin menu item and icon from QGIS GUI."""
        for action in self.actions:
            iface.removePluginMenu(Plugin.name, action)
            iface.removeToolBarIcon(action)
        iface.mainWindow().removeToolBar(self.toolbar)
        teardown_logger(Plugin.name)

        self.templater.template_dock.close()
        self.validation_dock.close()

    def dock_visibility_changed(self, visible: bool) -> None:  # noqa: FBT001
        self.template_dock_action.setChecked(visible)

    def toggle_template_dock(self, show: bool) -> None:  # noqa: FBT001
        self.templater.template_dock.setUserVisible(show)

    def validation_dock_visibility_changed(self, visible: bool) -> None:  # noqa: FBT001
        self.validation_dock_action.setChecked(visible)

    def toggle_validation_dock(self, show: bool) -> None:  # noqa: FBT001
        self.validation_dock.setUserVisible(show)

    def open_plan_regulation_group_form(self):
        self.new_plan_regulation_group_dialog = NewPlanRegulationGroupForm()
        self.new_plan_regulation_group_dialog.exec_()
