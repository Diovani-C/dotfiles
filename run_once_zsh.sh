#!/usr/bin/env bash

# Set zsh as default shell
printf "\n### Setting zsh as default shell \n"
chsh -s $(which zsh)

# Install zsh plugins
printf "\n### Installing zsh plugins \n"

if [[ ! -d ~/.config/zsh/syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/syntax-highlighting
fi

if [[ ! -d ~/.config/zsh/completions ]]; then
  git clone https://github.com/zsh-users/zsh-completions.git ~/.config/zsh/completions
  rm -f ~/.zcompdump
  compinit
fi

if [[ ! -d ~/.config/zsh/pure ]]; then
  git clone https://github.com/sindresorhus/pure.git ~/.config/zsh/pure
fi
