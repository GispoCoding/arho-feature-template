import os
from typing import TYPE_CHECKING

from arho_feature_template.qgis_plugin_tools.infrastructure.debugging import (
    setup_debugpy,  # noqa: F401
    setup_ptvsd,  # noqa: F401
    setup_pydevd,  # noqa: F401
)

if TYPE_CHECKING:
    from qgis.gui import QgisInterface

debugger = os.environ.get("QGIS_PLUGIN_USE_DEBUGGER", "").lower()
if debugger in {"debugpy", "ptvsd", "pydevd"}:
    locals()["setup_" + debugger]()


PLUGIN_VERSION = 0.17
SUPPORTED_PROJECT_VERSION = 0.1


def classFactory(iface: "QgisInterface"):  # noqa N802
    from arho_feature_template.plugin import Plugin

    return Plugin()
