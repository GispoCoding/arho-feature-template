from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtCore import pyqtSignal
from qgis.PyQt.QtWidgets import QLineEdit, QWidget

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QPushButton

ui_path = resources.files(__package__) / "subject_identifier_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)


class SubjectIdentifierWidget(QWidget, FormClass):  # type: ignore
    """A subject identifier input for plan regulation."""

    delete_signal = pyqtSignal(QWidget)

    def __init__(self, value: str | None = None, parent=None):
        super().__init__(parent)
        self.setupUi(self)

        # TYPES
        self.subject: QLineEdit
        self.del_btn: QPushButton

        self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.del_btn.clicked.connect(lambda: self.delete_signal.emit(self))

        if value:
            self.set_value(value)

    def get_value(self) -> str:
        return self.subject.text()

    def set_value(self, value: str):
        self.subject.setText(value)
