#!/bin/bash

set -ouex pipefail

# Add rpmfusion
dnf install -y                                                                                          \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm       \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#Add addtional codecs
dnf swap -y ffmpeg-free ffmpeg --allowerasing
dnf swap -y mesa-va-drivers mesa-va-drivers-freeworld
dnf swap -y mesa-vdpau-drivers mesa-vdpau-drivers-freeworld

# Remove unneeded packages
dnf remove -y                                                                                          \
  firewall-config                                                                                      \
  krdp                                                                                                 \
  krfb

# Add needed packages
dnf install -y                                                                                         \
  --setopt=excludepkgs=nvtop                                                                           \
  AusweisApp2                                                                                          \
  gamescope                                                                                            \
  gwenview                                                                                             \
  jetbrains-mono-fonts                                                                                 \
  kate                                                                                                 \
  kcalc                                                                                                \
  kdepim-addons                                                                                        \
  kmail                                                                                                \
  ksshaskpass                                                                                          \
  langpacks-de                                                                                         \
  libreoffice-calc                                                                                     \
  libreoffice-impress                                                                                  \
  libreoffice-kf6                                                                                      \
  libreoffice-langpack-de                                                                              \
  libreoffice-writer                                                                                   \
  lm_sensors                                                                                           \
  lm_sensors-libs                                                                                      \
  mangohud                                                                                             \
  merkuro                                                                                              \
  mpv                                                                                                  \
  okular                                                                                               \
  pam_mount                                                                                            \
  pcsc-cyberjack                                                                                       \
  rsms-inter-fonts                                                                                     \
  skanpage                                                                                             \
  steam                                                                                                \
  syncthing                                                                                            \
  transmission-qt                                                                                      \
  wine-arial-fonts                                                                                     \
  wine-core                                                                                            \
  wine-mono                                                                                            \
  wine-pulseaudio                                                                                      \
  wine-times-new-roman-fonts                                                                           \
  wine-times-new-roman-fonts-system

#Hide some application entries
for i in                                                                                               \
  /usr/share/applications/org.kde.contactprintthemeeditor.desktop                                      \
  /usr/share/applications/org.kde.contactthemeeditor.desktop                                           \
  /usr/share/applications/org.kde.headerthemeeditor.desktop                                            \
  /usr/share/applications/org.kde.ktnef.desktop                                                        \
  /usr/share/applications/org.kde.pimdataexporter.desktop                                                      \
  /usr/share/applications/org.kde.sieveeditor.desktop                                                  \
  /usr/share/applications/syncthing-start.desktop                                                      \
  /usr/share/applications/syncthing-ui.desktop                                                         \
; do sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nNoDisplay=true@g' $i; done

# Do not show steam in Network and FileTransfer category
sed -i 's/Network;FileTransfer;//' /usr/share/applications/steam.desktop
