from __future__ import annotations

import os
from typing import TYPE_CHECKING, Callable

from qgis.core import QgsApplication
from qgis.PyQt.QtCore import QCoreApplication, Qt, QTranslator
from qgis.PyQt.QtGui import QIcon
from qgis.PyQt.QtWidgets import QAction, QMenu, QToolButton, QWidget

from arho_feature_template.core.geotiff_creator import GeoTiffCreator
from arho_feature_template.core.plan_manager import PlanManager
from arho_feature_template.gui.dialogs.plugin_settings import PluginSettings
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
        self.validation_dock = ValidationDock()
        iface.addDockWidget(Qt.RightDockWidgetArea, self.validation_dock)
        iface.addDockWidget(Qt.RightDockWidgetArea, self.plan_manager.new_feature_dock)
        iface.addDockWidget(Qt.RightDockWidgetArea, self.plan_manager.regulation_groups_dock)

        # Try initializing the plugin immediately in case the project is already open
        self.plan_manager.initialize_from_project()

        # (Re)initialize whenever a project is opened
        iface.projectRead.connect(self.plan_manager.initialize_from_project)

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

        self.validation_dock_action = self.add_action(
            text="Validointi",
            # icon=QgsApplication.getThemeIcon("mActionEditNodesItem.svg"),
            icon=QIcon(resources_path("icons", "toolbar", "kaavan_validointi2.svg")),
            triggered_callback=lambda _: self.toggle_dock_visibility(self.validation_dock),
            add_to_menu=True,
            add_to_toolbar=True,
        )

        self.serialize_plan_action = self.add_action(
            text="Tallenna kaava JSON",
            # icon=QgsApplication.getThemeIcon("mActionFileSaveAs.svg"),
            icon=QIcon(resources_path("icons", "toolbar", "tallenna_jsonina2.svg")),
            triggered_callback=self.serialize_plan,
            add_to_menu=True,
            add_to_toolbar=True,
            status_tip="Tallenna aktiivinen kaava JSON muodossa",
        )

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

        self.plugin_settings_action = self.add_action(
            text="Asetukset",
            triggered_callback=self.open_settings,
            add_to_menu=True,
            add_to_toolbar=False,
            status_tip="Muokkaa pluginin asetuksia",
        )

        self.plan_manager.inspect_plan_feature_tool.deactivated.connect(
            lambda: self.identify_plan_features_action.setChecked(False)
        )

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
