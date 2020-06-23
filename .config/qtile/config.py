##### IMPORTS #####

import os
import re
import socket
import subprocess
from libqtile.config import Key, Screen, Group, Drag, Click, ScratchPad, DropDown
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
import psutil
from groups import (init_groups, init_floating_layout, init_layout_theme,
                            init_layouts, init_border_args)
from keys import init_keys, init_mouse
from screens import init_screens
import rules


### autostart ###
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])


### MAIN ###
if __name__ in ["config", "__main__"]:

    myTerm = "alacritty"                             # My terminal of choice
    myConfig = "/home/till/.config/qtile/config.py"    # Qtile config file location

    autostart()
    groups = init_groups()
    keys = init_keys()
    mouse = init_mouse()
    follow_mouse_focus = False
    floating_layout = init_floating_layout()

    layout_theme = init_layout_theme()
    border_args = init_border_args()
    layouts = init_layouts()
    screens = init_screens()

    wmname = "LG3D"
