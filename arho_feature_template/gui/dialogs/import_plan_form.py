import json
from importlib import resources
from typing import TYPE_CHECKING

from qgis.PyQt import uic
from qgis.PyQt.QtWidgets import QDialog, QDialogButtonBox

from arho_feature_template.core.lambda_service import LambdaService
from arho_feature_template.utils.misc_utils import iface

ui_path = resources.files(__package__) / "import_plan_form.ui"
FormClass, _ = uic.loadUiType(ui_path)

if TYPE_CHECKING:
    from qgis.gui import QgsFileWidget


class ImportPlanForm(QDialog, FormClass):  # type: ignore
    def __init__(self):
        super().__init__()
        self.setupUi(self)

        # TYPES
        self.file_selection: QgsFileWidget
        self.button_box: QDialogButtonBox

        # INIT
        self.button_box.button(QDialogButtonBox.Ok).setText("Import")
        self.button_box.accepted.connect(self.import_plan)
        self.button_box.rejected.connect(self.reject)

        self.lambda_service = LambdaService()

    def import_plan(self):
        if not self.file_selection:
            return

        file_path = self.file_selection.filePath()

        if ".json" not in file_path:
            iface.messageBar().pushWarning("", "Kaava-tiedoston tulee olla JSON-tiedosto.")

        with open(file_path) as file:
            data = json.load(file)

        payload = {"action": "import_plan", "data": data}
        self.lambda_service.import_plan(payload)
