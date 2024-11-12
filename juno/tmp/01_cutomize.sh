#!/bin/bash

# Remove unneeded packages
dnf remove -y                                                                                           \
  firefox                                                                                               \
  firefox-langpacks                                                                                     \
  gnome-system-monitor

dnf install -y                                                                                          \
  gnome-shell-extension-gsconnect                                                                       \
  simple-scan
