export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export TERM="linux"

[[ $- != *i* ]] && return

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias ls='ls --color=auto'
alias neo='neofetch --config ~/.config/neofetch/config.conf --crop_mode fit --w3m Pictures/2.jpg'
alias luamake=/home/xerothyl/lsp/lua-language-server/3rd/luamake/luamake
alias n='~/Downloads/nvim.appimage'
alias sn='sudo ~/Downloads/nvim.appimage'
alias sp='sudo pacman -Syu'
alias vyxz="ssh xerothyl@vyxz.xyz -p 1304"
alias update="sudo pacman -Syu && paru -Syu"
alias tmux="TERM=screen-256color-bce tmux"
alias zellij="zellij --layout ~/.config/zellij/config.yaml"
alias RAC='cd ~/projects/RAC-Backend'

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
neofetch
