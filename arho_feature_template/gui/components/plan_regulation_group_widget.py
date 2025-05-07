from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtCore import pyqtSignal
from qgis.PyQt.QtGui import QIcon, QPixmap
from qgis.PyQt.QtWidgets import QHBoxLayout, QLabel, QSizePolicy, QWidget

from arho_feature_template.core.models import PlanFeature, Proposition, Regulation, RegulationGroup
from arho_feature_template.exceptions import LayerNameNotFoundError
from arho_feature_template.gui.components.plan_proposition_widget import PropositionWidget
from arho_feature_template.gui.components.plan_regulation_widget import RegulationWidget
from arho_feature_template.project.layers.code_layers import PlanRegulationGroupTypeLayer
from arho_feature_template.project.layers.plan_layers import RegulationGroupAssociationLayer
from arho_feature_template.qgis_plugin_tools.tools.resources import resources_path

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QFormLayout, QFrame, QLineEdit, QPushButton

ui_path = resources.files(__package__) / "plan_regulation_group_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)


class RegulationGroupWidget(QWidget, FormClass):  # type: ignore
    """A widget representation of a plan regulation group."""

    open_as_form_signal = pyqtSignal(QWidget)
    delete_signal = pyqtSignal(QWidget)

    def __init__(self, regulation_group: RegulationGroup, plan_feature: PlanFeature):
        super().__init__()
        self.setupUi(self)

        # TYPES
        self.frame: QFrame
        self.name: QLineEdit
        self.short_name: QLineEdit
        self.short_name_label: QLabel
        self.edit_btn: QPushButton
        self.del_btn: QPushButton
        self.regulation_group_details_layout: QFormLayout

        # INIT
        self.frame.setObjectName("frame")  # Set unique name to avoid style cascading
        self.regulation_widgets: list[RegulationWidget] = []
        self.proposition_widgets: list[PropositionWidget] = []
        self.link_label_icon: QLabel | None = None
        self.link_label_text: QLabel | None = None

        self.plan_feature = plan_feature
        if not plan_feature.layer_name:
            msg = "Layer name not found when creating regulation group widget!"
            raise LayerNameNotFoundError(msg)
        self.layer_name = plan_feature.layer_name

        self.from_model(regulation_group)
        self.regulation_group.type_code_id = PlanRegulationGroupTypeLayer.get_id_by_feature_layer_name(self.layer_name)

        self.edit_btn.setIcon(QIcon(resources_path("icons", "settings.svg")))
        self.edit_btn.clicked.connect(lambda: self.open_as_form_signal.emit(self))
        self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.del_btn.clicked.connect(lambda: self.delete_signal.emit(self))

    def from_model(self, regulation_group: RegulationGroup):
        self.regulation_group = regulation_group

        self.name.setText(regulation_group.name if regulation_group.name else "")
        self.short_name.setText(regulation_group.short_name if regulation_group.short_name else "")

        # Remove existing child widgets if reinitializing
        for widget in self.regulation_widgets:
            self.delete_regulation_widget(widget)
        for widget in self.proposition_widgets:
            self.delete_proposition_widget(widget)
        for regulation in regulation_group.regulations:
            self.add_regulation_widget(regulation)
        for proposition in regulation_group.propositions:
            self.add_proposition_widget(proposition)

        # Remove existing indicators if reinitializing
        self.unset_existing_regulation_group_style()

        if regulation_group.id_:
            if self.plan_feature.id_ is None:
                other_linked_features_count = len(
                    list(RegulationGroupAssociationLayer.get_associations_for_regulation_group(regulation_group.id_))
                )
            else:
                other_linked_features_count = len(
                    RegulationGroupAssociationLayer.get_associations_for_regulation_group_exclude_feature(
                        regulation_group.id_, self.plan_feature.id_, self.layer_name
                    )
                )
            if other_linked_features_count > 0:
                # Set indicators that regulation group exists in the plan already and is assigned for other features
                self.set_existing_regulation_group_style(other_linked_features_count)

    def add_regulation_widget(self, regulation: Regulation) -> RegulationWidget:
        widget = RegulationWidget(regulation=regulation, parent=self.frame)
        widget.delete_signal.connect(self.delete_regulation_widget)
        self.frame.layout().addWidget(widget)
        self.regulation_widgets.append(widget)
        return widget

    def delete_regulation_widget(self, regulation_widget: RegulationWidget):
        self.frame.layout().removeWidget(regulation_widget)
        self.regulation_widgets.remove(regulation_widget)
        regulation_widget.deleteLater()

    def add_proposition_widget(self, proposition: Proposition) -> PropositionWidget:
        widget = PropositionWidget(proposition=proposition, parent=self.frame)
        widget.delete_signal.connect(self.delete_proposition_widget)
        self.frame.layout().addWidget(widget)
        self.proposition_widgets.append(widget)
        return widget

    def delete_proposition_widget(self, proposition_widget: RegulationWidget):
        self.frame.layout().removeWidget(proposition_widget)
        self.proposition_widgets.remove(proposition_widget)
        proposition_widget.deleteLater()

    def set_existing_regulation_group_style(self, other_linked_features_count: int):
        tooltip = (
            "Kaavamääräysryhmä on tallennettu kaavaan. Ryhmän tietojen muokkaaminen vaikuttaa muihin "
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
        self.link_label_text.setText(
            f"Kaavamääräysryhmä on käytössä myös {other_linked_features_count} toisella kaavakohteella"
        )
        self.link_label_text.setWordWrap(True)
        self.link_label_text.setStyleSheet("#text_label { color: #4b8db2; }")
        self.link_label_text.setToolTip(tooltip)
        layout.addWidget(self.link_label_text)

        self.frame.layout().insertLayout(1, layout)

        self.setStyleSheet("#frame { border: 2px solid #4b8db2; }")

    def unset_existing_regulation_group_style(self):
        if self.link_label_icon:
            self.link_label_icon.deleteLater()
            self.link_label_icon = None

        if self.link_label_text:
            self.link_label_text.deleteLater()
            self.link_label_text = None

        self.setStyleSheet("")

    def into_model(self) -> RegulationGroup:
        model = RegulationGroup(
            type_code_id=self.regulation_group.type_code_id,
            name=self.name.text(),
            short_name=self.short_name.text(),
            color_code=self.regulation_group.color_code,
            regulations=[widget.into_model() for widget in self.regulation_widgets],
            propositions=[widget.into_model() for widget in self.proposition_widgets],
            modified=self.regulation_group.modified,
            id_=self.regulation_group.id_,
        )
        if not model.modified and model != self.regulation_group:
            model.modified = True

        return model
