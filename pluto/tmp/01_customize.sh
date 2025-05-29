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

  # Add fonts
  dnf install -y                                                                                     \
    rsms-inter-fonts                                                                                     \
    jetbrains-mono-fonts
