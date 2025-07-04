from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt
from qgis.PyQt.QtGui import QPixmap
from qgis.PyQt.QtWidgets import (
    QDialog,
    QDialogButtonBox,
    QHBoxLayout,
    QLabel,
    QMessageBox,
    QScrollArea,
    QSizePolicy,
    QSplitter,
    QTextBrowser,
    QTreeWidgetItem,
    QVBoxLayout,
)

from arho_feature_template.core.models import (
    Proposition,
    Regulation,
    RegulationConfig,
    RegulationGroup,
    RegulationGroupLibrary,
    RegulationLibrary,
)
from arho_feature_template.gui.components.plan_proposition_widget import PropositionWidget
from arho_feature_template.gui.components.plan_regulation_widget import RegulationWidget
from arho_feature_template.gui.components.tree_with_search_widget import TreeWithSearchWidget
from arho_feature_template.project.layers.code_layers import PlanRegulationGroupTypeLayer
from arho_feature_template.project.layers.plan_layers import RegulationGroupAssociationLayer
from arho_feature_template.qgis_plugin_tools.tools.resources import resources_path

if TYPE_CHECKING:
    from qgis.gui import QgsSpinBox
    from qgis.PyQt.QtWidgets import QBoxLayout, QLineEdit, QPushButton, QWidget

    from arho_feature_template.gui.components.code_combobox import CodeComboBox

ui_path = resources.files(__package__) / "plan_regulation_group_form.ui"
FormClass, _ = uic.loadUiType(ui_path)


