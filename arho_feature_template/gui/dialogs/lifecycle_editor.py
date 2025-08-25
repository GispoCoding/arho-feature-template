from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

from qgis.core import QgsApplication
from qgis.gui import QgsDateTimeEdit
from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import (
    QDateEdit,
    QDialog,
    QDialogButtonBox,
    QFormLayout,
    QGroupBox,
    QLabel,
    QPushButton,
    QVBoxLayout,
)

from arho_feature_template.core.models import EventDate
from arho_feature_template.gui.components.lifecycle_table_widget import LifecycleTableWidget
from arho_feature_template.project.layers.code_layers import (
    InteractionEventTypeLayer,
    LifeCycleStatusLayer,
    PlanDecisionNameLayer,
    ProcessingEventTypeLayer,
)

if TYPE_CHECKING:
    from arho_feature_template.core.models import Plan

ui_path = resources.files(__package__) / "lifecycle_editor.ui"
FormClass, _ = uic.loadUiType(ui_path)

DEBUG_CATEGORY = "ArhoFeatureTemplateDebug"


class LifecycleEditor(QDialog, FormClass):  # type: ignore
    add_lifecycle_button: QPushButton
    button_box: QDialogButtonBox

    def __init__(self, plan: Plan, parent=None):
        super().__init__(parent)
        self.setupUi(self)

        self.plan = plan
        if not self.plan:
            self.reject()
            return

        # Define status-event mappings
        self.DECISIONS_BY_STATUS = {
            "Vireilletullut": ["01", "02", "03"],
            "Valmistelu": ["04", "05", "06"],
            "Kaavaehdoitus": ["08"],
            "Muutettu kaavaehdoitus": ["07", "09"],
            "Hyväksytty kaava": ["11A"],
            "Valituksen alainen": ["12", "13", "15"],
        }

        self.PROCESSING_EVENTS_BY_STATUS = {
            "Vireilletullut": ["04"],
            "Valmistelu": ["05", "06"],
            "Kaavaehdoitus": ["07", "08"],
            "Muutettu kaavaehdoitus": ["08", "09"],
            "Hyväksytty kaava": ["11"],
            "Voimassa ennen kaavan lainvoimaisuutta": ["13"],
            "Voimassa": ["16"],
        }

        self.INTERACTION_EVENTS_BY_STATUS = {
            "Valmistelu": ["01"],
            "Kaavaehdoitus": ["01"],
            "Muutettu kaavaehdoitus": ["01", "02"],
        }

        # Lifecycle table
        self.lifecycle_table = LifecycleTableWidget(self.plan.lifecycles)
        self.layout().insertWidget(1, self.lifecycle_table)  # below add button
        self.add_lifecycle_button.setIcon(QgsApplication.getThemeIcon("mActionAdd.svg"))
        self.add_lifecycle_button.clicked.connect(self.lifecycle_table.add_new_lifecycle_row)
        self.lifecycle_table.table_edited.connect(self._check_required_fields)
        self.lifecycle_table.itemSelectionChanged.connect(self._on_lifecycle_row_selected)

        # Button box
        self.button_box.accepted.connect(self._on_ok_clicked)
        self.button_box.rejected.connect(self.reject)
        self.button_box.button(QDialogButtonBox.Ok).setEnabled(False)

        # Widgets for required dates
        self.lifecycle_event_widgets: dict[str | None, QGroupBox] = {}
        self.date_widgets_by_lifecycle_id: dict[str | None, dict[str, QDateEdit]] = {}

        self.required_dates_group_box = QGroupBox("Vaadittavat päivämäärät")
        self.required_dates_group_box.setLayout(QVBoxLayout())
        self.required_dates_group_box.hide()
        self.layout().insertWidget(self.layout().count() - 1, self.required_dates_group_box)
        self.current_lifecycle_id: str | None = None

        # Initialize required date widgets for all lifecycles
        self._initialize_required_date_widgets()

    def _initialize_required_date_widgets(self):
        if not hasattr(self, "required_dates_group_box"):
            self.required_dates_group_box = QGroupBox("Vaadittavat päivämäärät")
            self.required_dates_group_box.setLayout(QVBoxLayout())
            self.required_dates_group_box.hide()
            self.layout().insertWidget(1, self.required_dates_group_box)

        # Iterate over lifecycles and create sub-group boxes
        for lifecycle in self.plan.lifecycles:
            lifecycle_id = lifecycle.id_
            if not lifecycle_id:
                continue

            status_id = lifecycle.status_id
            status_name = LifeCycleStatusLayer.get_status_name(status_id)
            if not status_name:
                continue

            groupbox = QGroupBox()
            layout = QFormLayout()
            groupbox.setLayout(layout)
            groupbox.hide()  # hidden by default
            self.lifecycle_event_widgets[lifecycle_id] = groupbox
            self.required_dates_group_box.layout().addWidget(groupbox)

            date_widgets: dict[str, QDateEdit] = {}

            # Create decision date widgets
            for code in self.DECISIONS_BY_STATUS.get(status_name, []):
                desc = PlanDecisionNameLayer.get_plan_decision_name(code)
                date_edit = self._create_date_edit()
                layout.addRow(QLabel(desc or code), date_edit)
                date_widgets[f"decision:{code}"] = date_edit

            # Create processing date widgets
            for code in self.PROCESSING_EVENTS_BY_STATUS.get(status_name, []):
                desc = ProcessingEventTypeLayer.get_processing_event_type_name(code)
                date_edit = self._create_date_edit()
                layout.addRow(QLabel(desc or code), date_edit)
                date_widgets[f"processing:{code}"] = date_edit

            # Create interaction date widgets
            for code in self.INTERACTION_EVENTS_BY_STATUS.get(status_name, []):
                desc = InteractionEventTypeLayer.get_interaction_event_type_name(code)
                date_edit = self._create_date_edit()
                layout.addRow(QLabel(desc or code), date_edit)
                date_widgets[f"interaction:{code}"] = date_edit

            # Populate existing EventDates
            for ed in lifecycle.event_dates:
                key = None
                if ed.decision_id:
                    code = PlanDecisionNameLayer.get_code(ed.decision_id)
                    key = f"decision:{code}"
                elif ed.processing_event_id:
                    code = ProcessingEventTypeLayer.get_code(ed.processing_event_id)
                    key = f"processing:{code}"
                elif ed.interaction_event_id:
                    code = InteractionEventTypeLayer.get_code(ed.interaction_event_id)
                    key = f"interaction:{code}"
                else:
                    continue

                if key in date_widgets and ed.starting_at:
                    date_widgets[key].setDate(ed.starting_at)
                    if ed.id_:
                        date_widgets[key].setProperty("original_event_date_id", ed.id_)
                        date_widgets[key].setProperty("original_starting_at_date", ed.starting_at)

            self.date_widgets_by_lifecycle_id[lifecycle_id] = date_widgets

    def _create_date_edit(self) -> QgsDateTimeEdit:
        date_edit = QgsDateTimeEdit()
        date_edit.setDisplayFormat("yyyy-MM-dd")
        date_edit.setCalendarPopup(True)
        date_edit.setSpecialValueText("")
        date_edit.setAllowNull(True)
        date_edit.clear()
        date_edit.dateChanged.connect(self._check_required_fields)
        return date_edit

    def _on_lifecycle_row_selected(self):
        selected_rows = self.lifecycle_table.selectionModel().selectedRows()
        if not selected_rows:
            self.required_dates_group_box.hide()
            self.current_lifecycle_id = None
            return

        row_index = selected_rows[0].row()
        lifecycle = self.lifecycle_table.get_lifecycle_at(row_index)
        self.current_lifecycle_id = lifecycle.id_

        for widget_id, widget in self.lifecycle_event_widgets.items():
            if widget_id != self.current_lifecycle_id:
                widget.hide()

        widget = self.lifecycle_event_widgets.get(self.current_lifecycle_id)
        if widget and widget.layout().rowCount() > 0:
            widget.show()
            self.required_dates_group_box.show()
        else:
            self.required_dates_group_box.hide()

    def _get_all_event_dates_from_widgets(self) -> dict[str | None, list[EventDate]]:
        all_event_dates_by_lifecycle_id: dict[str | None, list[EventDate]] = {}

        for lifecycle_id, widgets_for_lifecycle in self.date_widgets_by_lifecycle_id.items():
            event_dates_for_current_lifecycle: list[EventDate] = []

            for key, widget in widgets_for_lifecycle.items():
                current_date = widget.date()
                original_event_date_id = widget.property("original_event_date_id")
                original_starting_at_date = widget.property("original_starting_at_date")

                # Skip empty dates entirely
                if not current_date.isValid():
                    continue

                modified_flag = (
                    original_event_date_id is None
                    or (original_starting_at_date is None and current_date.isValid())
                    or (original_starting_at_date is not None and original_starting_at_date != current_date)
                )

                # Build EventDate based on key type
                if key.startswith("decision:"):
                    code = key.split(":", 1)[1]
                    event_dates_for_current_lifecycle.append(
                        EventDate(
                            id_=original_event_date_id,
                            starting_at=current_date,
                            decision_id=PlanDecisionNameLayer.get_id(code),
                            processing_event_id=None,
                            interaction_event_id=None,
                            lifecycle_date_id=lifecycle_id,  # type: ignore[arg-type]
                            modified=modified_flag,
                        )
                    )
                elif key.startswith("processing:"):
                    code = key.split(":", 1)[1]
                    event_dates_for_current_lifecycle.append(
                        EventDate(
                            id_=original_event_date_id,
                            starting_at=current_date,
                            processing_event_id=ProcessingEventTypeLayer.get_id(code),
                            lifecycle_date_id=lifecycle_id,  # type: ignore[arg-type]
                            decision_id=None,
                            interaction_event_id=None,
                            modified=modified_flag,
                        )
                    )
                elif key.startswith("interaction:"):
                    code = key.split(":", 1)[1]
                    event_dates_for_current_lifecycle.append(
                        EventDate(
                            id_=original_event_date_id,
                            starting_at=current_date,
                            interaction_event_id=InteractionEventTypeLayer.get_id(code),
                            lifecycle_date_id=lifecycle_id,  # type: ignore[arg-type]
                            decision_id=None,
                            processing_event_id=None,
                            modified=modified_flag,
                        )
                    )

            if event_dates_for_current_lifecycle:
                all_event_dates_by_lifecycle_id[lifecycle_id] = event_dates_for_current_lifecycle

        return all_event_dates_by_lifecycle_id

    def _check_required_fields(self) -> None:
        ok_button = self.button_box.button(QDialogButtonBox.Ok)
        is_ok = self.lifecycle_table.is_ok()
        ok_button.setEnabled(is_ok)

    def _on_ok_clicked(self):
        all_event_dates_map = self._get_all_event_dates_from_widgets()
        lifecycles_from_table = self.lifecycle_table.into_model()
        for lc in lifecycles_from_table:
            if lc.id_ in all_event_dates_map:
                lc.event_dates = all_event_dates_map[lc.id_]

                # Mark lifecycle as modified, if just event_dates are modified.
                if any(ed.modified for ed in lc.event_dates):
                    lc.modified = True

        self.plan.lifecycles = lifecycles_from_table
        self.accept()
