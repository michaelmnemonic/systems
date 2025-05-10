ARG BASE_IMAGE_NAME

FROM quay.io/fedora-ostree-desktops/${BASE_IMAGE_NAME}:42

ARG HOST

# Set root password
RUN usermod --password '$6$yIc8YCsXt1rkzeoc$72vBqymGWj7MCX0GduTvUMBqxAvxz4WYDJcASMEBaevyCrKAI1btoDM5czg366gwr6N55Zrn5zlPKTaUGsprV/' root

# Customize the image
COPY ../_shared/ ${HOST}/ /
RUN find /tmp/ -name "*_customize*.sh" -exec {} \; && /tmp/cleanup.sh

# Check image
RUN bootc container lint
