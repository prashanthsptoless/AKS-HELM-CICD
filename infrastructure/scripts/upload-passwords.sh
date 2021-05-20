#!/usr/bin/env bash
set -euo pipefail

KV_NAME=${1}

az keyvault secret set --vault-name ${KV_NAME} --name "cert-password-dev" --value ${CERT_PASSWORD_DEV}
az keyvault secret set --vault-name ${KV_NAME} --name "cert-password-prd" --value ${CERT_PASSWORD_PRD}
