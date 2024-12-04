from importlib import resources

from qgis.PyQt import uic
from qgis.PyQt.QtCore import QSettings
from qgis.PyQt.QtWidgets import QDialog

ui_path = resources.files(__package__) / "plugin_settings.ui"
FormClass, _ = uic.loadUiType(ui_path)


class PluginSettings(QDialog, FormClass):  # type: ignore
    def __init__(self, parent=None):
        super().__init__(parent)

        self.setupUi(self)

        self.saveButton.clicked.connect(self.save_settings)

        self.load_settings()

    def load_settings(self):
        """Load settings from QSettings with default values."""
        settings = QSettings("ArhoFeatureTemplate")

        proxy_host = settings.value("proxy_host", "localhost")
        proxy_port = settings.value("proxy_port", "5443")
        lambda_url = settings.value("lambda_url", "https://t5w26iqnsf.execute-api.eu-central-1.amazonaws.com/v0/ryhti")

        self.hostInput.setText(proxy_host)
        self.portInput.setText(proxy_port)
        self.lambdaInput.setText(lambda_url)

    def save_settings(self):
        """Save settings to QSettings."""
        settings = QSettings("ArhoFeatureTemplate")
        settings.setValue("proxy_host", self.hostInput.text())
        settings.setValue("proxy_port", self.portInput.text())
        settings.setValue("lambda_url", self.lambdaInput.text())

        self.accept()
