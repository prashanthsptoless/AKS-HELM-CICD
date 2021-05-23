#!/usr/bin/env bash
set -euo pipefail

KV_NAME=${1}

az keyvault certificate import \
    --file ${HOME}/certbot/certs/boss-crawdad-dev.jamesrcounts.com.pem \
    --name boss-crawdad-dev-jamesrcounts-com \
    --vault-name ${KV_NAME} 

az keyvault certificate import \
    --file ${HOME}/certbot/certs/boss-crawdad-prd.jamesrcounts.com.pem \
    --name boss-crawdad-prd-jamesrcounts-com \
    --vault-name ${KV_NAME} 