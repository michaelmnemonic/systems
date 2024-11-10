FROM quay.io/fedora-ostree-desktops/kinoite:41

# Apply file-based customization
COPY system_files/ /

# Apply script-based customization
COPY build_files/ /tmp/
RUN /tmp/customize.sh && /tmp/cleanup.sh

# Create user "maik"
RUN useradd -G wheel -u 1000 -s /bin/bash maik && \
  usermod -p '$6$yIc8YCsXt1rkzeoc$72vBqymGWj7MCX0GduTvUMBqxAvxz4WYDJcASMEBaevyCrKAI1btoDM5czg366gwr6N55Zrn5zlPKTaUGsprV/' maik
