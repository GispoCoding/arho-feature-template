from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING, cast

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import QDialog, QDialogButtonBox, QLabel, QLineEdit, QPushButton, QTextEdit

from arho_feature_template.core.models import Document, Plan, RegulationGroup, RegulationGroupLibrary
from arho_feature_template.gui.components.general_regulation_group_widget import GeneralRegulationGroupWidget

# from arho_feature_template.gui.components.plan_regulation_group_widget import RegulationGroupWidget
from arho_feature_template.gui.components.plan_document_widget import DocumentWidget
from arho_feature_template.gui.components.value_input_widgets import LegalEffectWidget
from arho_feature_template.project.layers.code_layers import (
    LifeCycleStatusLayer,
    OrganisationLayer,
    PlanTypeLayer,
)
from arho_feature_template.utils.misc_utils import disconnect_signal

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QFormLayout, QLineEdit, QTextEdit, QVBoxLayout

    from arho_feature_template.gui.components.code_combobox import CodeComboBox, HierarchicalCodeComboBox

ui_path = resources.files(__package__) / "plan_attribute_form.ui"
FormClass, _ = uic.loadUiType(ui_path)


class PlanAttributeForm(QDialog, FormClass):  # type: ignore
    permanent_identifier_line_edit: QLineEdit
    name_line_edit: QLineEdit
    organisation_combo_box: CodeComboBox
    description_text_edit: QTextEdit
    plan_type_combo_box: HierarchicalCodeComboBox
    lifecycle_status_combo_box: CodeComboBox
    record_number_line_edit: QLineEdit
    producers_plan_identifier_line_edit: QLineEdit
    matter_management_identifier_line_edit: QLineEdit

    regulations_layout: QVBoxLayout
    add_general_regulation_group_btn: QPushButton
    # plan_regulation_group_scrollarea_contents: QWidget
    # plan_regulation_group_libraries_combobox: QComboBox
    # regulation_groups_tree_layout: QVBoxLayout

    documents_layout: QVBoxLayout
    add_document_btn: QPushButton

    button_box: QDialogButtonBox

    def __init__(self, plan: Plan, _regulation_group_libraries: list[RegulationGroupLibrary], parent=None):
        super().__init__(parent)

        self.setupUi(self)

        self.general_data_layout: QFormLayout

        self.plan = plan
        self.lifecycle_models = plan.lifecycles

        self.plan_type_combo_box.populate_from_code_layer(PlanTypeLayer)
        self.lifecycle_status_combo_box.populate_from_code_layer(LifeCycleStatusLayer)
        self.organisation_combo_box.populate_from_code_layer(OrganisationLayer)

        self.plan_type_combo_box.set_value(plan.plan_type_id)
        self.lifecycle_status_combo_box.set_value(plan.lifecycle_status_id)
        self.organisation_combo_box.set_value(plan.organisation_id)
        self.name_line_edit.setText(plan.name if plan.name else "")
        self.description_text_edit.setText(plan.description if plan.description else "")
        self.permanent_identifier_line_edit.setText(
            plan.permanent_plan_identifier if plan.permanent_plan_identifier else ""
        )
        self.record_number_line_edit.setText(plan.record_number if plan.record_number else "")
        self.producers_plan_identifier_line_edit.setText(
            plan.producers_plan_identifier if plan.producers_plan_identifier else ""
        )
        self.matter_management_identifier_line_edit.setText(
            plan.matter_management_identifier if plan.matter_management_identifier else ""
        )

        self.name_line_edit.textChanged.connect(self._check_required_fields)
        self.organisation_combo_box.currentIndexChanged.connect(self._check_required_fields)
        self.plan_type_combo_box.currentIndexChanged.connect(self._check_required_fields)
        self.plan_type_combo_box.currentIndexChanged.connect(self._update_legal_effect_widgets_visibility)
        self.lifecycle_status_combo_box.currentIndexChanged.connect(self._check_required_fields)

        self.scroll_area_spacer = None
        self.regulation_group_widgets: list[GeneralRegulationGroupWidget] = []
        self.legal_effect_widgets: list[tuple[QLabel, LegalEffectWidget]] = []
        # self.regulation_groups_selection_widget = TreeWithSearchWidget()
        # self.regulation_groups_tree_layout.insertWidget(2, self.regulation_groups_selection_widget)
        # for library in regulation_group_libraries:
        #     self.init_plan_regulation_group_library(library)
        # self.regulation_groups_selection_widget.tree.itemDoubleClicked.connect(self.add_selected_plan_regulation_group)

        for regulation_group in plan.general_regulations:
            self.add_plan_regulation_group(regulation_group)

        # Documents
        self.document_widgets: list[DocumentWidget] = []
        for document in plan.documents:
            self.add_document(document)

        # Legal effects
        for legal_effect_id in plan.legal_effect_ids:
            self.add_legal_effect_widget(legal_effect_id)
        if len(self.legal_effect_widgets) == 0:
            self.add_legal_effect_widget()

        self.add_general_regulation_group_btn.clicked.connect(self.add_new_regulation_group)
        self.add_general_regulation_group_btn.setIcon(QgsApplication.getThemeIcon("mActionAdd.svg"))

        self.add_document_btn.clicked.connect(self.add_new_document)
        self.add_document_btn.setIcon(QgsApplication.getThemeIcon("mActionAdd.svg"))

        self.button_box.button(QDialogButtonBox.Ok).setEnabled(False)
        self.button_box.accepted.connect(self._on_ok_clicked)

        self._check_required_fields()
        self._update_legal_effect_widgets_visibility()

    def _check_required_fields(self) -> None:
        ok_button = self.button_box.button(QDialogButtonBox.Ok)
        if (
            self.name_line_edit.text() != ""
            and self.plan_type_combo_box.value() is not None
            and self.organisation_combo_box.value() is not None
            and self.lifecycle_status_combo_box.value() is not None
            and all(document_widget.is_ok() for document_widget in self.document_widgets)
        ):
            ok_button.setEnabled(True)
        else:
            ok_button.setEnabled(False)

    def _update_legal_effect_widgets_visibility(self):
        plan_type_id = self.plan_type_combo_box.value()
        if PlanTypeLayer.is_general_plan_type(plan_type_id):
            self._show_legal_effect_widgets()
        else:
            self._hide_legal_effect_widgets()

    def _show_legal_effect_widgets(self):
        for label, widget in self.legal_effect_widgets:
            label.show()
            widget.show()

    def _hide_legal_effect_widgets(self):
        for label, widget in self.legal_effect_widgets:
            label.hide()
            widget.hide()

    def add_legal_effect_widget(self, legal_effect_id: str | None = None):
        """
        Adds a legal effect widget to the form.

        If no legal widgets exist yet, includes an "add" button, otherwise a
        "delete" button.
        """
        if len(self.legal_effect_widgets) == 0:
            widget = LegalEffectWidget(with_add_btn=True)
            btn = cast(QPushButton, widget.add_btn)
            btn.clicked.connect(self.add_legal_effect_widget)
        else:
            widget = LegalEffectWidget(with_del_btn=True)
            btn = cast(QPushButton, widget.del_btn)
            btn.clicked.connect(lambda: self.delete_legal_effect_widget(widget))

        if legal_effect_id:
            widget.set_value(legal_effect_id)

        label = QLabel("Oikeusvaikutus:")
        self.legal_effect_widgets.append((label, widget))
        self.general_data_layout.addRow(label, widget)

    def delete_legal_effect_widget(self, widget_to_delete: LegalEffectWidget):
        for i, (label, widget) in enumerate(self.legal_effect_widgets):
            if widget is widget_to_delete:
                self.legal_effect_widgets.pop(i)
                widget.deleteLater()
                label.deleteLater()

    # --- COPIED FROM PLAN FEATURE FORM ---

    # def add_selected_plan_regulation_group(self, item: QTreeWidgetItem, column: int):
    #     if not item.parent():
    #         return
    #     regulation_group: RegulationGroup = item.data(column, Qt.UserRole)
    #     self.add_plan_regulation_group(regulation_group)

    def add_new_regulation_group(self):
        self.add_plan_regulation_group(RegulationGroup())

    def add_plan_regulation_group(self, regulation_group: RegulationGroup):
        regulation_group_widget = GeneralRegulationGroupWidget(regulation_group, layer_name="Kaava")
        regulation_group_widget.delete_signal.connect(self.remove_plan_regulation_group)
        # regulation_group_widget.open_as_form_signal.connect(self.open_plan_regulation_group_form)
        self.regulations_layout.insertWidget(1, regulation_group_widget)
        self.regulation_group_widgets.append(regulation_group_widget)

    # def open_plan_regulation_group_form(self, regulation_group_widget: GeneralRegulationGroupWidget):
    #     group_as_form = PlanRegulationGroupForm(regulation_group_widget.into_model())
    #     if group_as_form.exec_():
    #         regulation_group_widget.from_model(group_as_form.model)

    def remove_plan_regulation_group(self, regulation_group_widget: GeneralRegulationGroupWidget):
        disconnect_signal(regulation_group_widget.delete_signal)
        # disconnect_signal(regulation_group_widget.open_as_form_signal)
        self.regulations_layout.removeWidget(regulation_group_widget)
        self.regulation_group_widgets.remove(regulation_group_widget)
        regulation_group_widget.deleteLater()

    # def init_plan_regulation_group_library(self, library: RegulationGroupLibrary):
    #     self.plan_regulation_group_libraries_combobox.addItem(library.name)
    #     for category in library.regulation_group_categories:
    #         category_item = self.regulation_groups_selection_widget.add_item_to_tree(category.name)
    #         for group_definition in category.regulation_groups:
    #             self.regulation_groups_selection_widget.add_item_to_tree(
    #                 group_definition.name, group_definition, category_item
    #             )

    def add_new_document(self):
        self.add_document(Document())
        self._check_required_fields()

    def add_document(self, document: Document):
        widget = DocumentWidget(document)
        widget.delete_signal.connect(self.delete_document)
        widget.document_edited.connect(self._check_required_fields)
        self.documents_layout.insertWidget(1, widget)
        self.document_widgets.append(widget)

    def delete_document(self, document_widget: DocumentWidget):
        document_widget.delete_signal.disconnect()
        document_widget.document_edited.disconnect()
        self.documents_layout.removeWidget(document_widget)
        self.document_widgets.remove(document_widget)
        document_widget.deleteLater()
        self._check_required_fields()

    # ---

    def into_model(self) -> Plan:
        if PlanTypeLayer.is_general_plan_type(self.plan_type_combo_box.value()):
            legal_effect_ids = [legal_effect_widget[1].get_value() for legal_effect_widget in self.legal_effect_widgets]
        else:
            legal_effect_ids = []

        model = Plan(
            id_=self.plan.id_,
            name=self.name_line_edit.text(),
            description=self.description_text_edit.toPlainText() or None,
            plan_type_id=self.plan_type_combo_box.value(),
            organisation_id=self.organisation_combo_box.value(),
            permanent_plan_identifier=self.permanent_identifier_line_edit.text() or None,
            record_number=self.record_number_line_edit.text() or None,
            producers_plan_identifier=self.producers_plan_identifier_line_edit.text() or None,
            matter_management_identifier=self.matter_management_identifier_line_edit.text() or None,
            lifecycle_status_id=self.lifecycle_status_combo_box.value(),
            general_regulations=[reg_group_widget.into_model() for reg_group_widget in self.regulation_group_widgets],
            legal_effect_ids=[value for value in legal_effect_ids if value is not None],
            documents=[document_widget.into_model() for document_widget in self.document_widgets],
            modified=self.plan.modified,
            geom=self.plan.geom,
        )
        if not model.modified and model != self.plan:
            model.modified = True

        return model

    def _on_ok_clicked(self):
        self.model = self.into_model()
        self.accept()
