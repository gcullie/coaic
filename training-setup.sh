#!/bin/bash

#scp -i "coaic-keys.pem" ~/git/coaic/training-setup.sh ubuntu@ec2-52-55-218-56.compute-1.amazonaws.com:~
#Don't forget to chmod u+x training-setup.sh
echo "This is a setup script for the image Deep Learning AMI Ubuntu Linux - 1.1 (ami-3568a023)"

INSTALLDIRECTORY=$1
NUMBEROFWORKER=4

if [[ -n "$name" ]]; then
    
else
    INSTALLDIRECTORY=~
fi
echo "Installing in directory $INSTALLDIRECTORY"


sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable
sudo apt-get update
sudo apt-get install -y tmux htop cmake
sudo apt-get upgrade
sudo apt-get install golang libjpeg-turbo8-dev make
sudo apt-get install python-pip python-dev build-essential
sudo pip install --upgrade pip
sudo apt-get install libx11-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev libxxf86vm-dev libgl1-mesa-dev mesa-common-dev
sudo pip install scipy

cd $INSTALLDIRECTORY
git clone https://github.com/openai/go-vncdriver.git
cd go-vncdriver
sudo python build.py
sudo pip install -e .
cd $INSTALLDIRECTORY

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

cd $INSTALLDIRECTORY
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

##OPTIONAL CV2 you dont need this for universe but you will for works
sudo apt-get update
#sudo apt-get install -y build-essential
#sudo apt-get install -y cmake
sudo apt-get install -y libgtk2.0-dev
#sudo apt-get install -y pkg-config
sudo apt-get install -y python-numpy python-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev 
sudo apt-get -qq install libopencv-dev build-essential checkinstall cmake pkg-config yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine2 libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils

cd $INSTALLDIRECTORY
wget http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/2.4.13/opencv-2.4.13.zip
unzip opencv-2.4.13.zip
cd opencv-2.4.13
mkdir release
cd release
cmake -G "Unix Makefiles" -DCMAKE_CXX_COMPILER=/usr/bin/g++ CMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local -DWITH_TBB=ON -DBUILD_NEW_PYTHON_SUPPORT=ON -DWITH_V4L=ON -DINSTALL_C_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON -DBUILD_EXAMPLES=ON -DWITH_QT=ON -DWITH_OPENGL=ON -DBUILD_FAT_JAVA_LIB=ON -DINSTALL_TO_MANGLED_PATHS=ON -DINSTALL_CREATE_DISTRIB=ON -DINSTALL_TESTS=ON -DENABLE_FAST_MATH=ON -DWITH_IMAGEIO=ON -DBUILD_SHARED_LIBS=OFF -DWITH_GSTREAMER=ON ..
make all -j10 # 4 cores
sudo make install


##OPTIONAL TF NO GPU, 2.7
pip install --upgrade tensorflow

echo "You the wo/man!!!"
echo "You must log out then back in for docker"
#[exit re-login]
