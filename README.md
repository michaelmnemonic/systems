# About this repository

Experiements with fedora ostree container image.

# Install on luks encrypted root

```
podman run --rm --privileged --pid=host -v /mnt:/target -v /dev:/dev -v /var/lib/containers:/var/lib/containers --security-opt label=type:unconfined_t ghcr.io/michaelmnemonic/pluto:latest bootc install to-filesystem --boot-mount-spec=$(blkid -s UUID -o value <storage device>) --karg=rd.luks.uuid=$(blkid -s UUID -o value <storage device>) /target
```
