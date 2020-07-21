#!/bin/sh
windowwidth=800
windowheight=600

screenwidth=1920
screenheight=1080
windowx=$(($screenwidth/2-$windowwidth/2))
windowy=$(($screenheight/2-$windowheight/2))

bspc rule -a KeePassXC state=floating rectangle=“$windowwidth”x”$windowheight”+”$windowx”+”$windowy” 
