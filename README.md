# Personal config repository

This repository contains all my personal configuration files that I stole from other developers, you can pick what you want (only tested on linux).

## 00 - What will the setup script it do?

- Install [LazyVim](https://www.lazyvim.org/) for [neovim](https://neovim.io/)
- Install a [Nerd Font](https://www.nerdfonts.com/) -- Default: [JetbrainsMono Nerd Font](https://www.nerdfonts.com/)
- Generate a [ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- Set [Zsh](https://www.zsh.org/) as the default shell and install it's plugins
- Link all the config files using [chezmoi](https://www.chezmoi.io/what-does-chezmoi-do/)

## 01 - Dependencie apps

Before running the setup script you need to have some applications installed on your machine for the script to work

- [git](https://git-scm.com/)
- [curl](https://curl.se/)
- [zsh](https://www.zsh.org/)
- [chezmoi](https://www.chezmoi.io/what-does-chezmoi-do/)
- [chsh](https://linux.die.net/man/1/chsh) -- If you don't have and don't want to install it just run `sudo usermod --shell /bin/zsh $USER` instead


## 02 - Setting up

```bash
chezmoi init git@github.com:$GITHUB_USERNAME/dotfiles.git
```
