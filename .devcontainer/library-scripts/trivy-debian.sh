#!/usr/bin/env bash
set -euo pipefail

wget https://github.com/aquasecurity/trivy/releases/download/v0.18.1/trivy_0.18.1_Linux-64bit.deb
dpkg -i trivy_0.18.1_Linux-64bit.deb
