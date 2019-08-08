#!/bin/bash

echo "Building Ubuntu 19.04 as ubuntu-dev-tools"

rm -rf builds/*

cd packer_templates/ubuntu
packer build -only=virtualbox-iso ubuntu-19.04-amd64.json | tee ../../builds/build.log

if [ $? -eq 0 ] ; then
  echo "Success!! Will now add to vagrant"
  vagrant box remove ubuntu-dev-tools
  vagrant box add ../../builds/ubuntu-19.04.virtualbox.box --name ubuntu-dev-tools
fi





