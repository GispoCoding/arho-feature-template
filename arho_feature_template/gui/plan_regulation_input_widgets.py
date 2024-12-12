from __future__ import annotations

from qgis.gui import QgsDoubleSpinBox, QgsSpinBox
from qgis.PyQt.QtWidgets import QHBoxLayout, QLineEdit, QSizePolicy, QTextEdit, QWidget


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
        widget.setMinimum(-9999)

    if default_value:
        widget.setValue(default_value)

    widget.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Fixed)


def initialize_text_input_widget(
    widget: QTextEdit | QLineEdit,
    default_value: str | None,
    editable: bool,  # noqa: FBT001
):
    if default_value:
        widget.setText(str(default_value))

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
        default_value: tuple[int, int] | list[int] | None = None,
        unit: str | None = None,
        positive: bool = False,  # noqa: FBT001, FBT002
    ):
        super().__init__()
        if isinstance(default_value, list):
            default_value = (default_value[0], default_value[1])
        self.min_widget = IntegerInputWidget(default_value[0] if default_value else None, unit, positive)
        self.max_widget = IntegerInputWidget(default_value[1] if default_value else None, unit, positive)
        layout = QHBoxLayout()
        layout.addWidget(self.min_widget)
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

    def get_value(self) -> str | None:
        return self.toPlainText() if self.toPlainText() else None
