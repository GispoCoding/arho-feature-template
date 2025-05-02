from __future__ import annotations

from qgis.PyQt.QtCore import QSize, Qt, pyqtSignal
from qgis.PyQt.QtGui import QPalette
from qgis.PyQt.QtWidgets import QListWidget, QListWidgetItem, QPushButton

FEATURE_TYPES = ["Aluevaraus", "Osa-alue", "Viiva", "Maankäytön kohde", "Muu piste"]
FEATURE_TYPE_TO_LAYER_NAME = {
    "Viiva": "Viivat",
    "Osa-alue": "Osa-alue",
    "Aluevaraus": "Aluevaraus",
    "Maankäytön\nkohde": "Maankäytön kohteet",
    "Muu\npiste": "Muut pisteet",
}

FEATURE_BUTTON_WIDTH = 90
FEATURE_BUTTON_HEIGHT = 90


class NewFeatureGridWidget(QListWidget):
    active_feature_type_changed = pyqtSignal(str, str)

    def __init__(self):
        super().__init__()
        self.viewport().setBackgroundRole(QPalette.Window)
        self.setFlow(self.LeftToRight)
        self.setWrapping(True)
        self.setMovement(self.Static)
        self.setResizeMode(self.Adjust)
        self.setGridSize(QSize(FEATURE_BUTTON_WIDTH + 4, FEATURE_BUTTON_HEIGHT + 4))
        self.setHorizontalScrollMode(self.ScrollPerPixel)
        self.setVerticalScrollMode(self.ScrollPerPixel)

        self.initialize_buttons()

    def initialize_buttons(self, exclude: list | None = None):
        self.clear()

        exclude = exclude or []
        self.buttons = {
            feature_type: FeatureButton(feature_type) for feature_type in FEATURE_TYPES if feature_type not in exclude
        }
        for btn in self.buttons.values():
            self.add_button(btn)
            btn.clicked.connect(lambda _, button=btn: self.handle_button_click(button))

    def add_button(self, button: FeatureButton):
        item = QListWidgetItem()
        item.setFlags(item.flags() & ~(Qt.ItemIsSelectable | Qt.ItemIsEnabled))
        self.addItem(item)
        item.setSizeHint(button.sizeHint())
        self.setItemWidget(item, button)

    def resizeEvent(self, event):  # noqa: N802
        super().resizeEvent(event)
        self.update_height()

    def update_height(self):
        """Adjust the height of the list widget dynamically based on the number of rows."""
        # Buffer width to avoid flicker and height to show vertical scroll only when needed
        item_width = FEATURE_BUTTON_WIDTH + 9
        item_height = FEATURE_BUTTON_HEIGHT + 6

        available_width = self.viewport().width()
        items_per_row = max(1, available_width // item_width)
        rows_needed = (self.count() + items_per_row - 1) // items_per_row
        new_height = rows_needed * item_height

        self.setFixedHeight(new_height)

    def handle_button_click(self, btn: FeatureButton):
        self.clear_selections(exclude=btn)

        # Map button texts to layer names
        btn.setChecked(True)
        self.active_feature_type_changed.emit(btn.text(), FEATURE_TYPE_TO_LAYER_NAME[btn.text()])

    def clear_selections(self, exclude: FeatureButton | None = None):
        for btn in self.buttons.values():
            if exclude and btn == exclude:
                continue
            btn.setChecked(False)


class FeatureButton(QPushButton):
    def __init__(self, text: str):
        super().__init__()
        self.setText(text.replace(" ", "\n"))
        self.setFixedSize(FEATURE_BUTTON_WIDTH, FEATURE_BUTTON_HEIGHT)
        self.setCheckable(True)
