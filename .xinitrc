#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

sxhkd -c ~/.config/sxhkd/sxhkdrc &

if [[ $(xrandr | grep '^DP1 connected') ]]; then
		xrandr --output eDP1 --off &
fi

feh --bg-scale downloads/wallhaven-dpddwl.jpg &
/usr/bin/emacs --daemon &
pipewire &
picom &
~/.config/polybar/murz/launch.sh
/usr/bin/pipewire -c /home/xerothyl/.config/pipewire/input-filter-chain.conf &

if [[ "$(tty)" = "/dev/tty2" ]];
  then
			exec i3
	else
		exec bspwm -c ~/.config/bspwm/bspwmrc
fi
