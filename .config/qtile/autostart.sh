#!/bin/sh
killall sxhkd 
sxhkd -c ~/.config/sxhkd/sxhkdrc_qtile &
killall tint2
tint2 &
#~/.config/polybar/active/launch.sh &
