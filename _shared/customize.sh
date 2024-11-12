#! /bin/bash

# Add rpmfusion
dnf install -y                                                                                          \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm       \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Add addtional codecs
dnf swap -y ffmpeg-free ffmpeg --allowerasing
dnf swap -y mesa-va-drivers mesa-va-drivers-freeworld
dnf swap -y mesa-vdpau-drivers mesa-vdpau-drivers-freeworld

# Add language pack
RUN dnf install -y                                                                                      \
  langpacks-de

# Add fonts
dnf install -y                                                                                     \
  rsms-inter-fonts                                                                                     \
  jetbrains-mono-fonts

# Add syncthing
RUN dnf install -y                                                                                     \
  syncthing