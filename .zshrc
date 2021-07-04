# set vi mode
set -o vi
#set history size
export HISTSIZE=10000
#save history after logout
export SAVEHIST=10000
#history file
export HISTFILE=~/.zhistory
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS

# Android emulator paths
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/home/xerothyl/.cargo/bin

# ENV
export VISUAL=nvim;
export EDITOR=nvim;
export TERM="xterm"

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Organize completions by categories
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' format $'\n%F{yellow}Completing %d%f\n'
zstyle ':completion:*' group-name ''

# Respect multibyte characters when found in strings
# unsetopt MULTIBYTE

# When new programs is installed, auto update autocomplete without reloading shell
zstyle ':completion:*' rehash true

# Ignore duplicate history
setopt hist_ignore_all_dups
setopt hist_save_no_dups

[[ $- != *i* ]] && return

#path to zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# custom color for the auto suggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan,bg=#111,bold,underline"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# you need ls-icons installed to use the coreutils with icons

alias ls='/opt/coreutils/bin/ls --color=auto'
# alias ls='ls --color=auto'
alias l='/opt/coreutils/bin/ls --color=auto -lh'
# alias l='ls --color=auto -lh'
alias l='/opt/coreutils/bin/ls --color=auto -lha'
# alias la='ls --color=auto -lha'

alias neo='neofetch --config ~/.config/neofetch/config.conf --crop_mode fit --w3m Pictures/2.jpg'
alias n='nvim'
alias sn='sudo nvim'
alias sp='sudo pacman -Syu'
alias vyxz="ssh xerothyl@vyxz.xyz -p 1304"
alias fsvyxz='sshfs xerothyl@vyxz.xyz:/var/www/vyxz/ ~/vyxz -p 1304'
alias update="sudo pacman -Syu && paru -Syu"
alias tmux="TERM=screen-256color-bce tmux"
alias zellij="zellij --layout ~/.config/zellij/config.yaml"
alias RAC='cd ~/projects/RAC-Backend'

PS1='[\u@\h \W]\$ '

eval "$(starship init zsh)"
~/.local/bin/fetching -r
