# ~/.config/fish/config.fish

# ===== Environment Variables =====
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx BAT_THEME "Visual Studio Dark+"
set -gx EXA_COLORS "di=34:ur=32:uw=31:ux=34:ue=32:gr=33:gw=31:gx=33:tr=33:tw=31:tx=33"

# ===== Path Configuration =====
fish_add_path $HOME/bin
fish_add_path (test -n "$ASDF_DATA_DIR"; and echo "$ASDF_DATA_DIR"/shims; or echo "$HOME/.asdf"/shims)

# ===== Prompt Configuration =====
starship init fish | source # Requires starship.rs installation

# ===== Core Utilities =====
if command -v eza >/dev/null
    function ls --wraps eza --description "Modern ls replacement"
        command eza --group-directories-first --icons $argv
    end
end

if command -v bat >/dev/null
    function cat --wraps bat --description "Cat replacement with syntax highlighting"
        command bat --theme="$BAT_THEME" $argv
    end
end

# ===== Zoxide Configuration =====
zoxide init fish | source
alias cd="z"

# ===== Enhanced Aliases =====
# Navigation
alias ..="z .."
alias ...="z ../.."
alias ....="z ../../.."
alias home="z ~"

# Directory shortcuts
alias d="z ~/Documents"
alias dl="z ~/Downloads"
alias dt="z ~/Desktop"
alias p="z ~/Projects"

# Modern replacements
alias ls="eza --group-directories-first --icons"
alias la="ls -al"
alias lt="ls --tree --level=2"
alias ltg="ls --tree --level=2 --git-ignore"
alias cat="bat --theme=\"\$BAT_THEME\""
alias less="bat --theme=\"\$BAT_THEME\" --paging=always"
alias grep="rg"
alias find="fd"
alias docker="podman"

# Safety first
alias rm="rm -iv"
alias cp="cp -iv"
alias mv="mv -iv"

# Git shortcuts
alias g="git"
alias gs="git status"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias gd="git diff"
alias ga="git add -p"

# Development utilities
alias py="python3"
alias node-repl="NODE_NO_READLINE=1 node"
alias docker-compose="docker compose"

# ===== Enhanced Shell Features =====
# Interactive file operations
function mkcd -d "Create directory and cd into it"
    mkdir -p $argv && cd $argv
end

# Quick config editing
function conf -d "Open config files in neovim"
    switch $argv
        case fish
            nvim ~/.config/fish/config.fish
        case nvim
            nvim ~/.config/nvim/init.vim
        case '*'
            echo "Unknown config: $argv"
    end
end

# ===== Developer Productivity =====
# Source code search
function codegrep -d "Search codebase efficiently"
    rg --smart-case --hidden --follow --glob '!{.git,node_modules,vendor}' $argv
end

# Process management
alias psa="ps aux | rg -i"

# ===== System Monitoring =====
alias disk="df -h | rg -v 'snapd' | eza --header --icons -T"
alias mem="free -h | eza --header --icons -T"

# ===== Network Utilities =====
alias ports="netstat -tulpn"
alias myip="curl ifconfig.me"

# ===== Package Management =====
if command -v apt >/dev/null
    alias update="sudo apt update && sudo apt upgrade -y"
else if command -v dnf >/dev/null
    alias update="sudo dnf upgrade -y"
else if command -v brew >/dev/null
    alias update="brew update && brew upgrade"
end

# ===== Terminal Productivity =====
# Create a directory and enter it
function take -d "Create and enter directory"
    mkdir -p $argv && cd $argv
end

# Quick file content inspection
function peek -d "Quick preview of file contents"
    bat --color=always --style=numbers,changes --line-range :500 $argv
end

# ===== Shell Configuration =====
# Disable greeting
set -U fish_greeting

# Use fzf for history search
function fish_user_key_bindings
    bind \cr 'history | fzf --height 40% | read -l cmd; and commandline -b $cmd'
end

# Better terminal colors
set -U fish_color_autosuggestion brblack
set -U fish_color_command blue
set -U fish_color_error red
set -U fish_color_param cyan

# ===== Final Initialization =====
# Source local machine-specific config if exists
if test -f ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end
