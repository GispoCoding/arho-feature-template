from qgis.PyQt.QtWidgets import QDialog, QVBoxLayout, QLabel, QLineEdit, QPushButton, QMessageBox, QComboBox

class LandUsePlanDialog(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Define Land Use Plan")

        self.layout = QVBoxLayout()

        # ToDo! The id should be automatically set to next available id!!
        self.id_label = QLabel("Plan ID:")
        self.id_input = QLineEdit(self)
        self.layout.addWidget(self.id_label)
        self.layout.addWidget(self.id_input)

        # Input for custom name
        self.name_label = QLabel("Plan Name:")
        self.name_input = QLineEdit(self)
        self.layout.addWidget(self.name_label)
        self.layout.addWidget(self.name_input)

        # Plan type selection
        self.type_label = QLabel("Plan Type:")
        self.type_combo = QComboBox(self)
        self.type_combo.addItems(["Asemakaava", "Maakuntakaava", "Yleiskaava"])
        self.layout.addWidget(self.type_label)
        self.layout.addWidget(self.type_combo)

        self.submit_button = QPushButton("Submit", self)
        self.submit_button.clicked.connect(self.on_submit)
        self.layout.addWidget(self.submit_button)

        self.setLayout(self.layout)

        self.plan_id = None
        self.plan_name = None
        self.plan_type = None

        # Maybe the template should be read here and allow setting values in this dialog?
        # So open additional fields in the dialog based on the type of plan selected.

    def on_submit(self):
        self.plan_id = self.id_input.text()
        self.plan_name = self.name_input.text()
        # ToDo! plan_type should define which template is used.
        self.plan_type = self.type_combo.currentText()

        if not self.plan_id or not self.plan_name:
            QMessageBox.warning(self, "Input Error", "Both ID and Name fields must be filled out.")
            return

        self.accept() 