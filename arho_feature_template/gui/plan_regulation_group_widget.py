from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtCore import pyqtSignal
from qgis.PyQt.QtWidgets import QWidget

from arho_feature_template.gui.plan_regulation_widget import RegulationWidget
from arho_feature_template.core.models import Regulation, RegulationGroup
from arho_feature_template.project.layers.plan_layers import RegulationGroupLayer

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QFrame, QLineEdit, QPushButton

ui_path = resources.files(__package__) / "plan_regulation_group_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)


class RegulationGroupWidget(QWidget, FormClass):  # type: ignore
    """A widget representation of a plan regulation group."""

    delete_signal = pyqtSignal(QWidget)

    def __init__(self, regulation_group_data: RegulationGroup):
        super().__init__()
        self.setupUi(self)

        # TYPES
        self.frame: QFrame
        self.name: QLineEdit  # "heading"
        self.del_btn: QPushButton

        # INIT
        self.regulation_group_data = regulation_group_data
        self.regulation_widgets: list[RegulationWidget] = [
            self.add_regulation_widget(regulation) for regulation in self.regulation_group_data.regulations
        ]
        self.name.setText(self.regulation_group_data.name)
        self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.del_btn.clicked.connect(lambda: self.delete_signal.emit(self))
 
    def add_regulation_widget(self, regulation: Regulation) -> RegulationWidget:
        widget = RegulationWidget(regulation_data=regulation, parent=self.frame)
        widget.delete_signal.connect(self.delete_regulation_widget)
        self.frame.layout().addWidget(widget)
        return widget

    def delete_regulation_widget(self, regulation_widget: RegulationWidget):
        self.frame.layout().removeWidget(regulation_widget)
        self.regulation_widgets.remove(regulation_widget)
        regulation_widget.deleteLater()

    def into_model(self, id: str) -> RegulationGroup:
        return RegulationGroup(
            type_code=self.regulation_group_data.type_code,
            name=self.name.text(),
            short_name=self.regulation_group_data.short_name,
            color_code=self.regulation_group_data.color_code,
            letter_code=self.regulation_group_data.letter_code,
            plan_regulations=[widget.save_data(id) for widget in self.regulation_widgets],
            id_=id
        )

    def save_data(self):
        if not self.regulation_group_data.id_:
            new_feature = True
            id_ = "new_id_here"  # TODO
        else:
            new_feature = False
            id_ = self.regulation_group_data.id_

        model = self.into_model(id_)
        regulation_feature = RegulationGroupLayer.feature_from_model(model)
        layer = RegulationGroupLayer.get_from_project()
        if new_feature:
            layer.addFeature(regulation_feature)
        else:
            layer.updateFeature(regulation_feature)
