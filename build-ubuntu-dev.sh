#!/usr/bin/env bash

# Create Nick's ubuntu dev box

cd packer_templates/ubuntu
packer build -only=virtualbox-iso ubuntu-19.04-amd64.json



