if [ "$TERM"=="xterm" ]; then
  pgrep bspwm || startx
fi

eval "$(gh completion -s zsh)"
