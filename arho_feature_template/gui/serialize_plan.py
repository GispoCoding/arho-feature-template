from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import QDialog, QDialogButtonBox

if TYPE_CHECKING:
    from qgis.gui import QgsFileWidget


ui_path = resources.files(__package__) / "serialize_plan.ui"
FormClass, _ = uic.loadUiType(ui_path)


class SerializePlan(QDialog, FormClass):  # type: ignore
    plan_outline_file: QgsFileWidget
    plan_file: QgsFileWidget
    button_box: QDialogButtonBox

    def __init__(self):
        super().__init__()
        self.setupUi(self)

        self.plan_outline_file.fileChanged.connect(self.check_inputs)
        self.plan_file.fileChanged.connect(self.check_inputs)
        self.setMaximumHeight(107)  # Lock height
        self.check_inputs()

    def check_inputs(self):
        """Enables ok/save button only if both file paths are defined."""
        if self.plan_outline_file.filePath() and self.plan_file.filePath():
            self.button_box.button(QDialogButtonBox.Ok).setEnabled(True)
        else:
            self.button_box.button(QDialogButtonBox.Ok).setEnabled(False)

    def get_paths(self) -> tuple[str, str]:
        return self.plan_outline_file.filePath(), self.plan_file.filePath()
