#!/bin/sh -eux

exitOnError() {
    exit_code=$1
    last_command=${@:2}
    if [ $exit_code -ne 0 ]; then
        >&2 echo "\"${last_command}\" command failed with exit code ${exit_code}."
        exit $exit_code
    fi
}

# enable !! command completion
set -o history -o histexpand

apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  vim \
  curl \
  net-tools \
  netcat \
  wget \
  whois \
  openssh-client \
  openssl \
  git \
  git-lfs \
  git-man \
  lsof \
  telnet \
  zip \
  unzip \
  rsync \
  sed \
  gawk \
  time \
  ncurses-base \
  ncurses-bin \
  vim-doc \
  i7z \
  dos2unix \
  docker.io \
  docker-compose 
exitOnError $? !!
  
# Install ubuntu desktop and virtual box additions  
apt-get install -y ubuntu-desktop 
exitOnError $? !!
sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config
exitOnError $? !!

# Install chrome
CHROME_PKGNAME=google-chrome-stable_current_amd64.deb
wget https://dl.google.com/linux/direct/${CHROME_PKGNAME}
exitOnError $? !!
dpkg -i ${CHROME_PKGNAME}
exitOnError $? !!
rm ${CHROME_PKGNAME}

apt-get install -y openjdk-11-jdk
exitOnError $? !!

echo "Finished installing tools"
