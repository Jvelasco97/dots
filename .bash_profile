#
# ~/.bash_profile
#

export XDG_CONFIG_HOME=/home/xerothyl/.config

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep bspwm || startx
fi


#eval "$(gh completion -s bash)"
