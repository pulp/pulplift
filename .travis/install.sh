#!/usr/bin/env bash

set -xmveuo pipefail

sudo apt update

# Updating Vagrant may not be necessary anymore. Thought it would fix the hostname too long issue.
curl --output vagrant_2.2.9+dfsg-1_all.deb http://ftp.br.debian.org/debian/pool/main/v/vagrant/vagrant_2.2.9+dfsg-1_all.deb
sudo apt install ./vagrant_2.2.9+dfsg-1_all.deb
# Updating vagrant-sshfs is necessary to support CentOS 7,8 without repos pre-configured.
curl --output vagrant-sshfs_1.3.4-1_all.deb http://ftp.br.debian.org/debian/pool/main/v/vagrant-sshfs/vagrant-sshfs_1.3.4-1_all.deb
sudo apt install ./vagrant-sshfs_1.3.4-1_all.deb
rm ./vagrant-sshfs_1.3.4-1_all.deb

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

# For the source tests
mkdir ~/devel
cd ~/devel
git clone https://github.com/pulp/pulpcore
git clone https://github.com/pulp/pulp_file
