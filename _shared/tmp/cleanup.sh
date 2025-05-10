#!/usr/bin/bash

set -eoux pipefail
shopt -s extglob

dnf clean all
rm -rf /tmp/* || true
rm -rf /var/!(cache)

# delete _some_ unneded cache directories
rm -rf /var/cache/tailscale
rm -rf /var/cache/libdnf5
