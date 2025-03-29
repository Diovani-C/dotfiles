#!/usr/bin/env bash

# Set fish as default shell
printf "\n### Setting fish as default shell \n"
chsh -s "$(which fish)"

# Install Starship
curl -sS https://starship.rs/install.sh | sh
