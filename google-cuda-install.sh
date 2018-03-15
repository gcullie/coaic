#!/bin/bash
echo "Checking for CUDA and installing ref. https://cloud.google.com/compute/docs/gpus/add-gpus#install-driver-script"
#currently tensorflow requires CUDA® Toolkit 9.0
# Check for CUDA and try to install.
if ! dpkg-query -W cuda-9-0_9; then
  # The 16.04 installer works with 16.10.
  curl -O https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-9-0_9.0.176-1_amd64.deb
  dpkg -i ./cuda-9-0_9.0.176-1_amd64.deb
  apt-get update
  apt-get install cuda-9-0_9 -y
fi
# Enable persistence mode
nvidia-smi -pm 1
