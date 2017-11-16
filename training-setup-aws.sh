#!/bin/bash
echo "This is a setup script for the aws image Deep Learning Base AMI (Ubuntu) (ami-f346c289) using a p3 gpu machine"


sudo apt-get install golang libjpeg-turbo8-dev make
sudo apt-get install -y htop
sudo apt install docker.io
sudo groupadd docker || true
sudo usermod -aG docker $USER || true
newgrp docker || true
sudo pip3 install tensorflow-gpu
git clone https://github.com/openai/universe.git
cd universe
sudo pip3 install -e .
export PATH="$PATH:/usr/local/cuda-8.0/bin"
export LD_LIBRARY_PATH="/usr/local/cuda-8.0/lib64"

echo "You da wo/man!! Don't forget to chmod u+x training-setup-aws.sh"
