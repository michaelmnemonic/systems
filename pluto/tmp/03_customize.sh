#! /bin/bash

# This script installs a session that uses the niri compositor

# install niri session
dnf install -y \
  niri         \
  waybar       \
  alacritty    \
  pavucontrol

# Add lm-sensor (needed for fan2go)
dnf install -y                                                                                         \
  lm_sensors                                                                                           \
  lm_sensors-libs

# Add gaming appllications
dnf install -y                                                                                         \
  --setopt=excludepkgs=nvtop                                                                           \
  gamescope                                                                                            \
  mangohud                                                                                             \
  steam

# Add wine
dnf install -y                                                                                        \
 wine-arial-fonts                                                                                     \
 wine-common                                                                                          \
 wine-core                                                                                            \
 wine-ldap                                                                                            \
 wine-mono                                                                                            \
 wine-pulseaudio                                                                                      \
 wine-times-new-roman-fonts                                                                           \
 wine-times-new-roman-fonts-system