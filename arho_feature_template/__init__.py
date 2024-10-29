from __future__ import annotations

import os
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from qgis.gui import QgisInterface

    from arho_feature_template.plugin import Plugin

debugger = os.environ.get("QGIS_PLUGIN_USE_DEBUGGER")
if debugger is not None:
    from arho_feature_template.qgis_plugin_tools.infrastructure.debugging import (
        setup_debugpy,
        setup_ptvsd,
        setup_pydevd,
    )

    debugger_setups = {
        "debugpy": setup_debugpy,
        "ptvsd": setup_ptvsd,
        "pydevd": setup_pydevd,
    }
    debug_setupper = debugger_setups.get(debugger.lower())
    if debug_setupper is not None:
        debug_setupper()


def classFactory(iface: "QgisInterface") -> Plugin:  # noqa N802
    from arho_feature_template.plugin import Plugin

    return Plugin()
