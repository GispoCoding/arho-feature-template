from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtCore import pyqtSignal
from qgis.PyQt.QtWidgets import QMenu, QWidget

from arho_feature_template.core.models import Proposition, Regulation, RegulationGroup, RegulationLibrary
from arho_feature_template.gui.components.plan_proposition_widget import PropositionWidget
from arho_feature_template.gui.components.plan_regulation_widget import RegulationWidget
from arho_feature_template.project.layers.code_layers import PlanRegulationGroupTypeLayer

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QFormLayout, QFrame, QLineEdit, QPushButton

ui_path = resources.files(__package__) / "general_regulation_group_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)


class GeneralRegulationGroupWidget(QWidget, FormClass):  # type: ignore
    """A widget representation of a general regulation group."""

    # open_as_form_signal = pyqtSignal(QWidget)
    delete_signal = pyqtSignal(QWidget)

    def __init__(self, regulation_group: RegulationGroup, layer_name: str):
        super().__init__()
        self.setupUi(self)

        # TYPES
        self.frame: QFrame
        self.name: QLineEdit
        # self.edit_btn: QPushButton
        self.add_field_btn: QPushButton
        self.del_btn: QPushButton
        self.regulation_group_details_layout: QFormLayout

        # INIT
        self.regulation_widgets: list[RegulationWidget] = []
        self.proposition_widgets: list[PropositionWidget] = []

        regulation_group.type_code_id = PlanRegulationGroupTypeLayer.get_id_by_feature_layer_name(layer_name)
        self.from_model(regulation_group)

        self.verbal_regulation_config = RegulationLibrary.get_regulation_by_code("sanallinenMaarays")

        # self.edit_btn.setIcon(QIcon(resources_path("icons", "settings.svg")))
        # self.edit_btn.clicked.connect(lambda: self.open_as_form_signal.emit(self))
        add_field_menu = QMenu()
        add_field_menu.addAction("Lisää kaavamääräys").triggered.connect(self.add_new_regulation)
        add_field_menu.addAction("Lisää kaavasuositus").triggered.connect(self.add_new_proposition)
        self.add_field_btn.setMenu(add_field_menu)
        self.add_field_btn.setIcon(QgsApplication.getThemeIcon("mActionAdd.svg"))

        self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.del_btn.clicked.connect(lambda: self.delete_signal.emit(self))

    def from_model(self, regulation_group: RegulationGroup):
        self.regulation_group = regulation_group

        self.name.setText(regulation_group.name if regulation_group.name else "")

        # Remove existing child widgets if reinitializing
        for widget in self.regulation_widgets:
            self.delete_regulation_widget(widget)
        for widget in self.proposition_widgets:
            self.delete_proposition_widget(widget)
        for regulation in regulation_group.regulations:
            self.add_regulation_widget(regulation)
        for proposition in regulation_group.propositions:
            self.add_proposition_widget(proposition)

    def add_new_regulation(self):
        regulation = Regulation(self.verbal_regulation_config)
        self.add_regulation_widget(regulation)

    def add_regulation_widget(self, regulation: Regulation) -> RegulationWidget:
        widget = RegulationWidget(regulation=regulation, parent=self.frame)
        widget.delete_signal.connect(self.delete_regulation_widget)
        self.frame.layout().addWidget(widget)
        self.regulation_widgets.append(widget)
        return widget

    def delete_regulation_widget(self, regulation_widget: RegulationWidget):
        self.frame.layout().removeWidget(regulation_widget)
        self.regulation_widgets.remove(regulation_widget)
        regulation_widget.deleteLater()

    def add_new_proposition(self):
        proposition = Proposition(value="")
        self.add_proposition_widget(proposition)

    def add_proposition_widget(self, proposition: Proposition) -> PropositionWidget:
        widget = PropositionWidget(proposition=proposition, parent=self.frame)
        widget.delete_signal.connect(self.delete_proposition_widget)
        self.frame.layout().addWidget(widget)
        self.proposition_widgets.append(widget)
        return widget

    def delete_proposition_widget(self, proposition_widget: RegulationWidget):
        self.frame.layout().removeWidget(proposition_widget)
        self.proposition_widgets.remove(proposition_widget)
        proposition_widget.deleteLater()

    def into_model(self) -> RegulationGroup:
        model = RegulationGroup(
            type_code_id=self.regulation_group.type_code_id,
            name=self.name.text(),
            short_name=None,
            color_code=None,
            regulations=[widget.into_model() for widget in self.regulation_widgets],
            propositions=[widget.into_model() for widget in self.proposition_widgets],
            modified=self.regulation_group.modified,
            id_=self.regulation_group.id_,
        )
        if not model.modified and model != self.regulation_group:
            model.modified = True

        return model
