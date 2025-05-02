from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtCore import pyqtSignal
from qgis.PyQt.QtWidgets import QWidget

from arho_feature_template.project.layers.code_layers import PlanThemeLayer

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QPushButton

    from arho_feature_template.gui.components.code_combobox import CodeComboBox

ui_path = resources.files(__package__) / "theme_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)


class ThemeWidget(QWidget, FormClass):  # type: ignore
    """A theme for plan regulation."""

    delete_signal = pyqtSignal(QWidget)

    def __init__(self, value: str | None = None, parent=None):
        super().__init__(parent)
        self.setupUi(self)

        # TYPES
        self.theme: CodeComboBox
        self.del_btn: QPushButton

        self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.del_btn.clicked.connect(lambda: self.delete_signal.emit(self))

        self.theme.populate_from_code_layer(PlanThemeLayer)

        if value:
            self.set_value(value)

    def get_value(self) -> str:
        return self.theme.value()

    def set_value(self, value: str | None):
        self.theme.set_value(value)
