from __future__ import annotations

from importlib import resources
from pathlib import Path
from typing import TYPE_CHECKING, Iterable

from qgis.PyQt.QtCore import QSettings

if TYPE_CHECKING:
    from collections.abc import Iterator


USER_REGULATION_GROUP_TEMPLATE_LIBRARIES_KEY = "arho/user_regulation_group_library_paths"


def get_default_regulation_group_library_config_files() -> Iterator[Path]:
    """Get all default template library configuration files."""

    for resource in resources.files(__package__).iterdir():
        with resources.as_file(resource) as resource_path:
            if resource_path.suffix == ".yaml":
                yield resource_path


def get_user_regulation_group_library_config_files() -> list[Path]:
    """Get all user template library configuration files."""

    paths_str = QSettings().value(USER_REGULATION_GROUP_TEMPLATE_LIBRARIES_KEY, None)
    return [Path(path) for path in paths_str.split(";")] if paths_str else []


def set_user_regulation_group_library_config_files(paths: Iterable[str]):
    """Set all user template library configuration files."""

    QSettings().setValue(USER_REGULATION_GROUP_TEMPLATE_LIBRARIES_KEY, ";".join(str(path) for path in paths))
