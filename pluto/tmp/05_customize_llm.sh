#! /bin/bash

# Add opencl support via rocm
dnf install --allowerasing -y                                                                         \
 rocm-opencl                                                                                          \
 rocm-clinfo

# Add ramalama
dnf install -y    \
 python3-ramalama \
