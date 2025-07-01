from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtCore import pyqtSignal
from qgis.PyQt.QtWidgets import QLabel, QLineEdit, QWidget

from arho_feature_template.core.models import AdditionalInformation
from arho_feature_template.gui.components.value_input_widgets import (
    ValueWidgetManager,
)
from arho_feature_template.project.layers.code_layers import AdditionalInformationTypeLayer
from arho_feature_template.utils.misc_utils import deserialize_localized_text

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QPushButton

ui_path = resources.files(__package__) / "additional_information_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)


class AdditionalInformationWidget(QWidget, FormClass):  # type: ignore
    """A widget representation of an additional information of plan regulation."""

    delete_signal = pyqtSignal(QWidget)

    def __init__(self, additional_information: AdditionalInformation, parent=None):
        super().__init__(parent)
        self.setupUi(self)

        # TYPES
        self.additional_info: QLineEdit
        self.del_btn: QPushButton

        # INIT
        self.from_model(additional_information)

        self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.del_btn.clicked.connect(lambda: self.delete_signal.emit(self))

    def from_model(self, additional_information: AdditionalInformation):
        self.additional_information = additional_information
        text = AdditionalInformationTypeLayer.get_name_by_id(additional_information.additional_information_type_id)
        if isinstance(text, dict):
            text = deserialize_localized_text(text)
        self.additional_info.setText(text)

        self.value_widget_manager: ValueWidgetManager | None = None

        default_value = AdditionalInformationTypeLayer.get_default_value_by_id(
            additional_information.additional_information_type_id
        )
        if default_value:
            self.value_widget_manager = ValueWidgetManager(self.additional_information.value, default_value)
            widget = (
                self.value_widget_manager.value_widget
                if self.value_widget_manager.value_widget is not None
                else QLabel("Syötekenttää tälle tyypille ei ole vielä toteutettu")
            )
            self.layout().addWidget(widget)

    def into_model(self) -> AdditionalInformation:
        model = AdditionalInformation(
            additional_information_type_id=self.additional_information.additional_information_type_id,
            id_=self.additional_information.id_,
            plan_regulation_id=self.additional_information.plan_regulation_id,
            modified=self.additional_information.modified,
            value=self.value_widget_manager.into_model() if self.value_widget_manager else None,
        )
        if not model.modified and model != self.additional_information:
            model.modified = True

        return model
