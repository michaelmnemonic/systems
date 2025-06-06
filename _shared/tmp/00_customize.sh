#! /bin/bash

# Import microsoft keys
rpm --import https://packages.microsoft.com/keys/microsoft.asc

# Add rpmfusion
dnf install -y                                                                                          \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm       \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Add addtional codecs
dnf swap -y ffmpeg-free ffmpeg --allowerasing
dnf swap -y mesa-va-drivers mesa-va-drivers-freeworld
dnf swap -y mesa-vdpau-drivers mesa-vdpau-drivers-freeworld

# Add language pack
dnf install -y                                                                                      \
  langpacks-de \
  glibc-langpack-de

# Add syncthing
dnf install -y                                                                                     \
  syncthing

# Add some basic packages
dnf install -y \
  zstd

# Add tailscale
dnf install -y \
  tailscale

# Add pam_mount
dnf install -y                                                                                     \
  pam_mount

  # Add fonts
dnf install -y \
  stow

# Install vscode
dnf install -y code

# Use luks partition for home of user "MAIK"
sed -i '/<!-- Volume definitions -->/a <volume user="maik" fstype="crypt" path="/dev/disk/by-partlabel/MAIK" mountpoint="~" options="crypto_name=MAIK,fstype=ext4" />' /etc/security/pam_mount.conf.xml

# Use nicer password message
sed -i '/<\/pam_mount>/i\<msg-authpw>Passwort:<\/msg-authpw>\n' /etc/security/pam_mount.conf.xml

# Enable automatic updates
systemctl enable bootc-fetch-apply-updates.timer

# Hide synthing desktop entries
for i in                                                                                               \
  /usr/share/applications/syncthing-start.desktop                                                      \
  /usr/share/applications/syncthing-ui.desktop                                                         \
; do sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nNoDisplay=true@g' $i; done
