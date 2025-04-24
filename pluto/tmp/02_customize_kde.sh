#! /bin/bash

# This script installs a session that uses the kde plasma desktop

# Add transmission
# FIXME: check once qt-based transmission is availlable as flatpak
dnf install -y                                                                                         \
  transmission-qt

# Add AusweisApp
# FIXME: check once a verified version is availlable as flatpak
dnf install -y                                                                                         \
  AusweisApp2                                                                                          \
  pcsc-cyberjack

# Add libreoffice
# FIXME: check once kf6 enabled libreoffice is availlable as flatpak
dnf install -y                                                                                         \
  libreoffice-calc                                                                                     \
  libreoffice-impress                                                                                  \
  libreoffice-kf6                                                                                      \
  libreoffice-langpack-de                                                                              \
  libreoffice-writer

# Add basic kde appllications
dnf install -y                                                                                         \
  kate                                                                                                 \
  ksshaskpass                                                                                          \
  skanpage

# Add kdepim appllications
dnf install -y                                                                                         \
  kdepim-addons                                                                                        \
  kmail                                                                                                \
  merkuro                                                                                              \
  qt6-qtlocation

# Hide some application entries
for i in                                                                                               \
  /usr/share/applications/org.kde.contactprintthemeeditor.desktop                                      \
  /usr/share/applications/org.kde.contactthemeeditor.desktop                                           \
  /usr/share/applications/org.kde.headerthemeeditor.desktop                                            \
  /usr/share/applications/org.kde.ktnef.desktop                                                        \
  /usr/share/applications/org.kde.pimdataexporter.desktop                                              \
  /usr/share/applications/org.kde.sieveeditor.desktop                                                  \
; do sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nNoDisplay=true@g' $i; done  &&                     \
sed -i 's/Network;FileTransfer;//' /usr/share/applications/steam.desktop

# Customize plasma desktop
dnf install -y patch
patch -p0 -i /tmp/plasma-customization.patch
dnf remove -y patch
