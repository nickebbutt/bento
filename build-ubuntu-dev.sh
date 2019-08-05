#!/usr/bin/env bash

# Create Nick's ubuntu dev box

echo "Installing Packer"
export VER="1.4.2"
wget https://releases.hashicorp.com/packer/${VER}/packer_${VER}_linux_amd64.zip
unzip packer_${VER}_linux_amd64.zip
mv packer /usr/local/bin


packer --version

cd packer_templates/ubuntu
packer build -only=virtualbox-iso ubuntu-19.04-amd64.json



