from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt
from qgis.PyQt.QtWidgets import (
    QComboBox,
    QDialog,
    QDialogButtonBox,
    QFileDialog,
    QGroupBox,
    QLabel,
    QLineEdit,
    QListWidgetItem,
    QMessageBox,
    QPushButton,
    QTextEdit,
)

from arho_feature_template.core.models import RegulationGroup, RegulationGroupLibrary
from arho_feature_template.core.template_manager import TemplateManager
from arho_feature_template.gui.dialogs.plan_regulation_group_form import PlanRegulationGroupForm
from arho_feature_template.utils.misc_utils import iface

if TYPE_CHECKING:
    from qgis.gui import QgsCollapsibleGroupBox, QgsFileWidget, QgsFilterLineEdit
    from qgis.PyQt.QtWidgets import QListWidget, QPushButton


ui_path = resources.files(__package__) / "manage_libraries.ui"
FormClass, _ = uic.loadUiType(ui_path)

DATA_ROLE = Qt.UserRole


class ManageLibrariesForm(QDialog, FormClass):  # type: ignore
    def __init__(self, custom_regulation_group_libraries: list[RegulationGroupLibrary]):
        super().__init__()
        self.setupUi(self)

        # TYPES
        self.new_regulation_group_library_btn: QPushButton
        self.import_regulation_group_library_btn: QPushButton
        self.delete_regulation_group_library_btn: QPushButton
        self.regulation_group_libarary_selection: QComboBox

        self.file_path: QgsFileWidget
        self.reload_library_file_btn: QPushButton
        self.broken_path_warning_label: QLabel

        self.library_details_groupbox: QgsCollapsibleGroupBox
        self.name: QLineEdit
        self.description: QTextEdit

        self.regulation_group_templates_groupbox: QGroupBox
        self.new_regulation_group_template_btn: QPushButton
        self.edit_regulation_group_template_btn: QPushButton
        self.delete_regulation_group_template_btn: QPushButton

        self.regulation_group_templates_filter: QgsFilterLineEdit
        self.regulation_group_templates_list: QListWidget

        self.button_box: QDialogButtonBox

        # VARS
        self.active_library: RegulationGroupLibrary | None = None
        self.new_libraries: list[RegulationGroupLibrary] = []
        self.deleted_libraries: list[RegulationGroupLibrary] = []

        self.custom_regulation_group_libraries = custom_regulation_group_libraries

        # SIGNALS
        self.regulation_group_libarary_selection.currentIndexChanged.connect(self._on_regulation_group_library_changed)
        self.reload_library_file_btn.clicked.connect(self._on_reload_library_file_clicked)
        self.name.textChanged.connect(self._on_library_name_changed)
        self.file_path.fileChanged.connect(self._on_library_file_path_changed)
        self.description.textChanged.connect(self._on_library_description_changed)

        self.new_regulation_group_library_btn.clicked.connect(self._on_new_regulation_group_library_clicked)
        self.import_regulation_group_library_btn.clicked.connect(self._on_import_regulation_group_library_clicked)
        self.delete_regulation_group_library_btn.clicked.connect(self._on_delete_regulation_group_library_clicked)

        self.new_regulation_group_template_btn.clicked.connect(self._on_new_regulation_group_template_clicked)
        self.edit_regulation_group_template_btn.clicked.connect(self._on_edit_regulation_group_template_clicked)
        self.delete_regulation_group_template_btn.clicked.connect(self._on_delete_regulation_group_templates_clicked)

        self.regulation_group_templates_filter.valueChanged.connect(self._filter_regulation_groups)

        self.button_box.accepted.connect(self._on_ok_clicked)

        # ICONS
        self.reload_library_file_btn.setIcon(QgsApplication.getThemeIcon("mActionRefresh.svg"))

        self.new_regulation_group_library_btn.setIcon(QgsApplication.getThemeIcon("mActionAdd.svg"))
        self.import_regulation_group_library_btn.setIcon(QgsApplication.getThemeIcon("mActionFileOpen.svg"))
        self.delete_regulation_group_library_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))

        self.new_regulation_group_template_btn.setIcon(QgsApplication.getThemeIcon("mActionAdd.svg"))
        self.edit_regulation_group_template_btn.setIcon(QgsApplication.getThemeIcon("mActionEditTable.svg"))
        self.delete_regulation_group_template_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))

        # Initialize existing libraries, selection and widgets
        for library in self.custom_regulation_group_libraries:
            self._add_library(library)

        self.library_details_groupbox.setCollapsed(False)
        if self.regulation_group_libarary_selection.count() != 0:
            self.regulation_group_libarary_selection.setCurrentIndex(0)
        self._check_required_fields()

    # LIBRARIES
    def _check_required_fields(self) -> None:
        ok_button = self.button_box.button(QDialogButtonBox.Ok)
        if all(library.name != "" and library.file_path not in ["", None] for library in self._get_current_libraries()):
            ok_button.setEnabled(True)
        else:
            ok_button.setEnabled(False)

    def _on_regulation_group_library_changed(self, _):
        if self.regulation_group_libarary_selection.count() == 0:
            self._handle_no_libraries_present()
        else:
            self._change_active_library(self.regulation_group_libarary_selection.currentData(DATA_ROLE))

    def _on_library_name_changed(self, new_name: str):
        if self.active_library is None:
            return

        self.active_library.name = new_name
        self.regulation_group_libarary_selection.setCurrentText(new_name)
        self._check_required_fields()

    def _on_reload_library_file_clicked(self):
        file_path = self.file_path.filePath()
        loaded_library = RegulationGroupLibrary.from_template_dict(
            data=TemplateManager.read_regulation_group_template_file(file_path),
            library_type=RegulationGroupLibrary.LibraryType.CUSTOM,
            file_path=str(file_path),
        )
        self.regulation_group_libarary_selection.setItemData(
            self.regulation_group_libarary_selection.currentIndex(), loaded_library, DATA_ROLE
        )
        self._change_active_library(loaded_library)

    def _on_library_file_path_changed(self, new_path: str):
        if self.active_library is None:
            return

        self.active_library.file_path = new_path
        self._check_required_fields()

    def _on_library_description_changed(self):
        if self.active_library is None:
            return

        self.active_library.description = self.description.toPlainText()

    def _handle_no_libraries_present(self):
        self.name.clear()
        self.file_path.setFilePath("")
        self.description.clear()
        self.regulation_group_templates_list.clear()

        self.library_details_groupbox.setEnabled(False)
        self.regulation_group_templates_groupbox.setEnabled(False)
        self.broken_path_warning_label.hide()

    def _change_active_library(self, library: RegulationGroupLibrary):
        self.active_library = library

        self.file_path.setFilePath(library.file_path)
        if library.status is True:
            # Enable widgets and show contents
            self.name.setEnabled(True)
            self.name.setText(library.name)
            self.description.setEnabled(True)
            self.description.setText(library.description)
            self.library_details_groupbox.setEnabled(True)
            self.regulation_group_templates_groupbox.setEnabled(True)

            self.broken_path_warning_label.hide()
        else:
            # Disable and clear widgets
            self.name.setEnabled(False)
            self.name.clear()
            self.description.setEnabled(False)
            self.description.clear()
            self.library_details_groupbox.setEnabled(True)
            self.regulation_group_templates_groupbox.setEnabled(False)

            self.broken_path_warning_label.show()

        # Cannot reload a new library from file (this would be importing)
        if self._is_new_library(library):
            self.reload_library_file_btn.setEnabled(False)
        else:
            self.reload_library_file_btn.setEnabled(True)

        self._update_template_view()

    def _add_library(self, library: RegulationGroupLibrary):
        self.regulation_group_libarary_selection.addItem(library.name, library)
        self.regulation_group_libarary_selection.setCurrentIndex(self.regulation_group_libarary_selection.count() - 1)

    def _on_new_regulation_group_library_clicked(self):
        library = RegulationGroupLibrary()
        self.new_libraries.append(library)
        self._add_library(library)

    def _on_import_regulation_group_library_clicked(self):
        file_path, _ = QFileDialog.getOpenFileName(self, "Tuo kaavamääräysryhmäkirjasto", "", "YAML files (*.yaml)")
        if file_path:
            # Ask user for confirmation if about to import a library with an existing/duplicate filepath
            if file_path in [library.file_path for library in self._get_current_libraries()]:
                response = QMessageBox.question(
                    None,
                    "Kaavamääräysryhmäkirjaston tuominen",
                    "Valitulle tiedostopolulle on jo määritetty kirjasto. Haluatko silti tuoda kirjaston?",
                    QMessageBox.Yes | QMessageBox.No,
                )
                if response == QMessageBox.No:
                    return

            # Attempt import
            library = RegulationGroupLibrary.from_template_dict(
                data=TemplateManager.read_regulation_group_template_file(file_path),
                library_type=RegulationGroupLibrary.LibraryType.CUSTOM,
                file_path=str(file_path),
            )
            if library.status:
                self._add_library(library)
            else:
                QMessageBox.critical(
                    self,
                    "Virhe",
                    "Valitun tiedoston lukeminen kaavamääräysryhmäkirjastoksi epäonnistui.",
                )

    def _on_delete_regulation_group_library_clicked(self):
        if not self.active_library:
            return

        # If we are deleting a new and empty library, skip asking for confirmation to delete
        if self._is_new_library(self.active_library) and len(self.active_library.regulation_groups) == 0:
            self._delete_library(self.active_library)
            return

        response = QMessageBox.question(
            None,
            "Kaavamääräysryhmäkirjaston poisto",
            "Haluatko varmasti poistaa kaavamääräysryhmäkirjaston?",
            QMessageBox.Yes | QMessageBox.No,
        )
        if response == QMessageBox.Yes:
            self._delete_library(self.active_library)

    def _delete_library(self, library: RegulationGroupLibrary):
        if id(library) in [id(library) for library in self.custom_regulation_group_libraries]:
            self.deleted_libraries.append(library)

        self.regulation_group_libarary_selection.removeItem(self.regulation_group_libarary_selection.currentIndex())

    def _is_new_library(self, library: RegulationGroupLibrary) -> bool:
        return id(library) in [id(_library) for _library in self.new_libraries]

    # TEMPLATES
    def _get_current_libraries(self) -> list[RegulationGroupLibrary]:
        return [
            self.regulation_group_libarary_selection.itemData(i, DATA_ROLE)
            for i in range(self.regulation_group_libarary_selection.count())
        ]

    def _add_regulation_group_to_list(self, group: RegulationGroup):
        item = QListWidgetItem(str(group))
        item.setToolTip(
            f"Otsikko: {group.name}\nLyhyt nimi: {group.short_name}\n"
            f"Kategoria: {group.category}\nKaavamääräysten määrä: {len(group.regulations)}"
        )
        item.setData(DATA_ROLE, group)
        self.regulation_group_templates_list.addItem(item)

    def _filter_regulation_groups(self) -> None:
        search_text = self.regulation_group_templates_filter.value().lower()
        for index in range(self.regulation_group_templates_list.count()):
            item = self.regulation_group_templates_list.item(index)
            item.setHidden(search_text not in item.text().lower())

    def _update_active_library_templates_from_view(self):
        """Reconstruct active library's regulation group templates from all remaining list items."""
        if not self.active_library:
            return

        self.active_library.regulation_groups = [
            self.regulation_group_templates_list.item(i).data(DATA_ROLE)
            for i in range(self.regulation_group_templates_list.count())
        ]

    def _update_template_view(self):
        self.regulation_group_templates_list.clear()
        if not self.active_library:
            return

        for group in self.active_library.regulation_groups:
            self._add_regulation_group_to_list(group)
        self._filter_regulation_groups()

    def _on_new_regulation_group_template_clicked(self):
        if not self.active_library:
            return

        form = PlanRegulationGroupForm(RegulationGroup(), None)
        form.setWindowTitle("Luo kaavamääräysryhmäpohja")
        if form.exec_():
            new_regulation_group_template = form.model
            # Use intended feature type as category for now
            # NOTE: This should probably be changed and user let to choose their own category names
            new_regulation_group_template.category = form.type_of_regulation_group.currentText()
            self._add_regulation_group_to_list(form.model)

            self._update_active_library_templates_from_view()

    def _on_edit_regulation_group_template_clicked(self):
        selected_items = self.regulation_group_templates_list.selectedItems()
        if len(selected_items) == 0:
            return
        if len(selected_items) > 1:
            iface.messageBar().pushWarning(
                "", "Valitse vain yksi kaavamääräysryhmäpohja kerrallaan muokkaamista varten."
            )
            return

        selected_item = selected_items[0]
        group = selected_item.data(DATA_ROLE)

        form = PlanRegulationGroupForm(group, None)
        form.setWindowTitle("Muokkaa kaavamääräysryhmäpohjaa")
        if form.exec_():
            selected_item.setData(DATA_ROLE, form.model)

            self._update_active_library_templates_from_view()
            self._update_template_view()

    def _on_delete_regulation_group_templates_clicked(self):
        selected_items = self.regulation_group_templates_list.selectedItems()
        if len(selected_items) == 0:
            return

        if len(selected_items) == 1:
            title = "Kaavamääräysryhmäpohjan poisto"
            text = "Haluatko varmasti poistaa kaavamääräysryhmäpohjan?"
        else:
            title = "Kaavamääräysryhmäpohjien poisto"
            text = "Haluatko varmasti poistaa kaavamääräysryhmäpohjat?"

        if QMessageBox.question(None, title, text, QMessageBox.Yes | QMessageBox.No) == QMessageBox.Yes:
            # Remove selected items from list view
            for item in selected_items:
                self.regulation_group_templates_list.takeItem(self.regulation_group_templates_list.row(item))

            self._update_active_library_templates_from_view()

    def _check_form(self) -> bool:
        file_paths = set()
        for library in self._get_current_libraries():
            # Check for duplicate filepaths
            if library.file_path in file_paths:
                QMessageBox.critical(
                    self,
                    "Virhe",
                    f"Useammalle kaavamääräysryhmäkirjastolle on määritelty sama tallennuspolku ({library.file_path}).",
                )
                return False
            file_paths.add(library.file_path)

        return True

    def _on_ok_clicked(self):
        if self._check_form():
            self.custom_regulation_group_libraries = self._get_current_libraries()
            self.accept()
