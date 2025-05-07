from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt
from qgis.PyQt.QtWidgets import (
    QComboBox,
    QDialog,
    QDialogButtonBox,
    QLineEdit,
    QMessageBox,
    QScrollArea,
    QSizePolicy,
    QSpacerItem,
    QTextEdit,
    QTreeWidget,
    QTreeWidgetItem,
)

from arho_feature_template.core.models import PlanFeature, RegulationGroup
from arho_feature_template.gui.components.plan_regulation_group_widget import RegulationGroupWidget
from arho_feature_template.gui.components.tree_with_search_widget import TreeWithSearchWidget
from arho_feature_template.gui.dialogs.plan_regulation_group_form import PlanRegulationGroupForm
from arho_feature_template.project.layers.code_layers import PlanType, PlanTypeLayer, UndergroundTypeLayer
from arho_feature_template.project.layers.plan_layers import PlanLayer
from arho_feature_template.utils.misc_utils import disconnect_signal, get_active_plan_id

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QVBoxLayout, QWidget

    from arho_feature_template.core.models import RegulationGroupLibrary
    from arho_feature_template.gui.components.code_combobox import CodeComboBox

ui_path = resources.files(__package__) / "plan_feature_form.ui"
FormClass, _ = uic.loadUiType(ui_path)


