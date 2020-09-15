#!/bin/bash

##################################################################
# Script to install Harbor
# First the prerequisites have to be installed, then grab the
#  tar from the Harbor GitHub
#
# Prerequisites for Harbor are:
# - Docker-Enginer
# - Docker-Compose
# - OpenSSL
##################################################################

sudo apt-get update

# install docker repository
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# install Docker Engine
sudo apt-get install docker-ce docker-ce-cli containerd.io

# make Docker run without sudo (exit session to see effect)
sudo groupadd docker
sudo gpasswd -a $USER docker

# install Docker Compose (Replace 1.27.2 for different version)
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

# download Harbor from GitHub and unzip
curl -sL https://github.com/goharbor/harbor/releases/download/v1.10.5/harbor-online-installer-v1.10.5.tgz | tar xz
