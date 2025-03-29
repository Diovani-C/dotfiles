#!/usr/bin/env bash

# Install asdf
curl -Lo "$HOME/bin/asdf.tar.gz" --create-dirs "https://github.com/asdf-vm/asdf/releases/download/v0.16.0/asdf-v0.16.0-linux-amd64.tar.gz"
tar -xf "$HOME/bin/asdf.tar.gz"
rm -rf "$HOME/bin/asdf.tar.gz"

declare -a plugins=("neovim" "nodejs" "zig" "erlang" "elixir" "golang")

# Install plugins
for p in "${plugins[@]}"; do
  asdf plugin add "$p"
  asdf install "$p" latest
  asdf set "$p" latest
done
