#!/usr/bin/env bash
set -euo pipefail

az login
az account set --subscription "Jim Counts (Personal)"
az account show --output table