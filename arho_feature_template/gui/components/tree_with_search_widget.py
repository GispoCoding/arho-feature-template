from __future__ import annotations

from typing import Any

from qgis.gui import QgsFilterLineEdit
from qgis.PyQt.QtCore import Qt
from qgis.PyQt.QtWidgets import QSizePolicy, QTreeWidget, QTreeWidgetItem, QVBoxLayout, QWidget


class TreeWithSearchWidget(QWidget):
    """A widget combining a QTreeWidget and QgsFilterLineEdit."""

    def __init__(self):
        super().__init__()
        self.search = QgsFilterLineEdit(self)
        self.search.setShowClearButton(True)
        self.search.setShowSearchIcon(True)
        self.search.setSizePolicy(QSizePolicy.Preferred, QSizePolicy.Fixed)
        self.search.valueChanged.connect(self.filter_tree_items)

        self.tree = QTreeWidget(self)
        self.tree.setHeaderHidden(True)
        self.tree.setSizePolicy(QSizePolicy.Preferred, QSizePolicy.Expanding)

        layout = QVBoxLayout()
        layout.addWidget(self.search)
        layout.addWidget(self.tree)
        self.setLayout(layout)

        self.setContentsMargins(0, 0, 0, 0)
        layout.setContentsMargins(0, 0, 0, 0)

    def add_item_to_tree(
        self, text: str | None, model: Any | None = None, parent: QTreeWidgetItem | None = None
    ) -> QTreeWidgetItem:
        item = QTreeWidgetItem(parent)
        if text:
            item.setText(0, text)
            item.setToolTip(0, text)  # Set text as tooltip in case the tree width is not enough to show item text
        if model:
            item.setData(0, Qt.UserRole, model)
        if not parent:
            self.tree.addTopLevelItem(item)

        return item

    def filter_tree_items(self):
        search_text = self.search.value().lower()

        # Iterate over all group (top-level) items in the tree
        for i in range(self.tree.topLevelItemCount()):
            group_item = self.tree.topLevelItem(i)
            group_item.setHidden(True)  # Initially hide the top-level item

            matches_group = search_text in group_item.text(0).lower()
            if matches_group:
                # If group matches, show it and all its children
                self.show_all_children(group_item)
                group_item.setHidden(False)
            else:
                # Otherwise, recursively filter its children
                matches_child = self.filter_children(group_item, search_text)
                group_item.setHidden(not matches_child)

    def filter_children(self, parent_item: QTreeWidgetItem, search_text: str) -> bool:
        """Recursively filter children and return True if any child matches."""
        has_match = False
        for i in range(parent_item.childCount()):
            child = parent_item.child(i)
            matches = search_text in child.text(0).lower()
            child.setHidden(not matches)

            if child.childCount() > 0:
                matches |= self.filter_children(child, search_text)

            if matches:
                has_match = True

        return has_match

    def show_all_children(self, parent_item: QTreeWidgetItem):
        """Show the parent item and all its children recursively."""
        parent_item.setHidden(False)
        for i in range(parent_item.childCount()):
            child = parent_item.child(i)
            child.setHidden(False)
            if child.childCount() > 0:
                self.show_all_children(child)
