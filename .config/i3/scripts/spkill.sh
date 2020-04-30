currentDesk=$(xdotool get_desktop)
awkArgs="'\$2 == \"$currentDesk\" {print \$3}'"
getNumWindows="wmctrl -l | awk ${awkArgs} | wc -l"
numWindows=`eval $getNumWindows`

echo $numWindows
if ((numWindows > 1)); then
  i3-msg "kill"
else 
  i3-msg "kill; append_layout ~/.config/i3/scripts/empty_workspace.json"
fi

