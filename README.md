# Pulplift

This is based on and makes use of the Vagrant based configuration of the [Forklift](https://github.com/theforeman/forklift) project. Please see the Forklift documentation for all configuration options available when creating custom or adding new boxes.

## Available Boxes

The aim is to provide every supported OS and major installation type combination for Pulp 3 based upon what is available from [ansible-pulp3](https://github.com/pulp/ansible-pulp3). The currently supported boxes:

```
centos7                   not created (libvirt)
fedora27                  not created (libvirt)
fedora28                  not created (libvirt)
pulp3-sandbox-centos7     not created (libvirt)
pulp3-sandbox-fedora27    not created (libvirt)
pulp3-sandbox-fedora28    not created (libvirt)
pulp3-source-centos7      not created (libvirt)
pulp3-source-fedora27     not created (libvirt)
pulp3-source-fedora28     not created (libvirt)
```

Any of the `pulp3` labeled boxes will both spin-up and provision the labeled Ansible installation scenario for Pulp 3. The base OS boxes, such as centos7, can be used to spin-up a clean environment that any existing or custom playbook is run against directly. For example:

```
vagrant up centos7
ansible-playbook my-pulp-install.yaml -l centos7
```

## Setup

To setup Pulplift, ensure that all of [Forklift's requirements](https://github.com/theforeman/forklift#requirements) are met. Now run the `setup.sh` script:

```
./setup.sh
```
