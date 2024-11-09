FROM quay.io/fedora-ostree-desktops/kinoite:41

# Remove unneeded packages
RUN dnf remove -y firewall-config

# Add pam_home for mounting user home
RUN dnf install -y pam_mount

# Add desktop applications
RUN dnf install -y kate

# Add fonts
RUN dnf install -y     \
  jetbrains-mono-fonts \
  rsms-inter-fonts

# Add rpmfusion
RUN dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Add locale
RUN dnf install -y langpacks-de

# Create user "maik"
RUN useradd -G wheel -u 1000 -s /bin/bash maik && \
  usermod -p '$6$yIc8YCsXt1rkzeoc$72vBqymGWj7MCX0GduTvUMBqxAvxz4WYDJcASMEBaevyCrKAI1btoDM5czg366gwr6N55Zrn5zlPKTaUGsprV/' maik

# Set root password
RUN usermod -p '$6$0mpCQLE2YFito2uE$s5lcdmr2ebgKMEeTbxUSMQfIoT8JAF55mF/NX3EhYQVlq595IpCz8vJ1DvXbMamuRsJu9LQQz7QxOo9hVZmxx0' root

COPY system_files/ /
