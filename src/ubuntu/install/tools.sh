#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
apt-get update 
apt-get install -y vim wget net-tools locales bzip2 \
    python-numpy #used for websockify/novnc

apt-get install -y curl git ssh

# install gosu
dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" && \
curl -fsLo /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.11/gosu-$dpkgArch" && \
chmod +x /usr/local/bin/gosu && \
gosu nobody true
# complete gosu

apt-get clean -y

echo "generate locales für en_US.UTF-8"
locale-gen en_US.UTF-8