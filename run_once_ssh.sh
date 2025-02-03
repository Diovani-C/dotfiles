#!/usr/bin/env bash

# Create a SSH key
SSHKEY=~/.ssh/id_ed25519

if [[ ! -f "$SSHKEY" ]]; then

  read -p "Type an e-mail to create a SSH key:" Email

  printf "\n### Creating SSH Key \n"

  ssh-keygen -t ed25519 -C Email

  eval "$(ssh-agent -s)"

  ssh-add $SSHKEY

  printf "\n### SSH Key created at $SSHKEY \n"
fi
