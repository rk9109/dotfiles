#!/usr/bin/env bash
#
# xinitrc
#

# TODO xautolock
# TODO panel

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# update path
if [[ -d $HOME/.scripts ]]; then
    export PATH="$PATH:$HOME/.scripts"
fi

# update font path
if [[ -d $HOME/.local/share/fonts ]]; then
    xset +fp $HOME/.local/share/fonts
    xset fp rehash
fi

xrdb ~/.Xresources

# startup applications
compton &
dunst &
if [[ -f $HOME/.fehbg ]]; then
    sh $HOME/.fehbg
fi

exec i3
