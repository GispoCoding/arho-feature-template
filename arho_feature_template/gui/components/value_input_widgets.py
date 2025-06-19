from __future__ import annotations

import logging

from qgis.core import QgsApplication
from qgis.gui import QgsDoubleSpinBox, QgsSpinBox
from qgis.PyQt.QtWidgets import (
    QFormLayout,
    QHBoxLayout,
    QLabel,
    QLineEdit,
    QPushButton,
    QSizePolicy,
    QTextEdit,
    QWidget,
)

from arho_feature_template.core.models import AttributeValue, AttributeValueDataType
from arho_feature_template.gui.components.code_combobox import HierarchicalCodeComboBox
from arho_feature_template.project.layers.code_layers import LegalEffectsLayer, VerbalRegulationType

logger = logging.getLogger(__name__)


def initialize_numeric_input_widget(
    widget: QgsSpinBox | QgsDoubleSpinBox,
    default_value: float | None,
    unit: str | None,
    positive: bool,  # noqa: FBT001
):
    if unit:
        widget.setSuffix(f" {unit}")

    if positive:
        widget.setMinimum(0)
    else:
        widget.setMinimum(-99999999999)

    widget.setMaximum(99999999999)

    if default_value:
        widget.setValue(default_value)

    widget.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Fixed)


def initialize_text_input_widget(
    widget: QTextEdit | QLineEdit,
    default_value: str | None,
    editable: bool,  # noqa: FBT001
):
    if default_value:
        widget.setText(default_value)

    if not editable:
        widget.setReadOnly(True)


class DecimalInputWidget(QgsDoubleSpinBox):
    def __init__(
        self,
        default_value: float | None = None,
        unit: str | None = None,
        positive: bool = False,  # noqa: FBT001, FBT002
    ):
        super().__init__()
        self.unit = unit
        initialize_numeric_input_widget(self, default_value, unit, positive)

    def get_value(self) -> float:
        return self.value()


class IntegerInputWidget(QgsSpinBox):
    def __init__(
        self,
        default_value: int | None = None,
        unit: str | None = None,
        positive: bool = False,  # noqa: FBT001, FBT002
    ):
        super().__init__()
        self.unit = unit
        initialize_numeric_input_widget(self, default_value, unit, positive)

    def get_value(self) -> int:
        return self.value()


class IntegerRangeInputWidget(QWidget):
    def __init__(
        self,
        range_min: int | None = None,
        range_max: int | None = None,
        unit: str | None = None,
        positive: bool = False,  # noqa: FBT001, FBT002
    ):
        super().__init__()

        self.min_widget = IntegerInputWidget(range_min, unit, positive)
        self.max_widget = IntegerInputWidget(range_max, unit, positive)
        layout = QHBoxLayout()
        layout.addWidget(self.min_widget)
        layout.addWidget(QLabel("-"))
        layout.addWidget(self.max_widget)
        self.setLayout(layout)

    def get_value(self) -> tuple[int, int]:
        return (self.min_widget.get_value(), self.max_widget.get_value())


class SinglelineTextInputWidget(QLineEdit):
    def __init__(
        self,
        default_value: str | None = None,
        editable: bool = False,  # noqa: FBT001, FBT002
    ):
        super().__init__()
        initialize_text_input_widget(self, default_value, editable)

    def get_value(self) -> str | None:
        return self.text() if self.text() else None


class MultilineTextInputWidget(QTextEdit):
    def __init__(
        self,
        default_value: str | None = None,
        editable: bool = True,  # noqa: FBT001, FBT002
    ):
        super().__init__()
        initialize_text_input_widget(self, default_value, editable)
        self.setMaximumHeight(75)

    def get_value(self) -> str | None:
        text = self.toPlainText()
        return text if text else None


class CodeInputWidget(QWidget):
    def __init__(self, title: str | None = None, code_list: str | None = None, code_value: str | None = None):
        super().__init__()

        self.title_widget = SinglelineTextInputWidget(default_value=title, editable=True)
        self.code_list_widget = SinglelineTextInputWidget(default_value=code_list, editable=True)
        self.code_value_widget = SinglelineTextInputWidget(default_value=code_value, editable=True)

        layout = QFormLayout()
        layout.addRow("Otsikko:", self.title_widget)
        layout.addRow("Koodisto:", self.code_list_widget)
        layout.addRow('<span style="color: red;">*</span> Koodiarvo:', self.code_value_widget)
        self.setLayout(layout)

    def get_value(self) -> tuple[str | None, str | None, str | None]:
        title = self.title_widget.get_value()
        code_list = self.code_list_widget.get_value()
        code_value = self.code_value_widget.get_value()
        return (title if title else None, code_list if code_list else None, code_value if code_value else None)


class TypeOfVerbalRegulationWidget(QWidget):
    def __init__(
        self,
        with_add_btn: bool = False,  # noqa: FBT001, FBT002
        with_del_btn: bool = False,  # noqa: FBT001, FBT002
        parent=None,
    ):
        super().__init__(parent)

        layout = QHBoxLayout()
        layout.setContentsMargins(0, 0, 0, 0)
        self.input_widget = HierarchicalCodeComboBox()
        self.input_widget.populate_from_code_layer(VerbalRegulationType)
        layout.addWidget(self.input_widget)

        self.add_btn: QPushButton | None = None
        if with_add_btn:
            self.add_btn = QPushButton()
            self.add_btn.setMaximumWidth(30)
            self.add_btn.setIcon(QgsApplication.getThemeIcon("mActionAdd.svg"))
            layout.addWidget(self.add_btn)

        self.del_btn: QPushButton | None = None
        if with_del_btn:
            self.del_btn = QPushButton()
            self.del_btn.setMaximumWidth(30)
            self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
            layout.addWidget(self.del_btn)

        self.setLayout(layout)

    def set_value(self, value: str | None):
        self.input_widget.set_value(value)

    def get_value(self) -> str | None:
        return self.input_widget.value()


