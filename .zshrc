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

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# ENV
export VISUAL=nvim;
export EDITOR=nvim;
# export TERM="xterm-256color"
# export TERM="xterm"

# Case insensitive completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Ignore duplicate history
setopt hist_ignore_all_dups
setopt hist_save_no_dups

[[ $- != *i* ]] && return

#path to zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# custom color for the auto suggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7A8D9E"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# you need ls-icons installed to use the coreutils with icons

alias feh='feh --scale-down --auto-zoom'
# wc -l **/*.rs -- gets all the lines in directory

cl() { builtin cd "$@" && /opt/coreutils/bin/ls -a --color=auto; }

alias screenkey='screenkey -g 20%x45%+40%+50%'
alias record='ffmpeg -f x11grab -video_size 1920x1080 -framerate 25 -i $DISPLAY -f alsa -i alsa_output.pci-0000_00_1f.3.analog-stereo.monitor -c:v libx264 -preset ultrafast -c:a aac screen.mp4'
alias neo='neofetch --config ~/.config/neofetch/config.conf --crop_mode fit --w3m Pictures/2.jpg'
alias sp='sudo pacman -Syu'
alias vyxz="ssh xerothyl@vyxz.xyz -p 1304"
alias fsvyxz='sshfs xerothyl@vyxz.xyz:/var/www/vyxz/ ~/vyxz -p 1304'
alias update="sudo pacman -Syu && paru -Syu"
alias s="spotifyC"
alias RAC='cd ~/projects/RAC-Backend'
alias ls="/opt/coreutils/bin/ls --color=auto"

alias battery='< /sys/class/power_supply/BAT0/capacity'

# PS1='[\u@\h \W]\$ '

colorscript -r
eval "$(starship init zsh)"
