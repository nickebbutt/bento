#!/bin/sh -eux

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
