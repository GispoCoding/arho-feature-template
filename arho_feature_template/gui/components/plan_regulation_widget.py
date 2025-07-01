from __future__ import annotations

from importlib import resources
from typing import cast

from qgis.core import NULL, QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt, pyqtSignal
from qgis.PyQt.QtWidgets import (
    QFormLayout,
    QLabel,
    QMenu,
    QPushButton,
    QToolButton,
    QWidget,
)

from arho_feature_template.core.models import (
    AdditionalInformation,
    AttributeValue,
    Regulation,
)
from arho_feature_template.gui.components.additional_information_widget import AdditionalInformationWidget
from arho_feature_template.gui.components.required_field_label import RequiredFieldLabel
from arho_feature_template.gui.components.subject_identifier_widget import SubjectIdentifierWidget
from arho_feature_template.gui.components.theme_widget import ThemeWidget
from arho_feature_template.gui.components.value_input_widgets import (
    TypeOfVerbalRegulationWidget,
    ValueWidgetManager,
)
from arho_feature_template.project.layers.code_layers import AdditionalInformationTypeLayer, PlanRegulationTypeLayer
from arho_feature_template.utils.misc_utils import deserialize_localized_text

ui_path = resources.files(__package__) / "plan_regulation_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)


class RegulationWidget(QWidget, FormClass):  # type: ignore
    """A widget representation of a plan regulation."""

    delete_signal = pyqtSignal(QWidget)

    def __init__(self, regulation: Regulation, parent=None):
        super().__init__(parent)
        self.setupUi(self)

        # TYPES
        self.regulation_name: QLabel
        self.regulation_details_container: QWidget
        self.form_layout: QFormLayout
        self.add_attribute_or_information_btn: QPushButton
        self.del_btn: QPushButton
        self.expand_hide_btn: QToolButton

        # INIT
        self.regulation = regulation
        self.default_value = PlanRegulationTypeLayer.get_default_value_by_id(self.regulation.regulation_type_id)
        self.value_widget_manager = (
            ValueWidgetManager(self.regulation.value, self.default_value) if self.default_value else None
        )

        # List of widgets for hiding / showing
        self.widgets: list[tuple[QLabel, QWidget]] = []

        # For accessing correct widgets when data is sent
        self.value_widget: QWidget | None = None
        self.type_of_verbal_regulation_widgets: list[TypeOfVerbalRegulationWidget] = []
        self.additional_information_widgets: list[AdditionalInformationWidget] = []

        # TODO: Implement regulation numbers / ordering and files (?)
        self.subject_identifier_widgets: list[SubjectIdentifierWidget] = []
        self.theme_widgets: list[ThemeWidget] = []

        self.expand_hide_btn.hide()
        self.regulation_details_container.hide()
        self.expanded = False

        name_text = PlanRegulationTypeLayer.get_name_by_id(self.regulation.regulation_type_id)
        if isinstance(name_text, dict):
            name_text = deserialize_localized_text(name_text)
        self.regulation_name.setText(name_text)

        self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.del_btn.clicked.connect(lambda: self.delete_signal.emit(self))
        self.expand_hide_btn.clicked.connect(self._on_expand_hide_btn_clicked)
        self._init_additional_attributes_and_information_btn()
        self._init_widgets()

    def _init_widgets(self):
        # Value input
        if self.default_value:
            self._add_widget(RequiredFieldLabel("Arvo"), self.value_widget_manager.value_widget)

        regulation_type = PlanRegulationTypeLayer.get_type_by_id(self.regulation.regulation_type_id)
        if regulation_type in PlanRegulationTypeLayer.verbal_regulation_types:
            for type_id in self.regulation.verbal_regulation_type_ids:
                self._add_type_of_verbal_regulation(type_id)
            if len(self.type_of_verbal_regulation_widgets) == 0:
                self._add_type_of_verbal_regulation()

        if self.regulation.theme_ids not in [None, NULL]:
            for theme_id in self.regulation.theme_ids:
                self._add_theme(theme_id)
        if self.regulation.subject_identifiers not in [None, NULL]:
            for subject in self.regulation.subject_identifiers:
                self._add_subject_identifier(subject)

        # Additional information
        for info in self.regulation.additional_information:
            self._add_additional_info(info)

    def _create_additional_information_menu(self) -> QMenu:
        # Store menus in dict to assign sub menus. Key is information type ID.
        _menu_dict: dict[str, QMenu] = {}
        additional_information_menu = QMenu(self)

        for id_, attributes in sorted(
            AdditionalInformationTypeLayer.get_cached_attributes().items(), key=lambda item: item[1]["level"]
        ):
            if attributes["level"] == 1:
                sub_menu = QMenu(deserialize_localized_text(attributes["name"]), self)
                _menu_dict[id_] = sub_menu
            else:  # level 2
                sub_menu = _menu_dict[attributes["parent_id"]]
                action = sub_menu.addAction(deserialize_localized_text(attributes["name"]))
                action.triggered.connect(
                    lambda _, id_=id_, attrs=attributes: self._add_additional_info(
                        AdditionalInformation(additional_information_type_id=id_, value=attrs["default_value"])
                    )
                )
        for sub_menu in _menu_dict.values():
            additional_information_menu.addMenu(sub_menu)
        return additional_information_menu

    def _init_additional_attributes_and_information_btn(self):
        attributes_and_information_menu = QMenu(self)
        attributes_and_information_menu.addAction("Aihetunniste").triggered.connect(self._add_subject_identifier)
        attributes_and_information_menu.addAction("Kaavoitusteema").triggered.connect(self._add_theme)
        attributes_and_information_menu.addAction("Lisätieto").setMenu(self._create_additional_information_menu())

        self.add_attribute_or_information_btn.setMenu(attributes_and_information_menu)
        self.add_attribute_or_information_btn.setIcon(QgsApplication.getThemeIcon("mActionAdd.svg"))

    def _on_expand_hide_btn_clicked(self):
        if self.expanded:
            self.regulation_details_container.hide()
            self.expand_hide_btn.setArrowType(Qt.ArrowType.DownArrow)
            self.expanded = False
        else:
            self.regulation_details_container.show()
            self.expand_hide_btn.setArrowType(Qt.ArrowType.UpArrow)
            self.expanded = True

    def _add_widget(self, label: QLabel, widget: QWidget):
        self.regulation_details_container.show()
        self.expand_hide_btn.show()
        self.form_layout.addRow(label, widget)
        self.widgets.append((label, widget))
        if not self.expanded:
            self._on_expand_hide_btn_clicked()

    def _delete_widget(self, widget_to_delete: QWidget) -> bool:
        for label, widget in self.widgets:
            if widget == widget_to_delete:
                if isinstance(widget, SubjectIdentifierWidget):
                    self.subject_identifier_widgets.remove(widget)
                elif isinstance(widget, ThemeWidget):
                    self.theme_widgets.remove(widget)
                elif isinstance(widget, AdditionalInformationWidget):
                    self.additional_information_widgets.remove(widget)
                self.form_layout.removeRow(widget_to_delete)
                self.widgets.remove((label, widget))
                if len(self.widgets) == 0:
                    self.regulation_details_container.hide()
                    self.expand_hide_btn.hide()
                return True
        return False

    def _add_additional_info(self, additional_information: AdditionalInformation):
        ai_widget = AdditionalInformationWidget(additional_information, self)
        ai_widget.delete_signal.connect(self._delete_widget)
        self.additional_information_widgets.append(ai_widget)
        self._add_widget(QLabel("Lisätieto:"), ai_widget)

    def _add_subject_identifier(self, subject: str | None = None):
        # self.topic_tag_widget = SinglelineTextInputWidget(None, True)
        subject_widget = SubjectIdentifierWidget(subject)
        subject_widget.delete_signal.connect(self._delete_widget)
        self.subject_identifier_widgets.append(subject_widget)
        self._add_widget(QLabel("Aihetunniste:"), subject_widget)

    def _add_theme(self, theme_name: str):
        theme_widget = ThemeWidget(theme_name)
        self.theme_widgets.append(theme_widget)
        theme_widget.delete_signal.connect(self._delete_widget)
        self._add_widget(QLabel("Kaavoitusteema:"), theme_widget)

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
            regulation_type_id=self.regulation.regulation_type_id,
            value=self.value_widget_manager.into_model() if self.value_widget_manager else AttributeValue(),
            regulation_number=None,
            additional_information=[ai_widget.into_model() for ai_widget in self.additional_information_widgets],
            files=[],
            theme_ids=[
                theme_widget.get_value() for theme_widget in self.theme_widgets if theme_widget.get_value() != NULL
            ],
            subject_identifiers=[
                widget.get_value() for widget in self.subject_identifier_widgets if widget.get_value() != ""
            ],
            verbal_regulation_type_ids=[value for value in verbal_regulation_type_ids if value is not None],
            regulation_group_id=self.regulation.regulation_group_id,
            modified=self.regulation.modified,
            id_=self.regulation.id_,
        )
        if not model.modified and model != self.regulation:
            model.modified = True

        return model
