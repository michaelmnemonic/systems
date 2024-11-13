#! /bin/bash

# Remove unneeded packages
dnf remove -y                                                                                       \
  firewall-config                                                                                       \


# Add pam_mount
dnf install -y                                                                                     \
  pam_mount

# Add lm-sensor (needed for fan2go)
dnf install -y                                                                                         \
  lm_sensors                                                                                           \
  lm_sensors-libs

# Add transmission
# FIXME: check once qt-based transmission is availlable as flatpak
dnf install -y                                                                                         \
  transmission-qt

# Add mpv
# FIXME: check once qt-based transmission is availlable as flatpak
dnf install -y                                                                                         \
  mpv

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
  okular                                                                                               \
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

# Add umu launcher
dnf install -y                                                                                         \
  /tmp/umu-launcher-1.1.3-1.20241105.8bc37bb.fc41.noarch.rpm

# Add mkosi, ukify
dnf install -y                                                                                         \
  mkosi                                                                                                \
  ukify \
  virtiofsd \
  qemu-device-display-virtio-vga \
  swtpm

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
