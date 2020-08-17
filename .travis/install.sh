#!/usr/bin/env bash

set -xmveuo pipefail

sudo apt update
sudo apt install software-properties-common openssh-server vagrant-libvirt libvirt-daemon-system vagrant-sshfs qemu-utils qemu-kvm cpu-checker dnsmasq
# 20.04 focal has ansible 2.9, and no PPA for it.
if grep -i bionic /etc/os-release ; then
  sudo apt-add-repository --yes --update ppa:ansible/ansible
fi
sudo apt install ansible
sudo kvm-ok
sudo usermod -a -G libvirt $USER
sudo systemctl enable --now ssh
sudo systemctl enable --now libvirtd
# newgrp - libvirt # This causes Travis to hang, with or without the dash

free -m
df -h
df -hl
cat /proc/cpuinfo
sudo apt install virt-what
sudo virt-what
