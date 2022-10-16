#!/usr/bin/env bash
set -eu


CHOOSE_ROS_DISTRO=foxy
INSTALL_PACKAGE=desktop
TARGET_OS=focal

# Check OS version
if ! which lsb_release > /dev/null ; then
	sudo apt-get update
	sudo apt-get install -y curl lsb-release
fi

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1AF1527DE64CB8D9
sudo add-apt-repository "deb [arch=amd64] http://dist.carla.org/carla $(lsb_release -sc) main"


sudo apt-get update # Update the Debian package index
sudo apt-get install carla-simulator # Install the latest CARLA version, or update the current installation
cd /opt/carla-simulator # Open the folder where CARLA is installed


apt-cache madison carla-simulator # List the available versions of Carla
sudo apt-get install carla-simulator=0.9.10-1 # In this case, "0.9.10" refers to a CARLA version, and "1" to the Debian revision