class LegalEffectWidget(QWidget):
    def __init__(
        self,
        with_add_btn: bool = False,  # noqa: FBT001, FBT002
        with_del_btn: bool = False,  # noqa: FBT001, FBT002
        parent=None,
    ):
        super().__init__(parent)

        layout = QHBoxLayout()
        layout.setContentsMargins(0, 0, 0, 0)
        self.input_widget = HierarchicalCodeComboBox()
        self.input_widget.populate_from_code_layer(LegalEffectsLayer)
        layout.addWidget(self.input_widget)

        self.add_btn: QPushButton | None = None
        if with_add_btn:
            self.add_btn = QPushButton()
            self.add_btn.setMaximumWidth(30)
            self.add_btn.setIcon(QgsApplication.getThemeIcon("mActionAdd.svg"))
            layout.addWidget(self.add_btn)

        self.del_btn: QPushButton | None = None
        if with_del_btn:
            self.del_btn = QPushButton()
            self.del_btn.setMaximumWidth(30)
            self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
            layout.addWidget(self.del_btn)

        self.setLayout(layout)

    def set_value(self, value: str | None):
        self.input_widget.set_value(value)

    def get_value(self) -> str | None:
        return self.input_widget.value()


class ValueWidgetManager:
    def __init__(self, value: AttributeValue | None, default_value: AttributeValue):
        if value is None:
            value = AttributeValue()
        self.value_data_type = default_value.value_data_type
        self.unit = default_value.unit
        self.default_value = default_value

        self.value_widget: QWidget | None = None

        if self.value_data_type in (AttributeValueDataType.DECIMAL, AttributeValueDataType.POSITIVE_DECIMAL):
            positive = self.value_data_type == AttributeValueDataType.POSITIVE_DECIMAL
            self.value_widget = DecimalInputWidget(
                value.numeric_value or default_value.numeric_value, self.unit, positive
            )

        elif self.value_data_type in (AttributeValueDataType.NUMERIC, AttributeValueDataType.POSITIVE_NUMERIC):
            positive = self.value_data_type == AttributeValueDataType.POSITIVE_NUMERIC
            numeric_value = value.numeric_value or default_value.numeric_value
            self.value_widget = IntegerInputWidget(
                default_value=int(numeric_value) if numeric_value is not None else None,
                unit=self.unit,
                positive=positive,
            )

        elif self.value_data_type in (
            AttributeValueDataType.NUMERIC_RANGE,
            AttributeValueDataType.POSITIVE_NUMERIC_RANGE,
        ):
            positive = self.value_data_type == AttributeValueDataType.POSITIVE_NUMERIC_RANGE

            value_min = value.numeric_range_min or default_value.numeric_range_min
            value_max = value.numeric_range_max or default_value.numeric_range_max
            self.value_widget = IntegerRangeInputWidget(
                int(value_min) if value_min is not None else None,
                int(value_max) if value_max is not None else None,
                self.unit,
                positive,
            )

        elif self.value_data_type == AttributeValueDataType.LOCALIZED_TEXT:
            text_value = value.text_value or default_value.text_value
            self.value_widget = MultilineTextInputWidget(default_value=text_value, editable=True)

        elif self.value_data_type == AttributeValueDataType.CODE:
            self.value_widget = CodeInputWidget(
                value.code_title or default_value.code_title,
                value.code_list or default_value.code_list,
                value.code_value or default_value.code_value,
            )

        else:
            logger.warning("No value input implemented for data type: %s", default_value.value_data_type)

    def into_model(self) -> AttributeValue:
        if self.value_data_type in (
            AttributeValueDataType.DECIMAL,
            AttributeValueDataType.POSITIVE_DECIMAL,
            AttributeValueDataType.NUMERIC,
            AttributeValueDataType.POSITIVE_NUMERIC,
        ):
            return AttributeValue(
                value_data_type=self.value_data_type,
                numeric_value=self.value_widget.get_value() if self.value_widget else None,
                unit=self.unit,
            )

        if self.value_data_type in (
            AttributeValueDataType.NUMERIC_RANGE,
            AttributeValueDataType.POSITIVE_NUMERIC_RANGE,
        ):
            range_min, range_max = self.value_widget.get_value() if self.value_widget else (None, None)
            return AttributeValue(
                value_data_type=self.value_data_type,
                numeric_range_min=range_min,
                numeric_range_max=range_max,
                unit=self.unit,
            )

        if self.value_data_type == AttributeValueDataType.LOCALIZED_TEXT:
            return AttributeValue(
                value_data_type=self.value_data_type,
                text_value=self.value_widget.toPlainText() if self.value_widget else None,
                text_syntax=None,
            )

        if self.value_data_type == AttributeValueDataType.CODE:
            title, code_list, code_value = self.value_widget.get_value() if self.value_widget else (None, None, None)
            return AttributeValue(
                value_data_type=self.value_data_type, code_title=title, code_list=code_list, code_value=code_value
            )

        return AttributeValue()
