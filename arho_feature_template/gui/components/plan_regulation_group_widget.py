from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtCore import pyqtSignal
from qgis.PyQt.QtGui import QIcon
from qgis.PyQt.QtWidgets import QWidget

from arho_feature_template.core.models import Proposition, Regulation, RegulationGroup
from arho_feature_template.gui.components.plan_proposition_widget import PropositionWidget
from arho_feature_template.gui.components.plan_regulation_widget import RegulationWidget
from arho_feature_template.project.layers.code_layers import PlanRegulationGroupTypeLayer
from arho_feature_template.qgis_plugin_tools.tools.resources import resources_path

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QFormLayout, QFrame, QLabel, QLineEdit, QPushButton

ui_path = resources.files(__package__) / "plan_regulation_group_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)


class RegulationGroupWidget(QWidget, FormClass):  # type: ignore
    """A widget representation of a plan regulation group."""

    open_as_form_signal = pyqtSignal(QWidget)
    delete_signal = pyqtSignal(QWidget)

    def __init__(self, regulation_group: RegulationGroup, layer_name: str):
        super().__init__()
        self.setupUi(self)

        # TYPES
        self.frame: QFrame
        self.name: QLineEdit
        self.short_name: QLineEdit
        self.short_name_label: QLabel
        self.edit_btn: QPushButton
        self.del_btn: QPushButton
        self.regulation_group_details_layout: QFormLayout

        # INIT
        self.frame.setObjectName("frame")  # Set unique name to avoid style cascading
        self.regulation_widgets: list[RegulationWidget] = []
        self.proposition_widgets: list[PropositionWidget] = []

        if regulation_group.id_:
            # Set style that indicates the regulation group exists in the plan already
            self.set_existing_regulation_group_style()

        self.from_model(regulation_group)
        self.regulation_group.type_code_id = PlanRegulationGroupTypeLayer.get_id_by_feature_layer_name(layer_name)

        self.edit_btn.setIcon(QIcon(resources_path("icons", "settings.svg")))
        self.edit_btn.clicked.connect(lambda: self.open_as_form_signal.emit(self))
        self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.del_btn.clicked.connect(lambda: self.delete_signal.emit(self))

    def from_model(self, regulation_group: RegulationGroup):
        self.regulation_group = regulation_group

        self.name.setText(regulation_group.name if regulation_group.name else "")
        self.short_name.setText(regulation_group.short_name if regulation_group.short_name else "")

        # Remove existing child widgets if reinitializing
        for widget in self.regulation_widgets:
            self.delete_regulation_widget(widget)
        for widget in self.proposition_widgets:
            self.delete_proposition_widget(widget)
        self.regulation_widgets = [self.add_regulation_widget(reg) for reg in regulation_group.regulations]
        self.proposition_widgets = [self.add_proposition_widget(prop) for prop in regulation_group.propositions]

    def add_regulation_widget(self, regulation: Regulation) -> RegulationWidget:
        widget = RegulationWidget(regulation=regulation, parent=self.frame)
        widget.delete_signal.connect(self.delete_regulation_widget)
        self.frame.layout().addWidget(widget)
        return widget

    def delete_regulation_widget(self, regulation_widget: RegulationWidget):
        self.frame.layout().removeWidget(regulation_widget)
        self.regulation_widgets.remove(regulation_widget)
        regulation_widget.deleteLater()

    def add_proposition_widget(self, proposition: Proposition) -> PropositionWidget:
        widget = PropositionWidget(proposition=proposition, parent=self.frame)
        widget.delete_signal.connect(self.delete_proposition_widget)
        self.frame.layout().addWidget(widget)
        return widget

    def delete_proposition_widget(self, proposition_widget: RegulationWidget):
        self.frame.layout().removeWidget(proposition_widget)
        self.proposition_widgets.remove(proposition_widget)
        proposition_widget.deleteLater()

    def set_existing_regulation_group_style(self):
        self.setStyleSheet("#frame { border: 2px solid #4b8db2; }")

    def unset_existing_regulation_group_style(self):
        self.setStyleSheet("")

    def into_model(self) -> RegulationGroup:
        return RegulationGroup(
            type_code_id=self.regulation_group.type_code_id,
            name=self.name.text(),
            short_name=None if not self.short_name.text() else self.short_name.text(),
            color_code=self.regulation_group.color_code,
            regulations=[widget.into_model() for widget in self.regulation_widgets],
            propositions=[widget.into_model() for widget in self.proposition_widgets],
            id_=self.regulation_group.id_,
        )
