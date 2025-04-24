#! /bin/bash

# Install gaming applications

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
