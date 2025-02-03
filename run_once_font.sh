#!/usr/bin/env bash

# Install Nerd Font
NERDFONT=~/.local/share/fonts/

read -p "Enter a nerd font name [JetBrainsMono]:" FontName
FontName=${FontName:-JetBrainsMono}

NERDFONT="${NERDFONT}${FontName}"

if [[ ! -d "$NERDFONT" ]]; then

  printf "\n### Installing ${FontName} Nerd Font \n"

  curl -fLo "${NERDFONT}.zip" --create-dirs \
    "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FontName}.zip"

  unzip "${NERDFONT}.zip" -d "$NERDFONT"

  rm "${NERDFONT}.zip"

  printf "\n### ${FontName} Nerd Font installed! \n"
fi
