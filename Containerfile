FROM quay.io/fedora-ostree-desktops/kinoite:41

# Create user "maik"
RUN useradd -G wheel -u 1000 -s /bin/bash maik && \
  usermod -p '$6$yIc8YCsXt1rkzeoc$72vBqymGWj7MCX0GduTvUMBqxAvxz4WYDJcASMEBaevyCrKAI1btoDM5czg366gwr6N55Zrn5zlPKTaUGsprV/' maik

# Apply file-based customization
COPY system_files/ /

# Remove unneeded packages
RUN dnf remove -y                                                                                       \
  firewall-config                                                                                       \
  krdp                                                                                                  \
  krfb                                                                                                  \
&& /usr/libexec/containerbuild/cleanup.sh

# Add rpmfusion
RUN dnf install -y                                                                                      \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm       \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
&& /usr/libexec/containerbuild/cleanup.sh

# Add addtional codecs
RUN dnf swap -y ffmpeg-free ffmpeg --allowerasing                                                       \
  && dnf swap -y mesa-va-drivers mesa-va-drivers-freeworld                                              \
  && dnf swap -y mesa-vdpau-drivers mesa-vdpau-drivers-freeworld                                        \
&& /usr/libexec/containerbuild/cleanup.sh

# Add language pack
RUN dnf install -y                                                                                     \
  langpacks-de                                                                                         \
&& /usr/libexec/containerbuild/cleanup.sh

# Add pam_mount
RUN dnf install -y                                                                                     \
  pam_mount                                                                                            \
&& /usr/libexec/containerbuild/cleanup.sh

# Add fonts
RUN dnf install -y                                                                                     \
  rsms-inter-fonts                                                                                     \
  jetbrains-mono-fonts                                                                                 \
&& /usr/libexec/containerbuild/cleanup.sh

# Add lm-sensor (needed for fan2go)
RUN dnf install -y                                                                                     \
  lm_sensors                                                                                           \
  lm_sensors-libs                                                                                      \
&& /usr/libexec/containerbuild/cleanup.sh

# Add syncthing
RUN dnf install -y                                                                                     \
  syncthing                                                                                            \
&& /usr/libexec/containerbuild/cleanup.sh

# Add transmission
# FIXME: check once qt-based transmission is availlable as flatpak
RUN dnf install -y                                                                                     \
  transmission-qt                                                                                      \
&& /usr/libexec/containerbuild/cleanup.sh

# Add mpv
# FIXME: check once qt-based transmission is availlable as flatpak
RUN dnf install -y                                                                                     \
  mpv                                                                                                  \
&& /usr/libexec/containerbuild/cleanup.sh

# Add AusweisApp
# FIXME: check once a verified version is availlable as flatpak
RUN dnf install -y                                                                                     \
  AusweisApp2                                                                                          \
  pcsc-cyberjack                                                                                       \
&& /usr/libexec/containerbuild/cleanup.sh

# Add libreoffice
# FIXME check once kf6 enabled libreoffice is availlable as flatpak
RUN dnf install -y                                                                                     \
  libreoffice-calc                                                                                     \
  libreoffice-impress                                                                                  \
  libreoffice-kf6                                                                                      \
  libreoffice-langpack-de                                                                              \
  libreoffice-writer                                                                                   \
&& /usr/libexec/containerbuild/cleanup.sh

# Add basic kde appllications
RUN dnf install -y                                                                                     \
  kate                                                                                                 \
  ksshaskpass                                                                                          \
  skanpage                                                                                             \
&& /usr/libexec/containerbuild/cleanup.sh

# Add kdepim appllications
RUN dnf install -y                                                                                     \
  kdepim-addons                                                                                        \
  kmail                                                                                                \
  merkuro                                                                                              \
  qt6-qtlocation                                                                                       \
&& /usr/libexec/containerbuild/cleanup.sh

# Add gaming appllications
RUN dnf install -y                                                                                     \
  --setopt=excludepkgs=nvtop                                                                           \
  gamescope                                                                                            \
  mangohud                                                                                             \
  steam                                                                                                \
  wine-arial-fonts                                                                                     \
  wine-core                                                                                            \
  wine-mono                                                                                            \
  wine-pulseaudio                                                                                      \
  wine-times-new-roman-fonts                                                                           \
  wine-times-new-roman-fonts-system                                                                    \
&& /usr/libexec/containerbuild/cleanup.sh

# Hide some application entries
RUN for i in                                                                                           \
  /usr/share/applications/org.kde.contactprintthemeeditor.desktop                                      \
  /usr/share/applications/org.kde.contactthemeeditor.desktop                                           \
  /usr/share/applications/org.kde.headerthemeeditor.desktop                                            \
  /usr/share/applications/org.kde.ktnef.desktop                                                        \
  /usr/share/applications/org.kde.pimdataexporter.desktop                                              \
  /usr/share/applications/org.kde.sieveeditor.desktop                                                  \
  /usr/share/applications/syncthing-start.desktop                                                      \
  /usr/share/applications/syncthing-ui.desktop                                                         \
; do sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nNoDisplay=true@g' $i; done  &&                     \
sed -i 's/Network;FileTransfer;//' /usr/share/applications/steam.desktop


