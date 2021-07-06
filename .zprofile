if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep bspwm || startx 
fi

if [[ "$(tty)" = "/dev/tty2" ]]; then
	pgrep i3 || startx 
fi
