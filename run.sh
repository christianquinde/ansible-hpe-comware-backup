#!/bin/bash

podman build -t ansible-comware .

podman run --rm -it \
  -v $(pwd):/ansible:Z \
  -v $(pwd)/ssh_config:/root/.ssh/config:Z \
  ansible-comware \
  ansible-playbook backup-comware.yml --ask-vault-password
