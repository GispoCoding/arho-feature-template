from __future__ import annotations

from typing import TYPE_CHECKING, cast

from qgis.gui import QgisInterface
from qgis.utils import iface as qgis_iface

from arho_feature_template.core.exceptions import UnexpectedNoneError

if TYPE_CHECKING:
    from qgis.core import Qgis

# This is just a workaround to make static typing work
iface = cast(QgisInterface, qgis_iface)


def show_message_bar(title: str, message: str, level: Qgis.MessageLevel) -> None:
    message_bar = iface.messageBar()
    if message_bar is None:
        raise UnexpectedNoneError
    message_bar.pushMessage(title, message, level=level)
