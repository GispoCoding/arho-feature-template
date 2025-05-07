from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtCore import pyqtSignal
from qgis.PyQt.QtWidgets import (
    QFormLayout,
    QLabel,
    QLineEdit,
    QWidget,
)

from arho_feature_template.core.models import AdditionalInformation, AttributeValue
from arho_feature_template.gui.components.required_field_label import RequiredFieldLabel
from arho_feature_template.gui.components.value_input_widgets import (
    ValueWidgetManager,
)

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QPushButton

ui_path = resources.files(__package__) / "additional_information_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)


class AdditionalInformationWidget(QWidget, FormClass):  # type: ignore
    """A widget representation of a plan regulation."""

    # TYPES
    type_of_additional_information_name: QLineEdit
    form_layout: QFormLayout
    del_btn: QPushButton

    delete_signal = pyqtSignal(QWidget)

    def __init__(self, additional_information: AdditionalInformation, parent=None):
        super().__init__(parent)
        self.setupUi(self)

        # INIT
        self.config = additional_information.config
        self.additional_information = additional_information

        self.value_widget_manager = (
            ValueWidgetManager(
                self.additional_information.value,
                self.config.default_value,
            )
            if self.config and self.config.default_value
            else None
        )

        # List of widgets for hiding / showing
        self.widgets: list[tuple[QLabel, QWidget]] = []

        self.type_of_additional_information_name.setText(self.config.name)
        self.type_of_additional_information_name.setReadOnly(True)
        self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.del_btn.clicked.connect(lambda: self.delete_signal.emit(self))

        if self.value_widget_manager is not None:
            widget = (
                self.value_widget_manager.value_widget
                if self.value_widget_manager.value_widget is not None
                else QLabel("Syötekenttää tälle tyypille ei ole vielä toteutettu")
            )
            self._add_widget(RequiredFieldLabel("Arvo:"), widget)

    def _add_widget(self, label: QLabel, widget: QWidget):
        self.form_layout.addRow(label, widget)
        self.widgets.append((label, widget))

    def into_model(self) -> AdditionalInformation:
        model = AdditionalInformation(
            config=self.config,
            id_=self.additional_information.id_,
            plan_regulation_id=self.additional_information.plan_regulation_id,
            type_additional_information_id=self.additional_information.type_additional_information_id,
            modified=self.additional_information.modified,
            value=self.value_widget_manager.into_model() if self.value_widget_manager else AttributeValue(),
        )
        if not model.modified and model != self.additional_information:
            model.modified = True

        return model
