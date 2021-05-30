#!/usr/bin/env bash
set -euo pipefail

AZURE_STORAGE_ACCOUNT=${1}
AZURE_STORAGE_CONTAINER=${2}

# Caluclate the token expiration time
TOKEN_EXPIRATION=$(date -u -d "1 hour" '+%Y-%m-%dT%H:%MZ')

# Generate a read-write SAS token for the private backend storage container
TOKEN=$(
    az storage container generate-sas \
        --account-name ${AZURE_STORAGE_ACCOUNT} \
        --name ${AZURE_STORAGE_CONTAINER} \
        --expiry ${TOKEN_EXPIRATION} \
        --permissions acdlrw \
        --https-only \
        --as-user \
        --auth-mode login \
        --output tsv
)

azcopy cp https://${AZURE_STORAGE_ACCOUNT}.blob.core.windows.net/${AZURE_STORAGE_CONTAINER}/?${TOKEN} ./ --recursive