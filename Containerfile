ARG BASE_IMAGE_NAME
ARG HOST

FROM quay.io/fedora-ostree-desktops/${BASE_IMAGE_NAME}:41

# Create user "maik"
RUN useradd -G wheel -u 1000 -s /bin/bash maik && \
  usermod -p '$6$yIc8YCsXt1rkzeoc$72vBqymGWj7MCX0GduTvUMBqxAvxz4WYDJcASMEBaevyCrKAI1btoDM5czg366gwr6N55Zrn5zlPKTaUGsprV/' maik

# Customize the image
COPY ../_shared/files/ ${HOST}/files/ /
RUN shared/customize.sh &&                 \
    ${HOST}/customize.sh &&                \
    /usr/libexec/containerbuild/cleanup.sh