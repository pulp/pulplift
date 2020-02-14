#!/usr/bin/env bash

set -xmveuo pipefail

sudo apt update
sudo apt install software-properties-common openssh-server vagrant-libvirt libvirt-bin vagrant-sshfs qemu-utils qemu-kvm cpu-checker
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
sudo kvm-ok
sudo usermod -a -G libvirt $USER
sudo systemctl enable --now ssh
sudo systemctl enable --now libvirtd
# newgrp - libvirt # This causes Travis to hang, with or without the dash
