FROM quay.io/fedora-ostree-desktops/kinoite:41

# Set root password
RUN sed -i 's|root:[^:]*|root:$6$0mpCQLE2YFito2uE$s5lcdmr2ebgKMEeTbxUSMQfIoT8JAF55mF/NX3EhYQVlq595IpCz8vJ1DvXbMamuRsJu9LQQz7QxOo9hVZmxx0' /etc/shadow
