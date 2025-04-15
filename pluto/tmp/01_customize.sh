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
# FIXME: check okular flatpak once it support color-schemes
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

# Add opencl support via rocm
dnf install --allowerasing -y                                                                                        \
 rocm-opencl                                                                                          \
 rocm-clinfo

# Add ramalama
dnf install -y    \
 python3-ramalama \

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
