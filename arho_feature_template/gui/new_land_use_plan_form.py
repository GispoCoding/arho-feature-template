from collections import defaultdict
from importlib import resources

from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import QDialog

ui_path = resources.files(__package__) / "new_land_use_plan_form.ui"
FormClass, _ = uic.loadUiType(ui_path)


class NewLandUsePlanForm(QDialog, FormClass):  # type: ignore
    """Dialog for creating a new land use plan with ID, Name, and Type."""

    def __init__(self, parent=None):
        super().__init__(parent)
        self.setupUi(self)

        self.plan_widgets = defaultdict(dict)

        self.plan_widgets["id"] = self.lineEdit_plan_id
        self.plan_widgets["name"] = self.lineEdit_plan_name
        self.plan_widgets["type"] = self.comboBox_plan_type

    @property
    def plan_id(self):
        """Returns the entered Plan ID."""
        return self.lineEdit_plan_id.text()

    @property
    def plan_name(self):
        """Returns the entered Plan Name."""
        return self.lineEdit_plan_name.text()

    @property
    def plan_type(self):
        """Returns the selected Plan Type."""
        return self.comboBox_plan_type.currentText()
