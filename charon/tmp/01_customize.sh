#! /bin/bash

# Add fonts
dnf install -y                                                                                     \
  rsms-inter-fonts                                                                                     \
  jetbrains-mono-fonts

# Set default devicetree in grub
echo "GRUB_DEFAULT_DTB=/dtb/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb" >> /etc/default/grub

# Rebuild initrd
kver=$(cd /usr/lib/modules && echo *); dracut -vf /usr/lib/modules/$kver/initramfs.img $kver
