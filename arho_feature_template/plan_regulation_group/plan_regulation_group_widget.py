from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtCore import pyqtSignal
from qgis.PyQt.QtWidgets import QWidget

from arho_feature_template.plan_regulation.plan_regulation_widget import PlanRegulationWidget

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QFrame, QLineEdit, QPushButton

    from arho_feature_template.plan_regulation.plan_regulation_config import PlanRegulationDefinition
    from arho_feature_template.plan_regulation_group.plan_regulation_group_config import PlanRegulationGroupDefinition

ui_path = resources.files(__package__) / "plan_regulation_group_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)


class PlanRegulationGroupWidget(QWidget, FormClass):  # type: ignore
    """A widget representation of a plan regulation group."""

    delete_signal = pyqtSignal(QWidget)

    def __init__(self, group_definition: PlanRegulationGroupDefinition):
        super().__init__()
        self.setupUi(self)

        # TYPES
        self.frame: QFrame
        self.heading: QLineEdit
        self.del_btn: QPushButton

        # INIT
        self.group_definition = group_definition
        self.layer = "plan_regulation_group"

        self.heading.setText(self.group_definition.name)
        self.init_buttons()
        for plan_regulation_definition in self.group_definition.plan_regulations:
            _ = self.add_plan_regulation_widget(plan_regulation_definition)

    def init_buttons(self):
        self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.del_btn.clicked.connect(lambda: self.delete_signal.emit(self))

    def add_plan_regulation_widget(self, definition: PlanRegulationDefinition) -> PlanRegulationWidget:
        widget = PlanRegulationWidget.from_definition(definition=definition, parent=self.frame)
        widget.delete_signal.connect(self.delete_plan_regulation_widget)
        self.frame.layout().addWidget(widget)
        return widget

    def delete_plan_regulation_widget(self, plan_regulation_widget: PlanRegulationWidget):
        self.frame.layout().removeWidget(plan_regulation_widget)
        plan_regulation_widget.deleteLater()
