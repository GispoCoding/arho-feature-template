from qgis.PyQt.QtWidgets import QWidget, QLineEdit, QTextEdit, QLineEdit, QSizePolicy
from qgis.gui import QgsSpinBox, QgsDoubleSpinBox

from numbers import Number


def initialize_numeric_input_widget(
    widget: QgsSpinBox | QgsDoubleSpinBox, default_value: Number | None, unit: str | None, positive: bool
):
    if unit:
        widget.setSuffix(f" {unit}")

    if positive:
        widget.setMinimum(0)
    else:
        widget.setMinimum(-9999)

    if default_value:
        widget.setValue(default_value)

    widget.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Fixed)


def initialize_text_input_widget(widget: QTextEdit | QLineEdit, default_value: str | None, editable: bool):
    if default_value:
        widget.setText(str(default_value))

    if not editable:
        widget.setReadOnly(True)


class DecimalInputWidget(QgsSpinBox):
    def __init__(self, default_value: float | None = None, unit: str | None = None, positive: bool = False):
        super().__init__()
        self.unit = unit
        initialize_numeric_input_widget(self, default_value, unit, positive)

    def get_value(self) -> float:
        return self.value()


class IntegerInputWidget(QgsDoubleSpinBox):
    def __init__(self, default_value: int | None = None, unit: str | None = None, positive: bool = False):
        super().__init__()
        self.unit = unit
        initialize_numeric_input_widget(self, default_value, unit, positive)

    def get_value(self) -> int:
        return self.value()


class IntegerRangeInputWidget(QWidget):
    def __init__(
        self, default_value: tuple[int, int] | None = None, unit: str | None = None, positive: bool = False
    ):
        super().__init__()
        self.min_widget = IntegerInputWidget(default_value[0], unit, positive)
        self.max_widget = IntegerInputWidget(default_value[1], unit, positive)

    def get_value(self) -> tuple[int, int]:
        return (self.min_widget.get_value(), self.max_widget.get_value())


class SinglelineTextInputWidget(QLineEdit):
    def __init__(self, default_value: str | None = None, editable: bool = False):
        super().__init__()
        initialize_text_input_widget(self, default_value, editable)

    def get_value(self) -> str | None:
        return self.text() if self.text() else None


class MultilineTextInputWidget(QTextEdit):
    def __init__(self, default_value: str | None = None, editable: bool = True):
        super().__init__()
        initialize_text_input_widget(self, default_value, editable)

    def get_value(self) -> str | None:
        return self.toPlainText() if self.toPlainText() else None
