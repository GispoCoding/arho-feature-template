from importlib import resources
from typing import TYPE_CHECKING

from qgis.gui import QgsDockWidget
from qgis.PyQt import uic

if TYPE_CHECKING:
    from qgis.gui import QgsFilterLineEdit
    from qgis.PyQt.QtWidgets import QComboBox, QLabel, QTreeView

ui_path = resources.files(__package__) / "template_dock.ui"
DockClass, _ = uic.loadUiType(ui_path)


class TemplateLibraryDock(QgsDockWidget, DockClass):  # type: ignore
    library_selection: "QComboBox"
    search_box: "QgsFilterLineEdit"
    # template_list: "QListView"
    template_list: "QTreeView"
    txt_tip: "QLabel"

    def __init__(self):
        super().__init__()
        self.setupUi(self)

        self.search_box.setShowSearchIcon(True)
