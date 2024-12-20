from __future__ import annotations

import logging
from typing import TYPE_CHECKING

from qgis.PyQt.QtCore import Qt
from qgis.PyQt.QtWidgets import QComboBox, QTreeWidget, QTreeWidgetItem

from arho_feature_template.exceptions import LayerNotFoundError

if TYPE_CHECKING:
    from arho_feature_template.project.layers.code_layers import (
        AbstractCodeLayer,
    )

logger = logging.getLogger(__name__)


class CodeComboBox(QComboBox):
    def __init__(self, parent=None):
        super().__init__(parent)

        self.addItem("NULL")
        self.setItemData(0, None)

        self.setCurrentIndex(0)

    def populate_from_code_layer(self, layer_type: type[AbstractCodeLayer]) -> None:
        try:
            layer = layer_type.get_from_project()
        except LayerNotFoundError:
            logger.warning("Layer % not found.", layer_type.name)
            return

        for i, feature in enumerate(layer.getFeatures(), start=1):
            self.addItem(feature["name"]["fin"])
            self.setItemData(i, feature["id"])

    def value(self) -> str:
        return self.currentData()


class HierarchicalCodeComboBox(QComboBox):
    def __init__(self, parent=None):
        super().__init__(parent)

        self.tree_widget = QTreeWidget()
        self.tree_widget.setColumnCount(1)
        self.tree_widget.setHeaderHidden(True)

        self.setModel(self.tree_widget.model())
        self.setView(self.tree_widget)

        self.tree_widget.viewport().installEventFilter(self)

        null_item = QTreeWidgetItem(["NULL"])
        null_item.setData(0, Qt.UserRole, None)
        self.tree_widget.addTopLevelItem(null_item)
        null_index = self.tree_widget.indexFromItem(null_item)
        self.tree_widget.setCurrentIndex(null_index)

    def populate_from_code_layer(self, layer_type: type[AbstractCodeLayer]) -> None:
        try:
            layer = layer_type.get_from_project()
        except LayerNotFoundError:
            logger.warning("Layer % not found.", layer_type.name)
            return

        codes = {feature["id"]: feature for feature in layer.getFeatures()}
        items: dict[str, QTreeWidgetItem] = {}
        for code_feature in sorted(codes.values(), key=lambda feature: feature["level"]):
            item = QTreeWidgetItem()
            items[code_feature["id"]] = item

            text = code_feature["name"]["fin"]
            item.setText(0, text)
            description = code_feature["description"]["fin"]
            item.setToolTip(0, description)
            item.setData(0, Qt.UserRole, code_feature["id"])

            if code_feature["level"] == 1:
                self.tree_widget.addTopLevelItem(item)
                item.setFlags(item.flags() & ~Qt.ItemIsSelectable)
            else:
                parent = items[code_feature["parent_id"]]
                parent.addChild(item)

        self.tree_widget.expandAll()

    def value(self) -> str:
        item = self.tree_widget.selectedItems()[0]
        return item.data(0, Qt.UserRole)
