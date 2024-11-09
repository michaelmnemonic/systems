FROM quay.io/fedora-ostree-desktops/kinoite:41

# Remove unneeded packages
RUN dnf remove -y firewall-config

# Add pam_home for mounting user home
RUN dnf install -y pam_home

# Create user "maik"
RUN useradd -G wheel -u 1000 -s /bin/bash maik && \
  usermod -p '$6$yIc8YCsXt1rkzeoc$72vBqymGWj7MCX0GduTvUMBqxAvxz4WYDJcASMEBaevyCrKAI1btoDM5czg366gwr6N55Zrn5zlPKTaUGsprV/' maik

# Set root password
RUN usermod -p '$6$0mpCQLE2YFito2uE$s5lcdmr2ebgKMEeTbxUSMQfIoT8JAF55mF/NX3EhYQVlq595IpCz8vJ1DvXbMamuRsJu9LQQz7QxOo9hVZmxx0' root

COPY system_files/ /
