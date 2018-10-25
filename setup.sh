#!/bin/bash

git clone https://github.com/theforeman/forklift
git clone https://github.com/pulp/ansible-pulp3

cd ansible-pulp3
ansible-galaxy install -r requirements.yml --roles-path=roles/
