from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.gui import QgsDateTimeEdit
from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt, pyqtSignal
from qgis.PyQt.QtWidgets import QCheckBox, QFormLayout, QLabel, QMenu, QToolButton, QWidget

from arho_feature_template.core.models import Document
from arho_feature_template.project.layers.code_layers import (
    CategoryOfPublicityLayer,
    LanguageLayer,
    PersonalDataContentLayer,
    RetentionTimeLayer,
    TypeOfDocumentLayer,
)

if TYPE_CHECKING:
    from datetime import datetime

    from qgis.PyQt.QtWidgets import QLineEdit, QPushButton

    from arho_feature_template.gui.components.code_combobox import CodeComboBox, HierarchicalCodeComboBox


ui_path = resources.files(__package__) / "plan_document_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)


class DocumentWidget(QWidget, FormClass):  # type: ignore
    """A widget representation of a plan document."""

    document_edited = pyqtSignal()
    delete_signal = pyqtSignal(QWidget)

    def __init__(self, document: Document, parent=None):
        super().__init__(parent)
        self.setupUi(self)

        # TYPES
        self.name: QLineEdit
        self.url: QLineEdit
        self.url_label: QLabel
        self.identifier_label: QLabel
        self.identifier: QLineEdit
        self.document_type: CodeComboBox
        self.document_type_label: QLabel
        self.publicity: CodeComboBox
        self.publicity_label: QLabel
        self.accessibility: QCheckBox
        self.accessibility_label: QLabel
        self.language: CodeComboBox
        self.language_label: QLabel
        self.retention_time: HierarchicalCodeComboBox
        self.retention_time_label: QLabel
        self.personal_data_content: CodeComboBox
        self.personal_data_content_label: QLabel
        self.document_date: QgsDateTimeEdit
        self.document_date_label: QLabel

        self.add_field_btn: QPushButton
        self.del_btn: QPushButton
        self.form_layout: QFormLayout
        self.expand_hide_btn: QToolButton

        # INIT
        self.document = document

        self.document_type.populate_from_code_layer(TypeOfDocumentLayer)
        self.publicity.populate_from_code_layer(CategoryOfPublicityLayer)
        self.language.populate_from_code_layer(LanguageLayer)
        self.language.setCurrentIndex(1)
        self.retention_time.populate_from_code_layer(RetentionTimeLayer)
        self.personal_data_content.populate_from_code_layer(PersonalDataContentLayer)

        self.name.textChanged.connect(self.document_edited.emit)
        self.identifier.textChanged.connect(self.document_edited.emit)
        self.document_type.currentIndexChanged.connect(self.document_edited.emit)
        self.publicity.currentIndexChanged.connect(self.document_edited.emit)
        self.language.currentIndexChanged.connect(self.document_edited.emit)
        self.retention_time.currentIndexChanged.connect(self.document_edited.emit)
        self.personal_data_content.currentIndexChanged.connect(self.document_edited.emit)

        # List of widgets for hiding / showing
        self.widgets: list[tuple[QLabel, QWidget]] = [
            (self.url_label, self.url),
            (self.identifier_label, self.identifier),
            (self.document_type_label, self.document_type),
            (self.publicity_label, self.publicity),
            (self.accessibility_label, self.accessibility),
            (self.language_label, self.language),
            (self.retention_time_label, self.retention_time),
            (self.personal_data_content_label, self.personal_data_content),
            (self.document_date_label, self.document_date),
        ]
        self.arrival_date_widget: QgsDateTimeEdit | None = None
        self.confirmation_date_widget: QgsDateTimeEdit | None = None

        add_field_menu = QMenu(self)
        add_field_menu.addAction("Saapumispäivämäärä").triggered.connect(self._add_arrival_date)
        add_field_menu.addAction("Vahvistuspäivämäärä").triggered.connect(self._add_confirmation_date)
        self.add_field_btn.setMenu(add_field_menu)
        self.add_field_btn.setIcon(QgsApplication.getThemeIcon("mActionAdd.svg"))
        self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.del_btn.clicked.connect(lambda: self.delete_signal.emit(self))

        self.expanded = True
        self.expand_hide_btn.clicked.connect(self._on_expand_hide_btn_clicked)

        # Set values from input Document model
        self.name.setText(document.name)
        self.url.setText(document.url)
        if document.identifier:
            self.identifier.setText(document.identifier)
        self.document_type.set_value(document.type_of_document_id)
        self.publicity.set_value(document.category_of_publicity_id)
        self.accessibility.setChecked(document.accessibility is True)
        if document.language_id:
            self.language.set_value(document.language_id)
        self.retention_time.set_value(document.retention_time_id)
        self.personal_data_content.set_value(document.personal_data_content_id)
        if document.arrival_date:
            self._add_arrival_date(document.arrival_date)
        if document.confirmation_date:
            self._add_confirmation_date(document.confirmation_date)

    def is_ok(self) -> bool:
        return (
            self.identifier.text() != ""
            and self.document_type.value() is not None
            and self.publicity.value() is not None
            and self.language.value() is not None
            and self.retention_time.value() is not None
            and self.personal_data_content.value() is not None
        )

    def _add_widgets(self, label: QLabel, widget: QWidget):
        self.form_layout.addRow(label, widget)
        self.widgets.append((label, widget))
        if not self.expanded:
            self._on_expand_hide_btn_clicked()

    def _add_arrival_date(self, default_value: datetime | None = None):
        if not self.arrival_date_widget:
            self.arrival_date_widget = QgsDateTimeEdit()
            self.arrival_date_widget.setDisplayFormat("d.M.yyyy")
            if default_value:
                self.arrival_date_widget.setDateTime(default_value)
            self._add_widgets(QLabel("Saapumispäivämäärä"), self.arrival_date_widget)

    def _add_confirmation_date(self, default_value: datetime | None = None):
        if not self.confirmation_date_widget:
            self.confirmation_date_widget = QgsDateTimeEdit()
            self.confirmation_date_widget.setDisplayFormat("d.M.yyyy")
            if default_value:
                self.confirmation_date_widget.setDateTime(default_value)
            self._add_widgets(QLabel("Vahvistuspäivämäärä"), self.confirmation_date_widget)

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

    def into_model(self) -> Document:
        model = Document(
            name=self.name.text() if self.name.text() != "" else None,
            url=self.url.text(),
            identifier=self.identifier.text(),
            type_of_document_id=self.document_type.value(),
            accessibility=self.accessibility.isChecked(),
            category_of_publicity_id=self.publicity.value(),
            personal_data_content_id=self.personal_data_content.value(),
            retention_time_id=self.retention_time.value(),
            language_id=self.language.value(),
            document_date=self.document_date.date(),
            # exported_at=self.document.exported_at,
            plan_id=self.document.plan_id,
            modified=self.document.modified,
            id_=self.document.id_,
        )
        if not model.modified and model != self.document:
            model.modified = True

        return model
