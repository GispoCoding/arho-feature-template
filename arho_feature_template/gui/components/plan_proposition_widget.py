from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt, pyqtSignal
from qgis.PyQt.QtWidgets import QFormLayout, QLabel, QMenu, QTextEdit, QToolButton, QWidget

from arho_feature_template.core.models import Proposition
from arho_feature_template.gui.components.code_combobox import CodeComboBox
from arho_feature_template.gui.components.value_input_widgets import IntegerInputWidget
from arho_feature_template.project.layers.code_layers import PlanThemeLayer

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QPushButton

ui_path = resources.files(__package__) / "plan_proposition_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)


class PropositionWidget(QWidget, FormClass):  # type: ignore
    """A widget representation of a plan proposition."""

    delete_signal = pyqtSignal(QWidget)

    def __init__(self, proposition: Proposition, parent=None):
        super().__init__(parent)
        self.setupUi(self)

        # TYPES
        self.value_label: QLabel
        self.text_input: QTextEdit
        self.add_field_btn: QPushButton
        self.del_btn: QPushButton
        self.form_layout: QFormLayout
        self.expand_hide_btn: QToolButton

        # INIT
        self.proposition = proposition
        self.proposition_number_widget: IntegerInputWidget | None = None
        self.theme_widget: CodeComboBox | None = None

        # List of widgets for hiding / showing
        self.widgets: list[tuple[QLabel, QWidget]] = [(self.value_label, self.text_input)]

        add_field_menu = QMenu(self)
        add_field_menu.addAction("Suositusnumero").triggered.connect(self._add_proposition_number)
        add_field_menu.addAction("Kaavoitusteema").triggered.connect(self._add_theme)
        self.add_field_btn.setMenu(add_field_menu)
        self.add_field_btn.setIcon(QgsApplication.getThemeIcon("mActionAdd.svg"))

        self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.del_btn.clicked.connect(lambda: self.delete_signal.emit(self))

        self.expanded = True
        self.expand_hide_btn.clicked.connect(self._on_expand_hide_btn_clicked)

        # self.name.setText(proposition.name)
        self.text_input.setText(proposition.value)
        if proposition.theme_id:
            self._add_theme(proposition.theme_id)
        if proposition.proposition_number:
            self._add_proposition_number(proposition.proposition_number)

    def _add_widgets(self, label: QLabel, widget: QWidget):
        self.form_layout.addRow(label, widget)
        self.widgets.append((label, widget))
        if not self.expanded:
            self._on_expand_hide_btn_clicked()

    def _add_proposition_number(self, default_value: int | None = None):
        if not self.proposition_number_widget:
            self.proposition_number_widget = IntegerInputWidget(default_value, None, True)
            self._add_widgets(QLabel("Suositusnumero"), self.proposition_number_widget)

    def _add_theme(self, default_value: str | None = None):
        if not self.theme_widget:
            self.theme_widget = CodeComboBox()
            self.theme_widget.populate_from_code_layer(PlanThemeLayer)
            if default_value:
                self.theme_widget.set_value(default_value)
            self._add_widgets(QLabel("Kaavoitusteema"), self.theme_widget)

    def _on_expand_hide_btn_clicked(self):
        if self.expanded:
            for label, value_widget in self.widgets:
                self.form_layout.removeWidget(label)
                label.hide()
                self.form_layout.removeWidget(value_widget)
                value_widget.hide()
            self.expand_hide_btn.setArrowType(Qt.ArrowType.DownArrow)
            self.expanded = False
        else:
            for label, value_widget in self.widgets:
                self.form_layout.addRow(label, value_widget)
                label.show()
                value_widget.show()
            self.expand_hide_btn.setArrowType(Qt.ArrowType.UpArrow)
            self.expanded = True

    def into_model(self) -> Proposition:
        model = Proposition(
            regulation_group_id=self.proposition.regulation_group_id,
            value=self.text_input.toPlainText(),
            theme_id=self.theme_widget.value() if self.theme_widget else None,
            proposition_number=self.proposition_number_widget.get_value() if self.proposition_number_widget else None,
            modified=self.proposition.modified,
            id_=self.proposition.id_,
        )
        if not model.modified and model != self.proposition:
            model.modified = True

        return model
