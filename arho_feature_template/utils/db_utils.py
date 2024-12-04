from __future__ import annotations

import logging

from qgis.core import QgsProviderRegistry

from arho_feature_template.exceptions import UnexpectedNoneError

LOGGER = logging.getLogger("LandUsePlugin")


def get_existing_database_connection_names() -> list[str]:
    """
    Retrieve the list of existing database connections from QGIS settings.

    :return: A set of available PostgreSQL connection names.
    """

    provider_registry = QgsProviderRegistry.instance()
    if provider_registry is None:
        raise UnexpectedNoneError
    postgres_provider_metadata = provider_registry.providerMetadata("postgres")
    if postgres_provider_metadata is None:
        raise UnexpectedNoneError

    return list(postgres_provider_metadata.dbConnections(False))
