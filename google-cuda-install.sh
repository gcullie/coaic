#!/bin/bash
echo "Checking for CUDA and installing ref. https://cloud.google.com/compute/docs/gpus/add-gpus#install-driver-script"
# Check for CUDA and try to install.
#must be run with sudo
if ! dpkg-query -W cuda-8-0; then
  # The 16.04 installer works with 16.10.
  curl -O https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
  dpkg -i ./cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
  apt-get update
  apt-get install cuda-8-0 -y
fi
# Enable persistence mode
nvidia-smi -pm 1
#nividia-smi to verify
#sudo modprobe nvidia    maybe needed
