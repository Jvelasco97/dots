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

if [[ $(xrandr | grep '^DP-1 connected') ]]; then
		xrandr --output eDP-1 --off &
fi

feh --bg-scale downloads/wallhaven-1km5dg.jpg &
/usr/bin/emacs --daemon &
pipewire &
pipewire-pulse &
wireplumber &
# picom &
sudo ckb-next-daemon &
~/.config/polybar/polybar-collection/launch.sh

if [[ "$(tty)" = "/dev/tty2" ]];
  then
			exec i3
	else
		exec bspwm -c ~/.config/bspwm/bspwmrc
fi
