#! /bin/bash

# Remove unneeded packages
dnf remove -y                                                                                       \
  firewall-config     \
  firefox             \
  firefox-langpacks   \                                                                                  \

# Add lm-sensor (needed for fan2go)
dnf install -y                                                                                         \
  lm_sensors                                                                                           \
  lm_sensors-libs