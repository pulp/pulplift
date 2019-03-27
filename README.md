# Pulplift

This is based on and makes use of the Vagrant based configuration of the
[Forklift](https://github.com/theforeman/forklift) project. Please see the Forklift documentation
for all configuration options available when creating custom boxes.

## Quickstart

To setup Pulplift, ensure that all submodules are updated and in place.

```
git submodule update --init
```

You will also need to [clone the source
code](https://docs.pulpproject.org/en/3.0/nightly/contributing/dev-setup.html#get-the-source).

Finally, you can spin up your development environment. With ``vagrant up <box-name>``

```
vagrant up pulp3-source-fedora28
```

## Available Boxes

The aim is to provide every supported OS and major installation type combination for Pulp 3 based
upon what is available from [ansible-pulp](https://github.com/pulp/ansible-pulp). The currently
supported boxes:

```
centos7                   not created (libvirt)
centos7-fips              not created (libvirt)
fedora28                  not created (libvirt)
fedora29                  not created (libvirt)
pulp3-containers-centos7  not created (libvirt)
pulp3-containers-fedora28 not created (libvirt)
pulp3-containers-fedora29 not created (libvirt)
pulp3-sandbox-centos7     not created (libvirt)
pulp3-sandbox-fedora28    not created (libvirt)
pulp3-sandbox-fedora29    not created (libvirt)
pulp3-source-centos7      not created (libvirt)
pulp3-source-fedora28     not created (libvirt)
pulp3-source-fedora29     not created (libvirt)
```

#### Base Boxes

The base OS boxes, such as centos7, can be used to spin-up a clean environment.

```
vagrant up centos7
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
[ansible-pulp](https://github.com/pulp/ansible-pulp#pulp-3-ansible-installer) role for more
detailed information.

#### Running a playbook directly

You can run an existing or custom playbook directly using `ansible-playbook`. For example:

```
vagrant up centos7
ansible-playbook my-pulp-install.yaml -l centos7
```
