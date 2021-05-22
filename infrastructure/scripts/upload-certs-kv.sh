#!/usr/bin/env bash
set -euo pipefail

KV_NAME=${1}

az keyvault certificate import \
    --file ${HOME}/certbot/certs/boss-crawdad-dev.jamesrcounts.com.pfx \
    --name boss-crawdad-dev-jamesrcounts-com \
    --vault-name ${KV_NAME} \
    --password ${CERT_PASSWORD_DEV}

az keyvault certificate import \
    --file ${HOME}/certbot/certs/boss-crawdad-prd.jamesrcounts.com.pfx \
    --name boss-crawdad-prd-jamesrcounts-com \
    --vault-name ${KV_NAME} \
    --password ${CERT_PASSWORD_PRD}