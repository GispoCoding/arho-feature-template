import re
from textwrap import dedent
from typing import cast

from qgis.PyQt.QtGui import QStandardItem, QStandardItemModel
from qgis.PyQt.QtWidgets import QTreeView

from arho_feature_template.utils.load_validation_errors import VALIDATION_ERRORS

category_map = {
    "plan": "Kaava",
    "geographicalArea": "Kaavan ulkoraja",
    "planObjects": "Kaavakohteet",
    "planRegulationGroups": "Kaavamääräysryhmät",
}


class ValidationItem(QStandardItem):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.setEditable(False)


class ValidationModel(QStandardItemModel):
    ERROR_INDEX = 0
    WARNING_INDEX = 1

    def __init__(self) -> None:
        super().__init__()

        self._parent_items: dict[str, ValidationItem] = {}

        self.setColumnCount(3)
        self.setHorizontalHeaderLabels(["", "Attribuutti", "Viesti"])

        self.root = self.invisibleRootItem()
        self.root.appendRow([ValidationItem("Virheet"), ValidationItem(""), ValidationItem("")])
        self.root.appendRow([ValidationItem("Varoitukset"), ValidationItem(""), ValidationItem("")])

    def clear(self):
        self.item(self.ERROR_INDEX, 0).removeRows(0, self.item(self.ERROR_INDEX, 0).rowCount())
        self.item(self.WARNING_INDEX, 0).removeRows(0, self.item(self.WARNING_INDEX, 0).rowCount())
        self._parent_items = {}

    def _add_item(self, root_index: int, error: str, instance: str, message: str) -> None:
        current_parent = cast(ValidationItem, self.item(root_index, 0))
        # replace '.planObjects[index]' with '.planObjects.index' so it is splittable by '.'
        instance = re.sub(r"\.(?P<object>\w+)\[(?P<object_num>\d+)\]", r".\g<object>.\g<object_num>", instance)
        path_parts = []
        attribute_index = None
        attribute = ""
        for i, instance_part in enumerate(instance.split(".")):
            if instance_part == "planObjects":
                attribute_index = i + 2

            path_parts.append(instance_part)
            path = ".".join(path_parts)
            if i == attribute_index:
                attribute = instance_part
                self._parent_items[path] = current_parent
            elif path not in self._parent_items:
                new_item = ValidationItem(category_map.get(instance_part, instance_part))
                current_parent.appendRow([new_item, ValidationItem(""), ValidationItem("")])
                self._parent_items[path] = new_item
            current_parent = self._parent_items[path]

        current_parent = self._parent_items[instance]
        message_item = ValidationItem(message)

        processed_rule_id = error.replace("__", "/").replace("_", "-")
        try:
            description = VALIDATION_ERRORS[processed_rule_id]
        except KeyError:
            description = ""
        message_tooltip = dedent(
            f"""\
            <p>
                <span style='font-weight:bold'>Virhe:</span><br/>
                {error}
            </p>
            <p>
                <span style='font-weight:bold'>Virheviesti:</span><br/>
                {message}
            </p>
            <p>
                <span style='font-weight:bold'>Kuvaus:</span><br/>
                {description}
            </p>
            """
        )
        message_item.setToolTip(message_tooltip)
        current_parent.appendRow([ValidationItem(""), ValidationItem(attribute), message_item])

    def add_error(self, error: str, instance: str, message: str) -> None:
        self._add_item(self.ERROR_INDEX, error, instance, message)

    def add_warning(self, error: str, instance: str, message: str) -> None:
        self._add_item(self.WARNING_INDEX, error, instance, message)


class ValidationTreeView(QTreeView):
    def __init__(self, parent=None) -> None:
        super().__init__(parent)

        self._model = ValidationModel()
        self.setModel(self._model)

    def clear_errors(self) -> None:
        self._model.clear()

    def add_error(self, error: str, instance: str, message: str) -> None:
        self._model.add_error(error, instance, message)

    def add_warning(self, error: str, instance: str, message: str) -> None:
        self._model.add_warning(error, instance, message)
