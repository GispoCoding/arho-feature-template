from __future__ import annotations

from importlib import resources
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from collections.abc import Iterator
    from pathlib import Path


def library_config_files() -> Iterator[Path]:
    """Get all template library configuration files."""

    for resource in resources.files(__package__).iterdir():
        with resources.as_file(resource) as resource_path:
            if resource_path.suffix == ".yaml":
                yield resource_path
