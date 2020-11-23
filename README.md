# Pulplift

:warning: **This Repository is deprecated.** It's features were merged into [pulp installer](https://github.com/pulp/pulp_installer).

This is based on and makes use of the Vagrant based configuration of the
[Forklift](https://github.com/theforeman/forklift) project. Please see the Forklift documentation
for all configuration options available when creating custom boxes.

## Requirements

- Ansible 2.5+
- Vagrant 1.8+
- Vagrant provider plugin (follow [vagrant](
  https://www.vagrantup.com/docs/providers/installation.html) instructions)
  - libvirt and virtualbox supported
- Recommended: [Vagrant sshfs plugin](https://github.com/dustymabe/vagrant-sshfs#install-plugin) if using libvirt
- Enabled virtualization in BIOS

#### Quick install requirements on Fedora
```
sudo dnf install ansible vagrant-libvirt vagrant-sshfs @virtualization
sudo virt-host-validate
```

## Setup

Before using Pulplift, ensure that all submodules are updated and in place.

```
git submodule update --init --remote
```

After your git submodules are installed, you can then use ``vagrant up <box-name>`` to create a Pulp
environment. See the list of available boxes below.

## Setting up a dev environment

After you've set up the git submodules as outlined in the Setup section, you will need to [clone
the source code](https://docs.pulpproject.org/en/master/nightly/contributing/dev-setup.html#get-the-source).

You can then spin up your development environment with the following ``vagrant`` command. If you
have any custom configuration options **including plugin choice**, see "Configuration" section
below.

For more information about dev environment, please look into [pulp_devel](https://github.com/pulp/pulp_installer/tree/master/roles/pulp_devel) role into [pulp_installer](https://github.com/pulp/pulp_installer#roles)

```
vagrant up pulp3-source-fedora32
```

## Available Boxes

The aim is to provide every supported OS and major installation type combination for Pulp 3 based
upon what is available from [pulp_installer](https://github.com/pulp/pulp_installer). The currently
supported boxes:

```
centos7                            not created (libvirt)
centos7-fips                       not created (libvirt)
centos8                            not created (libvirt)
centos8-fips                       not created (libvirt)
centos8-stream                     not created (libvirt)
debian10                           not created (libvirt)
fedora31                           not created (libvirt)
fedora32                           not created (libvirt)
pulp2-nightly-pulp3-source-centos7 not created (libvirt)
pulp3-sandbox-centos7              not created (libvirt)
pulp3-sandbox-centos7-fips         not created (libvirt)
pulp3-sandbox-centos8              not created (libvirt)
pulp3-sandbox-centos8-fips         not created (libvirt)
pulp3-sandbox-centos8-stream       not created (libvirt)
pulp3-sandbox-debian10             not created (libvirt)
pulp3-sandbox-fedora31             not created (libvirt)
pulp3-sandbox-fedora32             not created (libvirt)
pulp3-source-centos7               not created (libvirt)
pulp3-source-centos7-fips          not created (libvirt)
pulp3-source-centos8               not created (libvirt)
pulp3-source-centos8-fips          not created (libvirt)
pulp3-source-centos8-stream        not created (libvirt)
pulp3-source-debian10              not created (libvirt)
pulp3-source-fedora31              not created (libvirt)
pulp3-source-fedora32              not created (libvirt)
```

#### Base OS Boxes

The base OS boxes, such as `centos7`, can be used to spin-up a clean environment.

```
vagrant up centos7
```

#### Sandbox boxes

Sandbox boxes, such as `pulp3-sandbox-centos7` can be used to do a standard install of Pulp for users.

```
vagrant up pulp3-sandbox-centos7
```

#### Source boxes

Source boxes, such as `pulp3-source-centos7` can be used to do an install of pulp with developer tools & helper scripts/aliases for developers.

The example [configuration](#Configuration) requires that the `pulpcore` git repo directory and plugin git repo directories (e.g. `pulp_file`) exist in folders, under the same parent folder as `pulplift`, so they can be mounted on the box.

If using libvirt, the [vagrant-sshfs](https://github.com/dustymabe/vagrant-sshfs#install-plugin) plugin must be installed to mount.

```
vagrant up pulp3-source-centos7
```

## Ansible

Any of the `pulp3` labeled boxes will both spin-up and provision the labeled Ansible installation
scenario for Pulp 3.

#### Configuration

Each box uses a playbook appropriate for the type of installation specified in the box name.
Additional ansible variables are defined in ``example.dev-config.yml`` and
``example.user-config.yml``. If you need to change these variables, **including choosing which
plugins to install**, copy one of these files to **create a local variable file**. Pulplift will
look for ``local.dev-config.yml`` or ``local.user-config.yml``, which are not checked into git.

Any of the Ansible variables can be set in this local variable file. Please see the README of each
[pulp_installer](https://github.com/pulp/pulp_installer#roles) role for more
detailed information.

#### Running a playbook directly

You can run an existing or custom playbook directly using `ansible-playbook`. For example:

```
vagrant up centos7
ansible-playbook my-pulp-install.yaml -l centos7
```
