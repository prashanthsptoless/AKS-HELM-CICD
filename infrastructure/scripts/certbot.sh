#!/usr/bin/env bash
set -euo pipefail

DOMAIN=${1}

# Debug info
certbot --version

# make directories
mkdir -p ~/certbot/{config,work,log,certs}

# Get certificates using Route53 for validation
certbot certonly \
    --logs-dir ~/certbot/log \
    --config-dir ~/certbot/config \
    --work-dir ~/certbot/work \
    --dns-route53 \
    -d ${DOMAIN}

# # PFX
# openssl pkcs12 \
#     -export \
#     -inkey ~/certbot/config/live/${DOMAIN}/privkey.pem \
#     -in ~/certbot/config/live/${DOMAIN}/cert.pem \
#     -out ~/certbot/certs/${DOMAIN}.pfx

# PEM
cat ~/certbot/config/live/${DOMAIN}/privkey.pem ~/certbot/config/live/${DOMAIN}/fullchain.pem > ~/certbot/certs/${DOMAIN}.pem