#!/usr/bin/env bash

# Source machine-specific values (home, work, server, etc.).
. ~/.deezenv

# Set global Git email address.
if [[ "$(hostname)" == $HOSTNAME ]]; then
    git config --global user.email $EMAIL
fi
