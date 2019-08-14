#!/bin/sh -eux

exitOnError() {
  if [ $? -ne 0 ] ; then
    returnCode=$?
    echo "Failed during command $1"
    exit returnCode
  fi
}

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
exitOnError "apt-get install tools"
  
# Install ubuntu desktop and virtual box additions  
apt-get install -y ubuntu-desktop 
exitOnError "apt-get install ubuntu-desktop"
sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config
exitOnError "amend allowed users"

# Install chrome
CHROME_PKGNAME=google-chrome-stable_current_amd64.deb
wget https://dl.google.com/linux/direct/${CHROME_PKGNAME}
exitOnError "download chrome"
dpkg -i ${CHROME_PKGNAME}
exitOnError "install chrome"
rm ${CHROME_PKGNAME}

apt-get install -y openjdk-11-jdk
exitOnError "install openjdk-11-jdk"

echo "Finished installing tools"
