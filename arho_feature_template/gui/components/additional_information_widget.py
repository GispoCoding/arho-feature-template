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
        self.config = self.additional_information.config
        self.additional_info.setText(additional_information.config.name)

        self.value_widget_manager: ValueWidgetManager | None = None

        if self.config and self.config.default_value:
            self.value_widget_manager = ValueWidgetManager(self.additional_information.value, self.config.default_value)
            widget = (
                self.value_widget_manager.value_widget
                if self.value_widget_manager.value_widget is not None
                else QLabel("Syötekenttää tälle tyypille ei ole vielä toteutettu")
            )
            self.layout().addWidget(widget)

    def into_model(self) -> AdditionalInformation:
        model = AdditionalInformation(
            config=self.config,
            id_=self.additional_information.id_,
            plan_regulation_id=self.additional_information.plan_regulation_id,
            type_additional_information_id=self.additional_information.type_additional_information_id,
            modified=self.additional_information.modified,
            value=self.value_widget_manager.into_model() if self.value_widget_manager else None,
        )
        if not model.modified and model != self.additional_information:
            model.modified = True

        return model
