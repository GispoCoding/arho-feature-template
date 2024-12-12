from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.gui import QgsFileWidget
from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt, pyqtSignal
from qgis.PyQt.QtWidgets import (
    QFormLayout,
    QLabel,
    QLineEdit,
    QMenu,
    QToolButton,
    QWidget,
)

from arho_feature_template.core.models import Regulation, ValueType
from arho_feature_template.gui.plan_regulation_input_widgets import (
    DecimalInputWidget,
    IntegerInputWidget,
    IntegerRangeInputWidget,
    MultilineTextInputWidget,
    SinglelineTextInputWidget,
)
from arho_feature_template.project.layers.plan_layers import PlanRegulationLayer
from arho_feature_template.utils.misc_utils import get_additional_information_name, get_layer_by_name, iface

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QPushButton

ui_path = resources.files(__package__) / "plan_regulation_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)

# TO BE REPLACED
ADDITIONAL_INFORMATION_TYPES_WITH_INPUT = ["kayttotarkoituskohdistus"]
LANGUAGE = "fin"


class RegulationWidget(QWidget, FormClass):  # type: ignore
    """A widget representation of a plan regulation."""

    delete_signal = pyqtSignal(QWidget)

    def __init__(self, regulation: Regulation, parent=None):
        super().__init__(parent)
        self.setupUi(self)

        # TYPES
        self.plan_regulation_name: QLineEdit
        self.form_layout: QFormLayout
        self.add_additional_information_btn: QPushButton
        self.add_field_btn: QPushButton
        self.del_btn: QPushButton
        self.expand_hide_btn: QToolButton
        self.code_label: QLabel
        self.code: QLineEdit

        # INIT
        self.config = regulation.config
        self.regulation = regulation

        # List of widgets for hiding / showing
        self.widgets: list[tuple[QLabel, QWidget]] = []

        # For accessing correct widgets when data is sent
        self.value_widget: QWidget | None = None
        self.regulation_number_widget: IntegerInputWidget | None = None
        self.additional_information_widgets: dict[str, QWidget | None] = {}  # Key = information type, value = widget
        self.file_widgets: list[QgsFileWidget] = []
        self.theme_widget: SinglelineTextInputWidget | None = None
        self.topic_tag_widget: SinglelineTextInputWidget | None = None

        self.expanded = True
        self.plan_regulation_name.setText(self.config.name)
        self.plan_regulation_name.setReadOnly(True)
        self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.del_btn.clicked.connect(lambda: self.delete_signal.emit(self))
        self.expand_hide_btn.clicked.connect(self._on_expand_hide_btn_clicked)
        self._init_additional_information_btn()
        self._init_other_information_btn()
        self._init_widgets()

    def _init_widgets(self):
        # Value input
        value_type = self.config.value_type
        if value_type:
            self._add_value_input(value_type, self.config.unit, self.regulation.value)
            #   if self.regulation else None)

        # Additional information
        if self.regulation.additional_information:
            for info_type, info_value in self.regulation.additional_information.items():
                self._add_additional_info(info_type, info_value)

    def _add_value_input(
        self, value_type: ValueType, unit: str | None, default_value: str | float | list[int] | None = None
    ):
        base_error_msg = f"Invalid type for default value {type(default_value)}."
        if value_type in [ValueType.DECIMAL, ValueType.POSITIVE_DECIMAL]:
            if not isinstance(default_value, float) and default_value is not None:
                raise ValueError(base_error_msg)
            self._add_decimal_input(value_type, unit, default_value)
        elif value_type == ValueType.POSITIVE_INTEGER:
            if not isinstance(default_value, int) and default_value is not None:
                raise ValueError(base_error_msg)
            self._add_integer_input(value_type, unit, default_value)
        elif value_type == ValueType.POSITIVE_INTEGER_RANGE:
            if not isinstance(default_value, list) and default_value is not None:
                raise ValueError(base_error_msg)
            if isinstance(default_value, list) and len(default_value) != 2:  # noqa: PLR2004
                error_msg = f"Invalid number of values in default value {type(default_value)}."
                raise ValueError(error_msg)
            self._add_integer_range_input(value_type, unit, default_value)
        elif value_type == ValueType.VERSIONED_TEXT:
            if not isinstance(default_value, str) and default_value is not None:
                raise ValueError(base_error_msg)
            self._add_versioned_text_input(default_value)
        else:
            msg = f"Invalid input value type for plan regulation: {value_type}"
            raise ValueError(msg)

    def _init_additional_information_btn(self):
        informations_dict: dict[str, QMenu] = {}
        add_later: dict[str, list[str]] = {}

        def _add_action(informations_dict: dict[str, QMenu], parent_id: str, info_type: str):
            action = informations_dict[parent_id].addAction(info_type)
            action.triggered.connect(lambda _: self._add_additional_info(info_type))

        # Iterate code layer and build menus
        for feature in get_layer_by_name("Lisätiedonlaji").getFeatures():
            if feature["level"] == 1:
                menu = QMenu(feature["name"][LANGUAGE], self)
                informations_dict[feature["id"]] = menu
            else:
                parent_id = feature["parent_id"]
                info_type = feature["name"][LANGUAGE]
                if parent_id in informations_dict:
                    _add_action(informations_dict, parent_id, info_type)
                else:
                    if parent_id not in add_later:
                        add_later[parent_id] = []
                    add_later[parent_id].append(info_type)
        for parent_id, additional_information_types in add_later.items():
            for info_type in additional_information_types:
                _add_action(informations_dict, parent_id, info_type)

        # Create main menu for btn and add submenus
        additional_information_type_menu = QMenu(self)
        for menu in informations_dict.values():
            additional_information_type_menu.addMenu(menu)
        self.add_additional_information_btn.setMenu(additional_information_type_menu)
        self.add_additional_information_btn.setIcon(QgsApplication.getThemeIcon("mActionPropertiesWidget.svg"))

    def _init_other_information_btn(self):
        add_field_menu = QMenu(self)
        add_field_menu.addAction("Määräysnumero").triggered.connect(self._add_regulation_number)
        add_field_menu.addAction("Liiteasiakirja").triggered.connect(self._add_file)
        add_field_menu.addAction("Aihetunniste").triggered.connect(self._add_topic_tag)

        theme_menu = QMenu("Kaavoitusteema", self)
        for feature in get_layer_by_name("Kaavoitusteemat").getFeatures():
            name = feature["name"][LANGUAGE]
            action = theme_menu.addAction(name)
            action.triggered.connect(lambda _, name=name: self._add_theme(name))
        add_field_menu.addMenu(theme_menu)

        self.add_field_btn.setMenu(add_field_menu)
        self.add_field_btn.setIcon(QgsApplication.getThemeIcon("mActionAdd.svg"))

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

    def _add_widgets(self, label: QLabel, widget: QWidget):
        self.form_layout.addRow(label, widget)
        self.widgets.append((label, widget))
        if not self.expanded:
            self._on_expand_hide_btn_clicked()

    def _add_decimal_input(self, value_type: ValueType, unit: str | None, default_value: float | None = None):
        positive = value_type == ValueType.POSITIVE_DECIMAL
        self.value_widget = DecimalInputWidget(default_value, unit, positive)
        self._add_widgets(QLabel("Arvo"), self.value_widget)

    def _add_integer_input(self, value_type: ValueType, unit: str | None, default_value: int | None = None):
        positive = value_type == ValueType.POSITIVE_INTEGER
        self.value_widget = IntegerInputWidget(default_value=default_value, unit=unit, positive=positive)
        self._add_widgets(QLabel("Arvo"), self.value_widget)

    def _add_integer_range_input(
        self, value_type: ValueType, unit: str | None, default_value: tuple[int, int] | list[int] | None = None
    ):
        # NOTE: There is no ValueType.INTEGER_RANGE currently, so is always positive
        positive = value_type == ValueType.POSITIVE_INTEGER_RANGE
        self.value_widget = IntegerRangeInputWidget(default_value, unit, positive)
        self._add_widgets(QLabel("Arvo"), self.value_widget)

    def _add_versioned_text_input(self, default_value: str | None = None):
        self.value_widget = MultilineTextInputWidget(default_value=default_value, editable=False)
        self._add_widgets(QLabel("Arvo"), self.value_widget)

    def _add_additional_info(self, info_type: str, default_value: str | float | None = None):
        # TODO: Extend and make sure all additional information types are properly handled

        # NOTE: Now info type is the name / readable version when this is triggered by user
        # Might need to refactor this later..
        name = get_additional_information_name(info_type)
        self._add_widgets(QLabel("Lisätiedonlaji"), SinglelineTextInputWidget(name, False))

        # NOTE: Does not support multiple instances of same additional information kind,
        # for example if multiple Käyttötarkoituskohdistus are added, they overwrite each other
        value_widget = None
        if name == "Käyttötarkoituskohdistus":
            if isinstance(default_value, float):
                iface.messageBar().pushWarning("Warning: ", f"Unexpected value type for {name}: float")
            else:
                value_widget = SinglelineTextInputWidget(default_value, True)
                self._add_widgets(QLabel(name), value_widget)

        self.additional_information_widgets[info_type] = value_widget

    def _add_regulation_number(self):
        if not self.regulation_number_widget:
            self.regulation_number_widget = IntegerInputWidget(None, None, True)
            self._add_widgets(QLabel("Määräysnumero"), self.regulation_number_widget)

    def _add_file(self):
        widget = QgsFileWidget()
        self._add_widgets(QLabel("Liiteasiakirja"), widget)
        self.file_widgets.append(widget)

    def _add_topic_tag(self):
        self.topic_tag_widget = SinglelineTextInputWidget(None, True)
        self._add_widgets(QLabel("Aihetunniste"), self.topic_tag_widget)

    def _add_theme(self, theme_name: str):
        self.theme_widget = SinglelineTextInputWidget(theme_name, False)
        self._add_widgets(QLabel("Kaavoitusteema"), self.theme_widget)

    # Or e.g. "into_regulation"
    def into_model(self) -> Regulation:
        return Regulation(
            config=self.config,
            value=self.value_widget.get_value() if self.value_widget else None,
            regulation_number=self.regulation_number_widget.get_value() if self.regulation_number_widget else None,
            additional_information={
                name: widget.get_value() for name, widget in self.additional_information_widgets.items() if widget
            },
            files=[file.filePath() for file in self.file_widgets],
            theme=self.theme_widget.get_value() if self.theme_widget else None,
            topic_tag=self.topic_tag_widget.get_value() if self.topic_tag_widget else None,
            id_=self.regulation.id_,
        )

    def save_data(self, regulation_group_id: int | None) -> Regulation:
        model = self.into_model()
        regulation_feature = PlanRegulationLayer.feat_from_model(model, regulation_group_id)
        layer = PlanRegulationLayer.get_from_project()
        if model.id_ is None:
            layer.addFeature(regulation_feature)
        else:
            layer.updateFeature(regulation_feature)

        return model
