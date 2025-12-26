#!/bin/bash

HOST="$1"
USER="$2"

printf "screen-length disable\ndisplay current-configuration\n" | \
ssh -tt -F ssh_config "${USER}@${HOST}"
