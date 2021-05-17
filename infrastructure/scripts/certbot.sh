#!/usr/bin/env bash
set -euo pipefail

# Debug info
certbot --version

# make directories
mkdir -p ~/certbot/{config,work,log}

# Get certificates using Route53 for validation
DOMAIN="boss-crawdad-dev.jamesrcounts.com"
#certbot certonly --logs-dir ~/certbot/log --config-dir ~/certbot/config --work-dir ~/certbot/work --dns-route53 -d ${DOMAIN}

# PFX
openssl pkcs12 -export -inkey ~/certbot/config/live/${DOMAIN}/privkey.pem -in ~/certbot/config/live/${DOMAIN}/cert.pem -out ${DOMAIN}.pfx