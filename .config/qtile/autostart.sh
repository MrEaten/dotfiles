#!/bin/sh
killall sxhkd 
sxhkd -c ~/.config/sxhkd/sxhkdrc_qtile &
killall tint2
tint2 &
#killall volumeicon
#volumeicon &
#~/.config/polybar/active/launch.sh &
