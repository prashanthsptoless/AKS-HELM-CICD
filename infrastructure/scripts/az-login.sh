#!/usr/bin/env bash
set -euo pipefail

az login --use-device-code
az account set --subscription "Jim Counts (Personal)"
az account show --output table