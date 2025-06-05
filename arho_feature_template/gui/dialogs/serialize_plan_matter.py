from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import QDialog, QDialogButtonBox

if TYPE_CHECKING:
    from qgis.gui import QgsFileWidget


ui_path = resources.files(__package__) / "serialize_plan_matter.ui"
FormClass, _ = uic.loadUiType(ui_path)


class SerializePlanMatter(QDialog, FormClass):  # type: ignore
    plan_matter_file: QgsFileWidget
    button_box: QDialogButtonBox

    def __init__(self):
        super().__init__()
        self.setupUi(self)

        self.plan_matter_file.fileChanged.connect(self.check_inputs)
        self.setMaximumHeight(76)  # Lock height
        self.check_inputs()

    def check_inputs(self):
        """Enables ok/save button only if both file paths are defined."""
        if self.plan_matter_file.filePath():
            self.button_box.button(QDialogButtonBox.Ok).setEnabled(True)
        else:
            self.button_box.button(QDialogButtonBox.Ok).setEnabled(False)

    def get_path(self) -> str:
        return self.plan_matter_file.filePath()
