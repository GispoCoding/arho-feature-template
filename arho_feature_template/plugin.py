from __future__ import annotations

import os
from typing import TYPE_CHECKING, Callable

from qgis.core import QgsApplication, QgsExpressionContextUtils, QgsProject
from qgis.PyQt.QtCore import QCoreApplication, Qt, QTranslator
from qgis.PyQt.QtGui import QIcon
from qgis.PyQt.QtWidgets import QAction, QMenu, QToolButton, QWidget

from arho_feature_template.core.geotiff_creator import GeoTiffCreator
from arho_feature_template.core.plan_manager import PlanManager
from arho_feature_template.gui.dialogs.plugin_settings import PluginSettings
from arho_feature_template.gui.dialogs.post_plan import PostPlanDialog
from arho_feature_template.gui.docks.validation_dock import ValidationDock
from arho_feature_template.qgis_plugin_tools.tools.custom_logging import setup_logger, teardown_logger
from arho_feature_template.qgis_plugin_tools.tools.i18n import setup_translation
from arho_feature_template.qgis_plugin_tools.tools.resources import plugin_name, resources_path
from arho_feature_template.utils.misc_utils import disconnect_signal, iface

if TYPE_CHECKING:
    from qgis.gui import QgsDockWidget


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

        self.toolbar = iface.addToolBar("ARHO Toolbar")
        self.toolbar.setToolButtonStyle(Qt.ToolButtonTextBesideIcon)

    def check_timezone_variable(self):
        """Check if PGTZ environment variable is correctly set."""

        if os.environ.get("PGTZ") != "Europe/Helsinki":
            iface.messageBar().pushWarning(
                "Varoitus",
                (
                    "Ympäristömuuttuja PGTZ ei ole asetettu arvoon 'Europe/Helsinki'."
                    "Tämä voi johtaa väärään aikavyöhykkeeseen tallennettuihin kellonaikoihin."
                ),
            )

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
        # Plan manager
        self.plan_manager = PlanManager()
        iface.mapCanvas().mapToolSet.connect(self.plan_manager.plan_digitize_map_tool.deactivate)

        # Docks
        iface.addDockWidget(Qt.RightDockWidgetArea, self.plan_manager.new_feature_dock)

        iface.addDockWidget(Qt.RightDockWidgetArea, self.plan_manager.regulation_groups_dock)
        iface.mainWindow().tabifyDockWidget(
            self.plan_manager.new_feature_dock, self.plan_manager.regulation_groups_dock
        )

        self.validation_dock = ValidationDock()
        iface.addDockWidget(Qt.RightDockWidgetArea, self.validation_dock)
        iface.mainWindow().tabifyDockWidget(self.plan_manager.new_feature_dock, self.validation_dock)

        # Hide the docks because they cannot be used before a plan has been selected/activated
        self.plan_manager.new_feature_dock.hide()
        self.plan_manager.regulation_groups_dock.hide()
        self.validation_dock.hide()

        # Actions
        self.new_land_use_plan_action = self.add_action(
            text="Luo kaava",
            icon=QIcon(resources_path("icons", "toolbar", "luo_kaava2.svg")),
            # icon=QgsApplication.getThemeIcon("mActionNewMap.svg"),
            triggered_callback=self.add_new_plan,
            add_to_menu=True,
            add_to_toolbar=True,
            status_tip="Luo uusi kaava",
        )

        self.load_land_use_plan_action = self.add_action(
            text="Avaa kaava",
            # icon=QgsApplication.getThemeIcon("mActionFileOpen.svg"),
            icon=QIcon(resources_path("icons", "toolbar", "avaa_kaava4.svg")),
            triggered_callback=self.load_existing_land_use_plan,
            parent=iface.mainWindow(),
            add_to_menu=True,
            add_to_toolbar=True,
            status_tip="Lataa/avaa kaava",
        )

        self.edit_plan_tool_button = QToolButton()
        self.edit_plan_tool_button.setToolButtonStyle(Qt.ToolButtonTextBesideIcon)
        self.edit_plan_tool_button.setMenu(QMenu())
        self.edit_plan_tool_button.setPopupMode(QToolButton.MenuButtonPopup)
        self.edit_plan_tool_action = self.toolbar.addWidget(self.edit_plan_tool_button)

        self.edit_land_use_plan_action = self.add_action(
            text="Muokkaa kaavaa",
            # icon=QgsApplication.getThemeIcon("mActionFileOpen.svg"),
            icon=QIcon(resources_path("icons", "toolbar", "muokkaa_kaavaa2.svg")),
            triggered_callback=self.plan_manager.edit_plan,
            parent=iface.mainWindow(),
            add_to_menu=True,
            add_to_toolbar=False,
            status_tip="Muokkaa aktiivisen kaavan tietoja",
        )
        self.edit_plan_tool_button.menu().addAction(self.edit_land_use_plan_action)
        self.edit_plan_tool_button.setDefaultAction(self.edit_land_use_plan_action)

        self.edit_lifecycles_action = self.add_action(
            text="Muokkaa kaavan elinkaarien päivämääriä",
            icon=QgsApplication.getThemeIcon("mIconFieldDate.svg"),
            # icon=QIcon(resources_path("icons", "toolbar", "tallenna_jsonina2.svg")),
            triggered_callback=self.edit_lifecycles,
            add_to_menu=True,
            add_to_toolbar=False,
            status_tip="Muokkaa kaavan elinkaarien päivämääriä",
        )
        self.edit_plan_tool_button.menu().addAction(self.edit_lifecycles_action)

        self.new_feature_dock_action = self.add_action(
            text="Luo kaavakohde",
            # icon=QgsApplication.getThemeIcon("mIconFieldGeometry.svg"),
            icon=QIcon(resources_path("icons", "toolbar", "luo_kaavakohde.svg")),
            triggered_callback=lambda _: self.toggle_dock_visibility(self.plan_manager.new_feature_dock),
            add_to_menu=True,
            add_to_toolbar=True,
        )

        self.identify_plan_features_action = self.add_action(
            text="Muokkaa kaavakohdetta",
            icon=QIcon(resources_path("icons", "toolbar", "muokkaa_kaavakohdetta1.svg")),
            toggled_callback=self.plan_manager.toggle_identify_plan_features,
            add_to_menu=False,
            add_to_toolbar=True,
            checkable=True,
        )

        self.regulation_groups_dock_action = self.add_action(
            text="Hallitse kaavamääräysryhmiä",
            icon=QgsApplication.getThemeIcon("mActionOpenTable.svg"),
            triggered_callback=lambda _: self.toggle_dock_visibility(self.plan_manager.regulation_groups_dock),
            add_to_menu=True,
            add_to_toolbar=True,
        )

        self.manage_libraries_action = self.add_action(
            text="Hallitse kirjastoja",
            icon=QgsApplication.getThemeIcon("mActionOpenTable.svg"),
            triggered_callback=self.plan_manager.manage_libraries,
            add_to_menu=True,
            add_to_toolbar=True,
        )

        self.validation_dock_action = self.add_action(
            text="Validointi",
            # icon=QgsApplication.getThemeIcon("mActionEditNodesItem.svg"),
            icon=QIcon(resources_path("icons", "toolbar", "kaavan_validointi2.svg")),
            triggered_callback=lambda _: self.toggle_dock_visibility(self.validation_dock),
            add_to_menu=True,
            add_to_toolbar=True,
        )

        self.serialize_tool_button = QToolButton()
        self.serialize_tool_button.setToolButtonStyle(Qt.ToolButtonTextBesideIcon)
        self.serialize_tool_button.setMenu(QMenu())
        self.serialize_tool_button.setPopupMode(QToolButton.MenuButtonPopup)
        self.serialize_tool_action = self.toolbar.addWidget(self.serialize_tool_button)

        self.serialize_plan_action = self.add_action(
            text="Tallenna kaava JSON",
            # icon=QgsApplication.getThemeIcon("mActionFileSaveAs.svg"),
            icon=QIcon(resources_path("icons", "toolbar", "tallenna_jsonina2.svg")),
            triggered_callback=self.serialize_plan,
            add_to_menu=True,
            add_to_toolbar=False,
            status_tip="Tallenna aktiivinen kaava JSON muodossa",
        )
        self.serialize_tool_button.menu().addAction(self.serialize_plan_action)
        self.serialize_tool_button.setDefaultAction(self.serialize_plan_action)

        self.serialize_plan_matter_action = self.add_action(
            text="Tallenna kaava-asian JSON",
            icon=QIcon(resources_path("icons", "toolbar", "tallenna_jsonina2.svg")),
            triggered_callback=self.serialize_plan_matter,
            add_to_menu=True,
            add_to_toolbar=False,
            status_tip="Tallenna aktiivisen kaavan kaava-asia JSON muodossa",
        )
        self.serialize_tool_button.menu().addAction(self.serialize_plan_matter_action)

        self.create_geotiff_action = self.add_action(
            text="Tallenna kaavakartta",
            icon=QgsApplication.getThemeIcon("mActionAddRasterLayer.svg"),
            triggered_callback=self.create_geotiff,
            add_to_menu=True,
            add_to_toolbar=True,
            status_tip="Tallenna aktiivinen kaava geotiff muodossa",
        )

        self.import_features_action = self.add_action(
            text="Tuo kaavakohteita",
            icon=QgsApplication.getThemeIcon("mActionSharingImport.svg"),
            triggered_callback=self.plan_manager.open_import_features_dialog,
            add_to_menu=True,
            add_to_toolbar=True,
            status_tip="Tuo kaavakohteita tietokantaan toisilta vektoritasoilta",
        )

        self.post_plan_matter_action = self.add_action(
            text="Vie kaava-asia",
            icon=QgsApplication.getThemeIcon("mActionSharingExport.svg"),
            triggered_callback=self.post_plan_matter,
            add_to_menu=True,
            add_to_toolbar=True,
            status_tip="Vie kaava-asia Ryhtiin",
        )
        self.post_plan_matter_action.setEnabled(False)  # Disable button by default

        self.get_permanent_identifier_action = self.add_action(
            text="Hae pysyvä kaavatunnus",
            # icon=QgsApplication.getThemeIcon(""),
            triggered_callback=self.plan_manager.get_permanent_plan_identifier,
            add_to_menu=True,
            add_to_toolbar=True,
            status_tip="Hae kaavalle pysyvä kaavatunnus",
        )
        self.get_permanent_identifier_action.setEnabled(False)  # Disable button by default

        self.plugin_settings_action = self.add_action(
            text="Asetukset",
            triggered_callback=self.open_settings,
            add_to_menu=True,
            add_to_toolbar=False,
            status_tip="Muokkaa pluginin asetuksia",
        )

        self.project_depending_actions = [self.new_land_use_plan_action, self.load_land_use_plan_action]
        self.plan_depending_actions = [
            self.edit_land_use_plan_action,
            self.edit_lifecycles_action,
            self.new_feature_dock_action,
            self.identify_plan_features_action,
            self.regulation_groups_dock_action,
            self.validation_dock_action,
            self.serialize_plan_action,
            self.create_geotiff_action,
            self.import_features_action,
            self.get_permanent_identifier_action,
            self.post_plan_matter_action,
        ]

        # Initially actions are disabled because no plan is selected
        self.on_active_plan_unset()
        # Check if project opened and if not disable actions
        if not self.plan_manager.check_required_layers():
            self.on_project_cleared()

        # Connect signals
        self.plan_manager.inspect_plan_feature_tool.deactivated.connect(
            lambda: self.identify_plan_features_action.setChecked(False)
        )
        self.plan_manager.plan_set.connect(self.on_active_plan_set)
        self.plan_manager.plan_unset.connect(self.on_active_plan_unset)
        self.plan_manager.project_loaded.connect(self.on_project_loaded)
        self.plan_manager.project_cleared.connect(self.on_project_cleared)
        self.plan_manager.plan_identifier_set.connect(self.update_ryhti_buttons)
        self.plan_manager.plan_identifier_set.connect(self.validation_dock.on_permanent_identifier_set)

        # (Re)initialize whenever a project is opened
        iface.projectRead.connect(self.plan_manager.on_project_loaded)
        # Try initializing the plugin immediately in case the project is already open
        self.plan_manager.on_project_loaded()

        self.check_timezone_variable()

    def toggle_dock_visibility(self, dock_widget: QgsDockWidget):
        if dock_widget.isUserVisible():
            dock_widget.hide()
        else:
            dock_widget.show()
            dock_widget.raise_()

    def add_new_plan(self):
        self.plan_manager.add_new_plan()

    def load_existing_land_use_plan(self):
        self.plan_manager.load_land_use_plan()

    def serialize_plan(self):
        """Serializes currently active plan."""
        self.plan_manager.get_plan_json()

    def serialize_plan_matter(self):
        """Serializes currently activate plan's plan matter."""
        self.plan_manager.get_plan_matter_json()

    def open_settings(self):
        """Open the plugin settings dialog."""
        settings = PluginSettings()
        settings.exec_()

    def edit_lifecycles(self):
        """Edit lifecycles of currently active plan."""
        self.plan_manager.edit_lifecycles()

    def create_geotiff(self):
        """Create geotiff from currently active plan."""
        geotiff_creator = GeoTiffCreator()
        geotiff_creator.select_output_file()

    def post_plan_matter(self):
        """Exports plan matter to Ryhti."""
        dialog = PostPlanDialog()
        dialog.exec_()

    def update_ryhti_buttons(self):
        """Update the UI buttons based on whether the active plan has a permanent identifier."""
        permanent_identifier = QgsExpressionContextUtils.projectScope(QgsProject.instance()).variable(
            "permanent_identifier"
        )

        if permanent_identifier:
            self.get_permanent_identifier_action.setEnabled(False)
            self.get_permanent_identifier_action.setToolTip(f"Pysyvä kaavatunnus: {permanent_identifier}")
            self.post_plan_matter_action.setEnabled(True)
            self.post_plan_matter_action.setToolTip("Vie kaava-asia Ryhtiin")
        else:
            self.post_plan_matter_action.setEnabled(False)
            self.post_plan_matter_action.setToolTip("Hae kaavalle ensin pysyvä kaavatunnus")
            self.get_permanent_identifier_action.setEnabled(True)
            self.get_permanent_identifier_action.setToolTip("Hae pysyvä kaavatunnus")

    def on_active_plan_set(self):
        for action in self.plan_depending_actions:
            action.setEnabled(True)

    def on_active_plan_unset(self):
        for action in self.plan_depending_actions:
            action.setEnabled(False)

    def on_project_loaded(self):
        for action in self.project_depending_actions:
            action.setEnabled(True)

    def on_project_cleared(self):
        for action in self.project_depending_actions:
            action.setEnabled(False)
        for action in self.plan_depending_actions:
            action.setEnabled(False)

    def unload(self) -> None:
        """Removes the plugin menu item and icon from QGIS GUI."""
        # Handle signals
        disconnect_signal(self.plan_manager.new_feature_dock.visibilityChanged)
        iface.mapCanvas().mapToolSet.disconnect()
        iface.projectRead.disconnect()

        # Handle actions
        for action in self.actions:
            iface.removePluginMenu(Plugin.name, action)
            iface.removeToolBarIcon(action)
            action.deleteLater()
        self.actions.clear()

        # Handle toolbar
        iface.mainWindow().removeToolBar(self.toolbar)
        self.toolbar = None

        # Handle plan manager
        self.plan_manager.unload()

        # Handle validation dock
        iface.removeDockWidget(self.validation_dock)
        self.validation_dock.deleteLater()

        # Handle logger
        teardown_logger(Plugin.name)
