#!/usr/bin/env bash
set -euo pipefail

echo "Downloading azcopy..."
mkdir -p /tmp/azdl
cd /tmp/azdl
curl -sSL -o /tmp/azdl/azcopy_linux_amd64_10.10.0.tar.gz https://azcopyvnext.azureedge.net/release20210415/azcopy_linux_amd64_10.10.0.tar.gz
tar xvzf /tmp/azdl/azcopy_linux_amd64_10.10.0.tar.gz
mv -f azcopy_linux_amd64_10.10.0/azcopy /usr/local/bin/
chmod +x /usr/local/bin/azcopy

rm -rf /tmp/azdl