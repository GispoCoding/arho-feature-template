from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.gui import QgsDockWidget
from qgis.PyQt import uic

if TYPE_CHECKING:
    from qgis.gui import QgsFilterLineEdit
    from qgis.PyQt.QtWidgets import QComboBox, QLabel, QListView

ui_path = resources.files(__package__) / "template_dock.ui"
DockClass, _ = uic.loadUiType(ui_path)


class TemplateLibraryDock(QgsDockWidget, DockClass):  # type: ignore
    library_selection: QComboBox
    search_box: QgsFilterLineEdit
    template_list: QListView
    txt_tip: QLabel

    def __init__(self) -> None:
        super().__init__()
        self.setupUi(self)

        self.search_box.setShowSearchIcon(True)
