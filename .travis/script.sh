#!/usr/bin/env bash

set -xmveuo pipefail

unset GEM_PATH
unset GEM_HOME
# We do this because we could not set newgrp earlier
sudo vagrant up pulp3-sandbox-centos8-stream
