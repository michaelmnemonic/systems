#! /bin/bash

# This script installs a session that uses the niri compositor

# install niri session
dnf install -y \
  niri         \
  waybar       \
  alacritty    \
  pavucontrol

# Install sddm
dnf install -y \
  sddm