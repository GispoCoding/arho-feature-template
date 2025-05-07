from __future__ import annotations

from importlib import resources
from typing import cast

from qgis.core import QgsApplication
from qgis.gui import QgsFileWidget
from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt, pyqtSignal
from qgis.PyQt.QtWidgets import (
    QFormLayout,
    QFrame,
    QLabel,
    QLineEdit,
    QMenu,
    QPushButton,
    QToolButton,
    QVBoxLayout,
    QWidget,
)

from arho_feature_template.core.models import (
    AdditionalInformation,
    AdditionalInformationConfigLibrary,
    AttributeValue,
    Regulation,
)
from arho_feature_template.gui.components.additional_information_widget import AdditionalInformationWidget
from arho_feature_template.gui.components.required_field_label import RequiredFieldLabel
from arho_feature_template.gui.components.value_input_widgets import (
    IntegerInputWidget,
    SinglelineTextInputWidget,
    TypeOfVerbalRegulationWidget,
    ValueWidgetManager,
)
from arho_feature_template.project.layers.code_layers import PlanRegulationTypeLayer
from arho_feature_template.utils.misc_utils import LANGUAGE, get_layer_by_name

ui_path = resources.files(__package__) / "plan_regulation_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)


class RegulationWidget(QWidget, FormClass):  # type: ignore
    """A widget representation of a plan regulation."""

    # TYPES
    plan_regulation_name: QLineEdit
    form_layout: QFormLayout
    add_additional_information_btn: QPushButton
    add_field_btn: QPushButton
    del_btn: QPushButton
    expand_hide_btn: QToolButton
    additional_information_frame: QFrame
    additional_information_layout: QVBoxLayout

    delete_signal = pyqtSignal(QWidget)

    def __init__(self, regulation: Regulation, parent=None):
        super().__init__(parent)
        self.setupUi(self)

        # INIT
        self.config = regulation.config
        self.regulation = regulation

        self.value_widget_manager = (
            ValueWidgetManager(self.regulation.value, self.config.default_value) if self.config.default_value else None
        )

        # List of widgets for hiding / showing
        self.widgets: list[tuple[QLabel, QWidget]] = []

        # For accessing correct widgets when data is sent
        self.value_widget: QWidget | None = None
        self.regulation_number_widget: IntegerInputWidget | None = None
        self.additional_information_widgets: list[AdditionalInformationWidget] = []
        self.file_widgets: list[QgsFileWidget] = []
        self.theme_widget: SinglelineTextInputWidget | None = None
        self.topic_tag_widget: SinglelineTextInputWidget | None = None
        self.type_of_verbal_regulation_widgets: list[TypeOfVerbalRegulationWidget] = []

        self.expanded = True
        self.additional_information_frame.hide()
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
        if self.config.default_value:
            self._add_widget(RequiredFieldLabel("Arvo"), self.value_widget_manager.value_widget)

        if self.config.regulation_code in PlanRegulationTypeLayer.verbal_regulation_codes:
            for type_id in self.regulation.verbal_regulation_type_ids:
                self._add_type_of_verbal_regulation(type_id)
            if len(self.type_of_verbal_regulation_widgets) == 0:
                self._add_type_of_verbal_regulation()

        # Additional information
        for info in self.regulation.additional_information:
            self._add_additional_info(info)

    def _init_additional_information_btn(self) -> None:
        informations_dict: dict[str, QMenu] = {}

        def _add_action(parent_id: str, info_type: str, display_name: str):
            action = informations_dict[parent_id].addAction(display_name)
            action.triggered.connect(
                lambda _: self._add_additional_info(
                    AdditionalInformation(config=AdditionalInformationConfigLibrary.get_config_by_code(info_type))
                )
            )

        ai_config_library = AdditionalInformationConfigLibrary.get_instance()
        for top_level_code in ai_config_library.top_level_codes:
            top_level_config = ai_config_library.get_config_by_code(top_level_code)

            menu = QMenu(top_level_config.name, self)
            informations_dict[top_level_code] = menu

            for child_code in top_level_config.children:
                config = ai_config_library.get_config_by_code(child_code)
                if not config.name:
                    continue
                _add_action(top_level_code, config.additional_information_type, config.name)

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
                # self.form_layout.removeWidget(label)
                label.hide()
                # self.form_layout.removeWidget(value_widget)
                value_widget.hide()
            self.additional_information_frame.hide()
            self.expand_hide_btn.setArrowType(Qt.ArrowType.DownArrow)
            self.expanded = False
        else:
            for label, value_widget in self.widgets:
                # self.form_layout.addRow(label, value_widget)
                label.show()
                value_widget.show()
            self.additional_information_frame.show()
            self.expand_hide_btn.setArrowType(Qt.ArrowType.UpArrow)
            self.expanded = True

    def _add_widget(self, label: QLabel, widget: QWidget):
        self.form_layout.addRow(label, widget)
        self.widgets.append((label, widget))
        if not self.expanded:
            self._on_expand_hide_btn_clicked()

    def _add_additional_info(self, additional_information: AdditionalInformation):
        widget = AdditionalInformationWidget(additional_information, self)
        widget.delete_signal.connect(self._delete_additional_info)

        self.additional_information_frame.show()

        self.additional_information_widgets.append(widget)
        self.additional_information_layout.addWidget(widget)

    def _delete_additional_info(self, info_widget: AdditionalInformationWidget):
        self.additional_information_layout.removeWidget(info_widget)
        self.additional_information_widgets.remove(info_widget)
        info_widget.deleteLater()

    def _add_regulation_number(self):
        if not self.regulation_number_widget:
            self.regulation_number_widget = IntegerInputWidget(None, None, True)
            self._add_widget(QLabel("Määräysnumero"), self.regulation_number_widget)

    def _add_file(self):
        widget = QgsFileWidget()
        self._add_widget(QLabel("Liiteasiakirja"), widget)
        self.file_widgets.append(widget)

    def _add_topic_tag(self):
        self.topic_tag_widget = SinglelineTextInputWidget(None, True)
        self._add_widget(QLabel("Aihetunniste"), self.topic_tag_widget)

    def _add_theme(self, theme_name: str):
        self.theme_widget = SinglelineTextInputWidget(theme_name, False)
        self._add_widget(QLabel("Kaavoitusteema"), self.theme_widget)

    def _add_type_of_verbal_regulation(self, type_id: str | None = None):
        if len(self.type_of_verbal_regulation_widgets) == 0:
            widget = TypeOfVerbalRegulationWidget(with_add_btn=True)
            btn = cast(QPushButton, widget.add_btn)
            btn.clicked.connect(self._add_type_of_verbal_regulation)
        else:
            widget = TypeOfVerbalRegulationWidget(with_del_btn=True)
            btn = cast(QPushButton, widget.del_btn)
            btn.clicked.connect(lambda: self._delete_type_of_verbal_regulation(widget))

        if type_id:
            widget.set_value(type_id)

        self.type_of_verbal_regulation_widgets.append(widget)
        self._add_widget(RequiredFieldLabel("Sanallisen määräyksen laji"), widget)

    def _delete_type_of_verbal_regulation(self, widget_to_delete: TypeOfVerbalRegulationWidget):
        self.type_of_verbal_regulation_widgets.remove(widget_to_delete)
        for label, widget in self.widgets:
            if widget is widget_to_delete:
                widget.deleteLater()
                label.deleteLater()

    def into_model(self) -> Regulation:
        verbal_regulation_type_ids = [widget.get_value() for widget in self.type_of_verbal_regulation_widgets]
        model = Regulation(
            config=self.config,
            value=self.value_widget_manager.into_model() if self.value_widget_manager else AttributeValue(),
            regulation_number=self.regulation_number_widget.get_value() if self.regulation_number_widget else None,
            additional_information=[ai_widget.into_model() for ai_widget in self.additional_information_widgets],
            files=[file.filePath() for file in self.file_widgets],
            theme=self.theme_widget.get_value() if self.theme_widget else None,
            topic_tag=self.topic_tag_widget.get_value() if self.topic_tag_widget else None,
            verbal_regulation_type_ids=[value for value in verbal_regulation_type_ids if value is not None],
            regulation_group_id=self.regulation.regulation_group_id,
            modified=self.regulation.modified,
            id_=self.regulation.id_,
        )
        if not model.modified and model != self.regulation:
            model.modified = True

        return model
