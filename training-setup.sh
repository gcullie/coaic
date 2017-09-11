#!/bin/bash

#scp -i "coaic-keys.pem" ~/git/coaic/training-setup.sh ubuntu@ec2-52-55-218-56.compute-1.amazonaws.com:~
#Don't forget to chmod u+x training-setup.sh
echo "This is a setup script for the image Deep Learning AMI Ubuntu Linux - 1.1 (ami-3568a023)"

NUMBEROFWORKER=4
sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable
sudo apt-get update
sudo apt-get install -y tmux htop cmake
sudo apt-get upgrade
sudo apt-get install golang libjpeg-turbo8-dev make
sudo apt-get install python-pip python-dev build-essential
sudo pip install --upgrade pip
sudo apt-get install libx11-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev libxxf86vm-dev libgl1-mesa-dev mesa-common-dev
sudo pip install scipy

cd ~
git clone https://github.com/openai/go-vncdriver.git
cd go-vncdriver
sudo python build.py
sudo pip install -e .
cd ~

sudo pip install universe
sudo pip install six
sudo pip install opencv-python

#cd ~
#git clone https://github.com/openai/universe.git
#cd universe
#pip install -e .
#sudo apt-get update

sudo pip install Twisted==16.4.1
sudo pip install opencv-python
sudo apt-get -y install htop ncdu tmux tree
sudo apt-get install iotop sysstat dbench dtrx mc slurm qalc
sudo apt-get install zlib1g-dev

cd ~
git clone https://github.com/openai/universe-starter-agent.git
sudo pip install gym[atari]

sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual

echo "***Installing Docker***"
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get install docker-ce

sudo groupadd docker
sudo usermod -aG docker $USER

sudo systemctl enable docker
#sudo systemctl disable docker

echo "You the wo/man!!!"
echo "You must log out then back in for docker"
#[exit re-login]
