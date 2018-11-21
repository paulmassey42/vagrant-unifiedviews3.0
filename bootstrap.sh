#!/bin/bash

####################################################################
# Update the standard stuff ...
export DEBIAN_FRONTEND=noninteractive
apt-get install -y gawk dos2unix emacs curl make autoconf wget git sudo zip gnome gdm3
apt-get install -y apt-transport-https ca-certificates gnupg2 software-properties-common
apt-get remove -y docker docker-engine
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable"
apt-get -y update
apt-get -y upgrade
apt-get install -y docker-ce
docker run hello-world
curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.13.0/docker-compose-$(uname -s)-$(uname -m)"
chmod +x /usr/local/bin/docker-compose

pushd /usr/local
  git clone -b feature/compactmodular-3.0-releasebuild https://github.com/tenforce/docker-unified-views.git
  pushd docker-unified-views
     docker-compose -f cm-docker-compose.yml up -d
  popd
popd     

#################################################################################
apt-get -y autoremove
#################################################################################
