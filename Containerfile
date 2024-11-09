FROM quay.io/fedora-ostree-desktops/kinoite:41

# Add rpmfusion
RUN dnf install -y                                                                                      \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm       \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Add addtional codecs
RUN dnf swap -y ffmpeg-free ffmpeg --allowerasing &&                                                    \
  dnf swap -y mesa-va-drivers mesa-va-drivers-freeworld &&                                              \
  dnf swap -y mesa-vdpau-drivers mesa-vdpau-drivers-freeworld

# Remove unneeded packages
RUN dnf remove -y firewall-config

# Add pam_home for mounting user home
RUN dnf install -y pam_mount

# Add lm-sensors for fan control via fan2go
RUN dnf install -y lm_sensors lm_sensors-libs

# Add desktop applications
RUN dnf install -y \
  AusweisApp2      \
  gwenview         \
  kate             \
  kcalc            \
  kdepim-addons    \
  kmail            \
  ksshaskpass      \
  merkuro          \
  mpv              \
  neochat          \
  okular           \
  pcsc-cyberjack   \
  skanpage         \
  syncthing        \
  transmission-qt

# Add gaming applications
RUN dnf install -y                  \
  --setopt=excludepkgs=nvtop        \
  gamescope                         \
  mangohud                          \
  steam                             \
  wine-arial-fonts                  \
  wine-core                         \
  wine-mono                         \
  wine-pulseaudio                   \
  wine-times-new-roman-fonts        \
  wine-times-new-roman-fonts-system

# Add fonts
RUN dnf install -y     \
  jetbrains-mono-fonts \
  rsms-inter-fonts

# Add locale
RUN dnf install -y langpacks-de

# Hide some application entries for
RUN for i in                                                                     \
  /usr/share/applications/syncthing-start.desktop                                \
  /usr/share/applications/syncthing-ui.desktop                                   \
  /usr/share/applications/org.kde.ktnef.desktop                                  \
  /usr/share/applications/org.kde.contactprintthemeeditor.desktop                \
  /usr/share/applications/org.kde.contactthemeeditor.desktop                     \
  /usr/share/applications/org.kde.headerthemeeditor.desktop                      \
  /usr/share/applications/org.kde.sieveeditor.desktop                            \
  ; do sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nNoDisplay=true@g' $i; done

# Create user "maik"
RUN useradd -G wheel -u 1000 -s /bin/bash maik && \
  usermod -p '$6$yIc8YCsXt1rkzeoc$72vBqymGWj7MCX0GduTvUMBqxAvxz4WYDJcASMEBaevyCrKAI1btoDM5czg366gwr6N55Zrn5zlPKTaUGsprV/' maik

# Set root password
RUN usermod -p '$6$0mpCQLE2YFito2uE$s5lcdmr2ebgKMEeTbxUSMQfIoT8JAF55mF/NX3EhYQVlq595IpCz8vJ1DvXbMamuRsJu9LQQz7QxOo9hVZmxx0' root

COPY system_files/ /