class PlanRegulationGroupForm(QDialog, FormClass):  # type: ignore
    """Form to create a new plan regulation group."""

    def __init__(
        self,
        regulation_group: RegulationGroup,
        active_plan_regulation_groups_library: RegulationGroupLibrary | None,
    ):
        super().__init__()
        self.setupUi(self)

        # TYPES
        self.heading: QLineEdit
        self.letter_code: QLineEdit
        self.group_number: QgsSpinBox
        self.color_code: QLineEdit
        self.type_of_regulation_group: CodeComboBox

        self.regulations_tab: QWidget
        self.libraries_widget: QWidget
        self.regulations_scroll_area: QScrollArea

        self.regulations_scroll_area_contents: QWidget
        self.regulations_layout: QBoxLayout
        self.regulation_info: QTextBrowser

        self.regulation_group_info_tab: QWidget

        self.propositions_layout: QVBoxLayout
        self.propositions_scroll_contents: QWidget
        self.add_proposition_btn: QPushButton

        self.button_box: QDialogButtonBox

        # INIT
        self.regulations_tab.layout().removeWidget(self.libraries_widget)
        self.regulations_tab.layout().removeWidget(self.regulations_scroll_area)
        splitter = QSplitter(self.regulations_tab)
        splitter.addWidget(self.libraries_widget)
        splitter.addWidget(self.regulations_scroll_area)
        splitter.setSizes([300, 540])
        self.regulations_tab.layout().addWidget(splitter)

        self.regulation_group = regulation_group
        self.regulation_widgets: list[RegulationWidget] = []
        self.proposition_widgets: list[PropositionWidget] = []

        if active_plan_regulation_groups_library:
            self.existing_group_letter_codes = active_plan_regulation_groups_library.get_letter_codes()
        else:
            self.existing_group_letter_codes = set()

        # Initialize regulation library
        self.regulations_selection_widget = TreeWithSearchWidget()
        self.libraries_widget.layout().insertWidget(1, self.regulations_selection_widget)
        self.regulations_selection_widget.tree.itemDoubleClicked.connect(self.add_selected_regulation)
        self.regulations_selection_widget.tree.itemClicked.connect(self.update_selected_regulation)
        for config in RegulationLibrary.get_regulations():
            self._initalize_regulation_from_config(config)

        self.type_of_regulation_group.populate_from_code_layer(PlanRegulationGroupTypeLayer)
        self.type_of_regulation_group.remove_item_by_text("NULL")
        self.type_of_regulation_group.remove_item_by_text("Yleismääräykset")

        self.add_proposition_btn.clicked.connect(self.add_new_proposition)
        self.add_proposition_btn.setIcon(QgsApplication.getThemeIcon("mActionAdd.svg"))

        self.button_box.accepted.connect(self._on_ok_clicked)

        # Initialize from model
        self.heading.setText(self.regulation_group.heading if self.regulation_group.heading else "")
        self.letter_code.setText(self.regulation_group.letter_code if self.regulation_group.letter_code else "")
        self.group_number.setValue(self.regulation_group.group_number if self.regulation_group.group_number else 0)
        self.color_code.setText(self.regulation_group.color_code if self.regulation_group.color_code else "")
        self.type_of_regulation_group.set_value(self.regulation_group.type_code_id)

        for regulation in self.regulation_group.regulations:
            self.add_regulation(regulation)

        for proposition in self.regulation_group.propositions:
            self.add_proposition(proposition)

        if self.regulation_group.id_:
            feat_count = len(
                list(RegulationGroupAssociationLayer.get_associations_for_regulation_group(self.regulation_group.id_))
            )
            tooltip = (
                "Kaavamääräysryhmä on tallennettu kaavaan. Ryhmän tietojen muokkaaminen vaikuttaa "
                "kaavakohteisiin, joille ryhmä on lisätty."
            )
            layout = QHBoxLayout()

            self.link_label_icon = QLabel()
            self.link_label_icon.setSizePolicy(QSizePolicy.Maximum, QSizePolicy.Fixed)
            self.link_label_icon.setPixmap(QPixmap(resources_path("icons", "linked_img_small.png")))
            self.link_label_icon.setToolTip(tooltip)
            layout.addWidget(self.link_label_icon)

            self.link_label_text = QLabel()
            self.link_label_text.setObjectName("text_label")  # Set unique name to avoid style cascading
            self.link_label_text.setText(f"Kaavamääräysryhmä on käytössä yhteensä {feat_count} kaavakohteella")
            self.link_label_text.setWordWrap(True)
            self.link_label_text.setStyleSheet("#text_label { color: #4b8db2; }")
            self.link_label_text.setToolTip(tooltip)
            layout.addWidget(self.link_label_text)

            self.regulation_group_info_tab.layout().insertLayout(1, layout)
            self.setWindowTitle("Muokkaa kaavamääräysryhmää")

    def _initalize_regulation_from_config(self, config: RegulationConfig, parent: QTreeWidgetItem | None = None):
        item = self.regulations_selection_widget.add_item_to_tree(config.name, config, parent)

        # Initialize plan regulations recursively
        for child_config in config.child_regulations:
            self._initalize_regulation_from_config(child_config, item)

    def _check_letter_code(self) -> bool:
        letter_code = self.letter_code.text()

        def _is_existing_model_with_unmodified_letter_code(model: RegulationGroup, letter_code: str) -> bool:
            return bool(model.id_ and letter_code == model.letter_code)

        if not letter_code:
            return True
        if (
            not _is_existing_model_with_unmodified_letter_code(self.regulation_group, letter_code)
            and letter_code in self.existing_group_letter_codes
        ):
            msg = f"Kaavamääräysryhmä lyhyellä nimellä '<b>{letter_code}</b>' on jo olemassa."
            QMessageBox.critical(self, "Virhe", msg)
            return False
        return True

    def update_selected_regulation(self, item: QTreeWidgetItem, column: int):
        config: RegulationConfig = item.data(column, Qt.UserRole)  # Retrieve the associated config
        self.regulation_info.setText(config.description)

    def add_selected_regulation(self, item: QTreeWidgetItem, column: int):
        config: RegulationConfig = item.data(column, Qt.UserRole)  # Retrieve the associated config
        if config.category_only:
            return
        regulation = Regulation(config=config)
        self.add_regulation(regulation)

    def add_regulation(self, regulation: Regulation):
        widget = RegulationWidget(regulation, parent=self.regulations_scroll_area_contents)
        widget.delete_signal.connect(self.delete_regulation)
        index = self.regulations_layout.count() - 1
        self.regulations_layout.insertWidget(index, widget)
        self.regulation_widgets.append(widget)

    def delete_regulation(self, regulation_widget: RegulationWidget):
        regulation_widget.delete_signal.disconnect()
        self.regulations_layout.removeWidget(regulation_widget)
        self.regulation_widgets.remove(regulation_widget)
        regulation_widget.deleteLater()

    def add_new_proposition(self):
        proposition = Proposition(value="")
        self.add_proposition(proposition)

    def add_proposition(self, proposition: Proposition):
        widget = PropositionWidget(proposition, parent=self.propositions_scroll_contents)
        widget.delete_signal.connect(self.delete_proposition)
        self.propositions_layout.insertWidget(1, widget)
        self.proposition_widgets.append(widget)

    def delete_proposition(self, proposition_widget: PropositionWidget):
        proposition_widget.delete_signal.disconnect()
        self.propositions_layout.removeWidget(proposition_widget)
        self.proposition_widgets.remove(proposition_widget)
        proposition_widget.deleteLater()

    def into_model(self) -> RegulationGroup:
        model = RegulationGroup(
            type_code_id=self.type_of_regulation_group.value(),
            heading=self.heading.text() if self.heading.text() != "" else None,
            letter_code=self.letter_code.text() if self.letter_code.text() != "" else None,
            color_code=self.color_code.text() if self.color_code.text() != "" else None,
            group_number=self.group_number.value() if self.group_number.value() > 0 else None,
            regulations=[widget.into_model() for widget in self.regulation_widgets],
            propositions=[widget.into_model() for widget in self.proposition_widgets],
            modified=self.regulation_group.modified,
            id_=self.regulation_group.id_,
        )
        if not model.modified and model != self.regulation_group:
            model.modified = True

        return model

    def _on_ok_clicked(self):
        if self._check_letter_code():
            self.model = self.into_model()
            self.accept()
