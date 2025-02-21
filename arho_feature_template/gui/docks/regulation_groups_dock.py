from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.gui import QgsDockWidget
from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt, pyqtSignal
from qgis.PyQt.QtWidgets import QListWidget, QListWidgetItem, QMessageBox, QPushButton

from arho_feature_template.core.models import RegulationGroup, RegulationGroupLibrary
from arho_feature_template.utils.misc_utils import disconnect_signal

if TYPE_CHECKING:
    from qgis.gui import QgsFilterLineEdit
    from qgis.PyQt.QtWidgets import QWidget


ui_path = resources.files(__package__) / "regulation_groups_dock.ui"
DockClass, _ = uic.loadUiType(ui_path)


class RegulationGroupsDock(QgsDockWidget, DockClass):  # type: ignore
    search_box: QgsFilterLineEdit
    regulation_group_list: QListWidget
    dockWidgetContents: QWidget  # noqa: N815

    new_btn: QPushButton
    delete_btn: QPushButton
    edit_btn: QPushButton

    new_regulation_group_requested = pyqtSignal()
    edit_regulation_group_requested = pyqtSignal(RegulationGroup)
    delete_regulation_group_requested = pyqtSignal(RegulationGroup)

    def __init__(self, parent=None):
        super().__init__(parent)
        self.setupUi(self)

        self.new_btn.setIcon(QgsApplication.getThemeIcon("mActionAdd.svg"))
        self.delete_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.edit_btn.setIcon(QgsApplication.getThemeIcon("mActionEditTable.svg"))
        # QgsApplication.getThemeIcon("symbologyEdit.svg")

        self.connect_buttons()

        self.regulation_group_list.setSelectionMode(self.regulation_group_list.SingleSelection)
        self.regulation_group_list.clicked.connect(self.on_regulation_group_item_clicked)

        self.search_box.valueChanged.connect(self.filter_regulation_groups)

        self.selected_group = None

    def _disconnect_buttons(self):
        disconnect_signal(self.new_btn.clicked)
        disconnect_signal(self.edit_btn.clicked)
        disconnect_signal(self.delete_btn.clicked)

    def connect_buttons(self):
        self._disconnect_buttons()

        self.new_btn.clicked.connect(self.new_regulation_group_requested.emit)
        self.edit_btn.clicked.connect(self.on_edit_btn_clicked)
        self.delete_btn.clicked.connect(self.on_delete_btn_clicked)

    def initialize_regulation_groups(self, regulation_group_library: RegulationGroupLibrary):
        self.regulation_group_list.clear()

        for category in regulation_group_library.regulation_group_categories:
            for group in category.regulation_groups:
                self.add_regulation_group_to_list(group)

        self.selected_group = None

    def add_regulation_group_to_list(self, group: RegulationGroup):
        text = str(group)
        item = QListWidgetItem(text)
        item.setToolTip(text)
        item.setData(Qt.UserRole, group)
        self.regulation_group_list.addItem(item)

    def on_regulation_group_item_clicked(self, index: int):
        item = self.regulation_group_list.itemFromIndex(index)
        group: RegulationGroup = item.data(Qt.UserRole)
        # Clicked new list item => activate new group
        if group != self.selected_group:
            self.selected_group = group
            # NOTE: Workaround to fix make sure clicked item is selected. At least after a selected item has been
            # filtered out, clicking on a new template will select, immediately deselect (but keep focus)
            self.regulation_group_list.setCurrentItem(item)
        else:
            # Clicked selected list item => clear selection
            self.selected_group = None
            self.regulation_group_list.clearSelection()

    def on_edit_btn_clicked(self):
        if self.selected_group:
            self.edit_regulation_group_requested.emit(self.selected_group)

    def on_delete_btn_clicked(self):
        if self.selected_group:
            response = QMessageBox.question(
                None,
                "Kaavamääräysryhmän poisto",
                "Haluatko varmasti poistaa kaavamääräysryhmän?",
                QMessageBox.Yes | QMessageBox.No,
            )
            if response == QMessageBox.Yes:
                self.delete_regulation_group_requested.emit(self.selected_group)

    def filter_regulation_groups(self) -> None:
        search_text = self.search_box.value().lower()

        for index in range(self.regulation_group_list.count()):
            item = self.regulation_group_list.item(index)
            regulation_group: RegulationGroup = item.data(Qt.UserRole)
            item.setHidden(search_text not in item.text().lower())

            # Clear selection if the selected template was filtered
            if self.selected_group and self.selected_group is regulation_group and item.isHidden():
                self.regulation_group_list.clearSelection()

    def unload(self):
        self._disconnect_buttons()

        disconnect_signal(self.new_regulation_group_requested)
        disconnect_signal(self.edit_regulation_group_requested)
        disconnect_signal(self.delete_regulation_group_requested)
