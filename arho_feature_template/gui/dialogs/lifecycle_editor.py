from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import QDialog, QDialogButtonBox, QPushButton

from arho_feature_template.gui.components.lifecycle_table_widget import LifecycleTableWidget

if TYPE_CHECKING:
    from arho_feature_template.core.models import Plan

ui_path = resources.files(__package__) / "lifecycle_editor.ui"
FormClass, _ = uic.loadUiType(ui_path)


class LifecycleEditor(QDialog, FormClass):  # type: ignore
    add_lifecycle_button: QPushButton
    button_box: QDialogButtonBox

    def __init__(self, plan: Plan, parent=None):
        super().__init__(parent)
        self.setupUi(self)

        self.plan = plan
        if not self.plan:
            self.reject()
            return

        self.lifecycle_table = LifecycleTableWidget(self.plan.lifecycles)
        self.layout().insertWidget(1, self.lifecycle_table)
        self.add_lifecycle_button.setIcon(QgsApplication.getThemeIcon("mActionAdd.svg"))

        self.add_lifecycle_button.clicked.connect(self.lifecycle_table.add_new_lifecycle_row)
        self.lifecycle_table.table_edited.connect(self._check_required_fields)

        self.button_box.accepted.connect(self._on_ok_clicked)
        self.button_box.rejected.connect(self.reject)
        self.button_box.button(QDialogButtonBox.Ok).setEnabled(False)

        self._check_required_fields()

    def _check_required_fields(self) -> None:
        """Enable/disable the OK button based on the validation of the lifecycle table."""
        ok_button = self.button_box.button(QDialogButtonBox.Ok)
        ok_button.setEnabled(self.lifecycle_table.is_ok())

    def _on_ok_clicked(self):
        """Replace existing lifecycles with updated data and save the plan."""
        if not self.plan:
            return

        self.plan.lifecycles = self.lifecycle_table.into_model()

        self.accept()

    def reject(self):
        super().reject()