class PlanFeatureForm(QDialog, FormClass):  # type: ignore
    """Parent class for feature forms for adding and modifying feature attribute data."""

    def __init__(
        self,
        plan_feature: PlanFeature,
        form_title: str,
        regulation_group_libraries: list[RegulationGroupLibrary],
        active_plan_regulation_groups_library: RegulationGroupLibrary,
    ):
        super().__init__()
        self.setupUi(self)

        # TYPES
        self.feature_name: QLineEdit
        self.feature_description: QTextEdit
        self.feature_type_of_underground: CodeComboBox
        self.plan_regulation_group_scrollarea: QScrollArea
        self.plan_regulation_group_scrollarea_contents: QWidget
        self.plan_regulation_group_libraries_combobox: QComboBox
        self.plan_regulation_groups_tree: QTreeWidget
        self.button_box: QDialogButtonBox

        self.regulation_groups_tree_layout: QVBoxLayout

        # INIT
        self.existing_group_short_names = active_plan_regulation_groups_library.get_short_names()
        self.active_plan_regulation_groups_library = active_plan_regulation_groups_library
        self.regulation_group_libraries = [*regulation_group_libraries, active_plan_regulation_groups_library]
        self.plan_regulation_group_libraries_combobox.addItems(
            library.name for library in self.regulation_group_libraries
        )
        self.plan_regulation_group_libraries_combobox.currentIndexChanged.connect(self.show_regulation_group_library)

        self.regulation_group_widgets: list[RegulationGroupWidget] = []
        self.scroll_area_spacer = None
        self.setWindowTitle(form_title)

        self.regulation_groups_selection_widget = TreeWithSearchWidget()
        self.regulation_groups_tree_layout.insertWidget(2, self.regulation_groups_selection_widget)
        self.regulation_groups_selection_widget.tree.itemDoubleClicked.connect(self.add_selected_plan_regulation_group)
        self.select_library_by_active_plan_type()
        self.show_regulation_group_library(self.plan_regulation_group_libraries_combobox.currentIndex())

        self.feature_type_of_underground.populate_from_code_layer(UndergroundTypeLayer)
        self.feature_type_of_underground.remove_item_by_text("NULL")
        self.feature_type_of_underground.setCurrentIndex(1)  # Set default to Maanpäällinen (index 1)

        # Initialize attributes from template
        self.plan_feature = plan_feature

        if plan_feature.name:
            self.feature_name.setText(plan_feature.name)
        if plan_feature.description:
            self.feature_description.setText(plan_feature.description)
        for regulation_group in plan_feature.regulation_groups:
            self.add_plan_regulation_group(regulation_group)

        self.button_box.accepted.connect(self._on_ok_clicked)

    def select_library_by_active_plan_type(self):
        feature = PlanLayer.get_feature_by_id(get_active_plan_id(), no_geometries=False)
        model = PlanLayer.model_from_feature(feature)

        plan_type = PlanTypeLayer.get_plan_type(model.plan_type_id)
        library_name = ""
        if plan_type == PlanType.REGIONAL:
            library_name = "Maakuntakaavan kaavamääräysryhmät (Katja)"
        elif plan_type == PlanType.GENERAL:
            library_name = "Yleiskaavan kaavamääräysryhmät (Katja)"
        elif plan_type == PlanType.TOWN:
            library_name = "Asemakaavan kaavamääräysryhmät (Katja)"

        for i, library in enumerate(self.regulation_group_libraries):
            if library.name == library_name:
                self.plan_regulation_group_libraries_combobox.setCurrentIndex(i)
                return

        self.plan_regulation_group_libraries_combobox.setCurrentIndex(0)

    def _add_spacer(self):
        self.scroll_area_spacer = QSpacerItem(0, 0, QSizePolicy.Expanding, QSizePolicy.Expanding)
        self.plan_regulation_group_scrollarea_contents.layout().addItem(self.scroll_area_spacer)

    def _remove_spacer(self):
        if self.scroll_area_spacer is not None:
            self.plan_regulation_group_scrollarea_contents.layout().removeItem(self.scroll_area_spacer)
            self.scroll_area_spacer = None

    def _check_regulation_group_short_names(self) -> bool:
        seen_names = set()
        existing_names = set()
        duplicate_names = set()

        def _is_existing_model_with_unmodified_short_name(model: RegulationGroup, short_name: str) -> bool:
            return bool(model.id_ and short_name == model.short_name)

        def _format_names(names, last_item_conjucation: str = "ja") -> str:
            names = list(names)
            formatted_names = ", ".join(f"'<b>{name}</b>'" for name in names[:-1])
            formatted_names += f" {last_item_conjucation} " if len(names) > 1 else ""
            formatted_names += f"'<b>{names[-1]}</b>'" if names else ""
            return formatted_names

        for reg_group_widget in self.regulation_group_widgets:
            short_name = reg_group_widget.short_name.text()
            if not short_name:
                continue

            if (
                not _is_existing_model_with_unmodified_short_name(reg_group_widget.regulation_group, short_name)
                and short_name in self.existing_group_short_names
            ):
                existing_names.add(short_name)

            if short_name in seen_names:
                duplicate_names.add(short_name)

            seen_names.add(short_name)

        if existing_names:
            if len(existing_names) == 1:
                msg = f"Kaavamääräysryhmä lyhyellä nimellä {_format_names(existing_names)} on jo olemassa."
            else:
                msg = f"Kaavamääräysryhmät lyhyillä nimillä {_format_names(existing_names)} ovat jo olemassa."
            QMessageBox.critical(self, "Virhe", msg)
            return False

        if duplicate_names:
            msg = f"Lomakkeella on useita kaavamääräysryhmiä, joilla on lyhyt nimi {_format_names(duplicate_names, 'tai')}."
            QMessageBox.critical(self, "Virhe", msg)
            return False

        return True

    def add_selected_plan_regulation_group(self, item: QTreeWidgetItem, column: int):
        if not item.parent():
            return
        regulation_group: RegulationGroup = item.data(column, Qt.UserRole)
        self.add_plan_regulation_group(regulation_group)

    def add_plan_regulation_group(self, definition: RegulationGroup):
        regulation_group_widget = RegulationGroupWidget(definition, self.plan_feature)
        regulation_group_widget.delete_signal.connect(self.remove_plan_regulation_group)
        regulation_group_widget.open_as_form_signal.connect(self.open_plan_regulation_group_form)
        self._remove_spacer()
        self.plan_regulation_group_scrollarea_contents.layout().addWidget(regulation_group_widget)
        self.regulation_group_widgets.append(regulation_group_widget)
        self._add_spacer()

    def open_plan_regulation_group_form(self, regulation_group_widget: RegulationGroupWidget):
        group_as_form = PlanRegulationGroupForm(
            regulation_group_widget.into_model(), self.active_plan_regulation_groups_library
        )
        if group_as_form.exec_():
            regulation_group_widget.from_model(group_as_form.model)

    def remove_plan_regulation_group(self, regulation_group_widget: RegulationGroupWidget):
        disconnect_signal(regulation_group_widget.delete_signal)
        disconnect_signal(regulation_group_widget.open_as_form_signal)
        self.plan_regulation_group_scrollarea_contents.layout().removeWidget(regulation_group_widget)
        self.regulation_group_widgets.remove(regulation_group_widget)
        regulation_group_widget.deleteLater()

    def show_regulation_group_library(self, i: int):
        self.regulation_groups_selection_widget.tree.clear()
        library = self.regulation_group_libraries[i]
        for category in library.regulation_group_categories:
            category_item = self.regulation_groups_selection_widget.add_item_to_tree(category.name)
            for group in category.regulation_groups:
                _ = self.regulation_groups_selection_widget.add_item_to_tree(str(group), group, category_item)

    def into_model(self) -> PlanFeature:
        model = PlanFeature(
            name=self.feature_name.text() if self.feature_name.text() != "" else None,
            type_of_underground_id=self.feature_type_of_underground.value(),
            description=self.feature_description.toPlainText()
            if self.feature_description.toPlainText() != ""
            else None,
            geom=self.plan_feature.geom,
            layer_name=self.plan_feature.layer_name,
            regulation_groups=[reg_group_widget.into_model() for reg_group_widget in self.regulation_group_widgets],
            plan_id=self.plan_feature.plan_id,
            id_=self.plan_feature.id_,
            modified=self.plan_feature.modified,
        )
        if not model.modified and model != self.plan_feature:
            model.modified = True

        return model

    def _on_ok_clicked(self):
        if self._check_regulation_group_short_names():
            self.model = self.into_model()
            self.accept()
