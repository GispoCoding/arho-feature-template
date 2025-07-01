from __future__ import annotations

import logging
from typing import TYPE_CHECKING

from qgis.PyQt.QtCore import Qt
from qgis.PyQt.QtWidgets import QComboBox, QTreeWidget, QTreeWidgetItem

from arho_feature_template.utils.misc_utils import deserialize_localized_text

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
        for id_, attributes in layer_type.get_cached_attributes().items():
            text = attributes.get("name")
            if isinstance(text, dict):
                text = deserialize_localized_text(text)
            self.addItem(text, id_)

    def value(self) -> str:
        return self.currentData()

    def set_value(self, value: str | None) -> None:
        if value is None:
            self.setCurrentIndex(0)
            return

        index = self.findData(value)
        if index != -1:
            self.setCurrentIndex(index)

    def remove_item_by_text(self, text: str):
        index = self.findText(text)
        if index != -1:
            self.removeItem(index)


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
        self.null_index = self.tree_widget.indexFromItem(null_item)
        self.tree_widget.setCurrentIndex(self.null_index)

    def populate_from_code_layer(self, layer_type: type[AbstractCodeLayer]) -> None:
        items: dict[str, QTreeWidgetItem] = {}

        for id_, attributes in sorted(layer_type.get_cached_attributes().items(), key=lambda item: item[1]["level"]):
            item = QTreeWidgetItem()
            items[id_] = item

            # Text
            name = attributes.get("name")
            if isinstance(name, dict):
                name = deserialize_localized_text(name)
            item.setText(0, name)

            # Tooltip
            description = attributes.get("description")
            if isinstance(description, dict):
                description = deserialize_localized_text(description)
            item.setToolTip(0, description if description else name)

            # Data
            item.setData(0, Qt.UserRole, id_)

            if attributes["value"] in layer_type.category_only_codes:
                item.setFlags(item.flags() & ~Qt.ItemIsSelectable)

            if attributes["level"] == 1:
                self.tree_widget.addTopLevelItem(item)
            else:
                parent = items[attributes["parent_id"]]
                parent.addChild(item)

        self.tree_widget.expandAll()

    def value(self) -> str | None:
        """Return the value of the current item.

        Currently might be None, if the current item is not selectable."""

        selected = self.tree_widget.selectedItems()  # TODO: Find a way to get the current item even if not selectable
        if selected:  # current item might not be selectable
            item = selected[0]
            return item.data(0, Qt.UserRole)
        return None

    def _find_item_recursive(self, item: QTreeWidgetItem, value: str) -> QTreeWidgetItem:
        """Recursively try to find item with given value and return the item if found."""
        # Found item, return it
        if item.data(0, Qt.UserRole) == value:
            return item

        # Loop children
        for i in range(item.childCount()):
            found_item = self._find_item_recursive(item.child(i), value)
            if found_item:
                return found_item

        return None

    def set_value(self, value: str | None) -> None:
        # Set selection to NULL if `value` is None
        if value is None:
            return

        # Loop top level tree items
        for i in range(self.count()):
            # Handle child items recursively
            found_item = self._find_item_recursive(self.tree_widget.topLevelItem(i), value)

            # If matching item was found, set it as selected. Because of the hybrid TreeWidget + ComboBox
            # nature of the widget, value setting is unintuitive and tricky
            if found_item:
                self.tree_widget.setCurrentItem(found_item)
                idx = self.tree_widget.indexFromItem(found_item)
                self.setRootModelIndex(idx.parent())
                self.setCurrentIndex(idx.row())
                self.setRootModelIndex(self.null_index.parent())
                return
