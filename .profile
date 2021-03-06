# set environment variables
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=0
#export QT_SCALE_FACTOR=1.5
#export QT_QPA_PLATFORMTHEME=gtk2
#export EDITOR=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export PAGER=/usr/bin/less
export PATH=$PATH:~/scripts/shell:/usr/local/MATLAB/R2019a/bin/:~/.local/bin/:~/rtags/bin
export LC_ALL=en_US.utf8
export TERMINAL=alacritty
# load wallpaper with feh
~/.fehbg &
# load window compositor compton for transparency
picom --experimental-backend -b &
# compton --config ~/.config/compton/config &
# load polybar moved to window manager
#  ~/.config/polybar/my_bar/launch.sh &
# load hotkeys
sxhkd &

# start mpd
mpd &

#
emacs --daemon
# load redshift
# redshift-gtk &
# load dropbox
# dropbox &
# load network manager
nm-applet &
# load polkit authentication agent (allows install with pamac)
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# disable mouse acceleratoin
xset m 0 0 &
# load redshift
redshift-gtk &
# load nvidia settings
nvidia-settings --load-config-only
# volume icon
volumeicon &
# conky
conky -c ~/.conky/.conkyrc &

# set environment variable to fix java bugs with bspwm (matlab white windows)
export _JAVA_AWT_WM_NONREPARENTING=1

# set cursor (bspwm)
xsetroot -cursor_name left_ptr
