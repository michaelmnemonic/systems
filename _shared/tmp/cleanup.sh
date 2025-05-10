#!/usr/bin/bash

set -eoux pipefail
shopt -s extglob

dnf clean all
rm -rf /tmp/* || true
rm -rf /var/* || true
