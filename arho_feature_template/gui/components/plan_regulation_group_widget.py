from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.PyQt import uic
from qgis.PyQt.QtCore import Qt, QTimer, pyqtSignal
from qgis.PyQt.QtGui import QIcon, QMouseEvent, QPixmap
from qgis.PyQt.QtWidgets import QHBoxLayout, QLabel, QPushButton, QSizePolicy, QToolButton, QWidget

from arho_feature_template.exceptions import LayerNameNotFoundError
from arho_feature_template.project.layers.code_layers import PlanRegulationGroupTypeLayer
from arho_feature_template.project.layers.plan_layers import RegulationGroupAssociationLayer
from arho_feature_template.qgis_plugin_tools.tools.resources import resources_path

if TYPE_CHECKING:
    from qgis.PyQt.QtWidgets import QFrame

    from arho_feature_template.core.models import PlanFeature, Proposition, Regulation, RegulationGroup
    from arho_feature_template.gui.components.plan_proposition_widget import PropositionWidget
    from arho_feature_template.gui.components.plan_regulation_widget import RegulationWidget

ui_path = resources.files(__package__) / "plan_regulation_group_widget.ui"
FormClass, _ = uic.loadUiType(ui_path)


USE_BUTTONS = True


class RegulationGroupWidget(QWidget, FormClass):  # type: ignore
    """A widget representation of a plan regulation group."""

    open_as_form_signal = pyqtSignal(QWidget)
    delete_signal = pyqtSignal(QWidget)

    def __init__(self, regulation_group: RegulationGroup, plan_feature: PlanFeature):
        super().__init__()
        self.setupUi(self)

        # TYPES
        self.frame: QFrame
        self.name_label: QLabel
        self.edit_btn: QPushButton
        self.del_btn: QPushButton
        self.expand_hide_btn: QToolButton

        # INIT
        self.frame.setObjectName("frame")  # Set unique name to avoid style cascading
        self.regulation_widgets: list[RegulationWidget] = []
        self.proposition_widgets: list[PropositionWidget] = []
        self.link_label_icon: QLabel | None = None
        self.link_label_text: QLabel | None = None
        self.widgets: list[QWidget] = []
        self.expanded: bool = True

        self.click_timer = QTimer()
        self.click_timer.setSingleShot(True)
        self.click_timer.timeout.connect(self._handle_single_click)

        self.plan_feature = plan_feature
        if not plan_feature.layer_name:
            msg = "Layer name not found when creating regulation group widget!"
            raise LayerNameNotFoundError(msg)
        self.layer_name = plan_feature.layer_name

        self.from_model(regulation_group)
        self.regulation_group.type_code_id = PlanRegulationGroupTypeLayer.get_id_by_feature_layer_name(self.layer_name)

        # self.edit_btn.setIcon(QIcon(resources_path("icons", "settings.svg")))
        self.edit_btn.setIcon(QIcon(resources_path("icons", "open_icon.png")))
        self.edit_btn.clicked.connect(lambda: self.open_as_form_signal.emit(self))
        self.del_btn.setIcon(QgsApplication.getThemeIcon("mActionDeleteSelected.svg"))
        self.del_btn.clicked.connect(lambda: self.delete_signal.emit(self))
        self.expand_hide_btn.clicked.connect(self._on_expand_hide_btn_clicked)

        self._on_expand_hide_btn_clicked()

    def from_model(self, regulation_group: RegulationGroup):
        self.regulation_group = regulation_group

        # self.heading.setText(regulation_group.heading if regulation_group.heading else "")
        # self.letter_code.setText(regulation_group.letter_code if regulation_group.letter_code else "")
        self.name_label.setText(str(regulation_group))

        # Clear contents if reinitializing
        for widget in self.widgets:
            widget.deleteLater()
        self.widgets.clear()

        for regulation in regulation_group.regulations:
            self.add_regulation(regulation)
        for proposition in regulation_group.propositions:
            self.add_proposition(proposition)

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

    def mousePressEvent(self, event: QMouseEvent):  # noqa: N802
        if self._clicked_on_child(event):
            event.ignore()
            return

        # Start timer to detect single click
        self._double_clicked = False
        self.click_timer.start(QgsApplication.instance().doubleClickInterval())
        event.accept()

    def mouseDoubleClickEvent(self, event: QMouseEvent):  # noqa: N802
        if self._clicked_on_child(event):
            event.ignore()
            return

        # Cancel single click timer
        self._double_clicked = True
        self.click_timer.stop()
        self._handle_double_click()
        event.accept()

    def _clicked_on_child(self, event: QMouseEvent):
        widget = self.childAt(event.pos())
        return widget is not None and widget not in [self.frame, self.name_label]

    def _handle_single_click(self):
        if not self._double_clicked:
            self._on_expand_hide_btn_clicked()

    def _handle_double_click(self):
        self.open_as_form_signal.emit(self)

    def _on_expand_hide_btn_clicked(self):
        if self.expanded:
            self.hide_children()
        else:
            self.expand_children()

    def expand_children(self):
        for widget in self.widgets:
            widget.show()
        self.expand_hide_btn.setArrowType(Qt.ArrowType.UpArrow)
        self.expanded = True

    def hide_children(self):
        for widget in self.widgets:
            widget.hide()
        self.expand_hide_btn.setArrowType(Qt.ArrowType.DownArrow)
        self.expanded = False

    def add_regulation(self, regulation: Regulation):
        if USE_BUTTONS:
            widg = QPushButton(text=f"- Kaavaamääräys: {regulation.name()}", parent=self.frame)
            widg.setStyleSheet("""
                QPushButton {
                    background: transparent;
                    border: none;
                    border-radius: 6px;
                    padding: 3px 5px;
                    text-align: left;
                    color: black;
                }
                QPushButton:hover {
                    border: 1px solid #5c5c5c;
                    background-color: rgba(0, 0, 0, 3%);
                }
                QPushButton:pressed {
                    background-color: rgba(0, 0, 0, 10%);
                }
            """)
        else:
            widg = QLabel(text=f"- Kaavaamääräys: {regulation.name()}", parent=self.frame)
        widg.setToolTip(regulation.describe())
        self.frame.layout().addWidget(widg)
        self.widgets.append(widg)

    def add_proposition(self, proposition: Proposition):
        if USE_BUTTONS:
            widg = QPushButton(text="- Kaavaasuositus", parent=self.frame)
            widg.setStyleSheet("""
                QPushButton {
                    background: transparent;
                    border: none;
                    border-radius: 6px;
                    padding: 3px 5px;
                    text-align: left;
                    color: black;
                }
                QPushButton:hover {
                    border: 1px solid #5c5c5c;
                    background-color: rgba(0, 0, 0, 3%);
                }
                QPushButton:pressed {
                    background-color: rgba(0, 0, 0, 10%);
                }
            """)
        else:
            widg = QLabel(text="- Kaavaasuositus", parent=self.frame)
        widg.setToolTip(proposition.describe())
        self.frame.layout().addWidget(widg)
        self.widgets.append(widg)

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
        # Regulation group cannot be modified in the widget so we return what was given
        return self.regulation_group
