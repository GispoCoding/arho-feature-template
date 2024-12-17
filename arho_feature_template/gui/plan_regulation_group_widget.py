from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtCore import pyqtSignal
from qgis.PyQt.QtWidgets import QWidget

from arho_feature_template.core.models import Regulation, RegulationGroup
from arho_feature_template.gui.plan_regulation_widget import RegulationWidget
from arho_feature_template.project.layers.code_layers import PlanRegulationGroupTypeLayer

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QFormLayout, QFrame, QLabel, QLineEdit, QPushButton

    from arho_feature_template.gui.code_combobox import CodeComboBox

ui_path = resources.files(__package__) / "plan_regulation_group_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)


class RegulationGroupWidget(QWidget, FormClass):  # type: ignore
    """A widget representation of a plan regulation group."""

    delete_signal = pyqtSignal(QWidget)

    def __init__(
        self,
        regulation_group_data: RegulationGroup,
        general_regulation: bool = False,  # noqa: FBT001, FBT002
    ):
        super().__init__()
        self.setupUi(self)

        # TYPES
        self.frame: QFrame
        self.name: QLineEdit
        self.short_name: QLineEdit
        self.short_name_label: QLabel
        self.del_btn: QPushButton
        self.type_of_regulation_group_label: QLabel
        self.type_of_regulation_group: CodeComboBox
        self.regulation_group_details_layout: QFormLayout
        # NOTE: Maybe user input is not needed and wanted for type of plan regulation group and it would be defined
        # by the plan feature directly (and hidden from user)

        # INIT
        self.is_general_regulation = general_regulation
        self.regulation_group_data = regulation_group_data
        self.regulation_widgets: list[RegulationWidget] = [
            self.add_regulation_widget(regulation) for regulation in self.regulation_group_data.regulations
        ]

        # If regulation group type code is defined, delete selection for user
        if self.is_general_regulation:
            regulation_group_data.type_code_id = PlanRegulationGroupTypeLayer.get_id_of_regulation_type(
                "generalRegulations"
            )
            # Remove short name row
            self.regulation_group_details_layout.removeWidget(self.short_name_label)
            self.regulation_group_details_layout.removeWidget(self.short_name)
            self.short_name_label.deleteLater()
            self.short_name.deleteLater()

        if regulation_group_data.type_code_id:
            # Remove type of plan regulation group row
            self.regulation_group_details_layout.removeWidget(self.type_of_regulation_group_label)
            self.regulation_group_details_layout.removeWidget(self.type_of_regulation_group)
            self.type_of_regulation_group_label.deleteLater()
            self.type_of_regulation_group.deleteLater()
        else:
            self.type_of_regulation_group.populate_from_code_layer(PlanRegulationGroupTypeLayer)
            self.type_of_regulation_group.removeItem(0)  # Remove NULL from combobox as underground data is required

        self.name.setText(self.regulation_group_data.name if self.regulation_group_data.name else "")
        self.short_name.setText(self.regulation_group_data.short_name if self.regulation_group_data.short_name else "")
        self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.del_btn.clicked.connect(lambda: self.delete_signal.emit(self))

    def add_regulation_widget(self, regulation: Regulation) -> RegulationWidget:
        widget = RegulationWidget(regulation=regulation, parent=self.frame)
        widget.delete_signal.connect(self.delete_regulation_widget)
        self.frame.layout().addWidget(widget)
        return widget

    def delete_regulation_widget(self, regulation_widget: RegulationWidget):
        self.frame.layout().removeWidget(regulation_widget)
        self.regulation_widgets.remove(regulation_widget)
        regulation_widget.deleteLater()

    def into_model(self) -> RegulationGroup:
        return RegulationGroup(
            type_code_id=self.regulation_group_data.type_code_id
            if self.regulation_group_data.type_code_id
            else self.type_of_regulation_group.value(),
            name=self.name.text(),
            short_name=None if self.is_general_regulation else self.short_name.text(),
            color_code=self.regulation_group_data.color_code,
            regulations=[widget.into_model() for widget in self.regulation_widgets],
            id_=self.regulation_group_data.id_,
        )
