##### IMPORTS #####

import os
import re
import socket
import subprocess
from libqtile.config import Key, Screen, Group, Drag, Click, ScratchPad, DropDown
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.widget import Spacer

##### DEFINING SOME WINDOW FUNCTIONS #####


##### LAUNCH APPS IN SPECIFIED GROUPS #####

#def app_or_group(group, app):
#    def f(qtile):
#        if qtile.groupMap[group].windows:
#            qtile.groupMap[group].cmd_toscreen()
#        else:
#            qtile.groupMap[group].cmd_toscreen()
#            qtile.cmd_spawn(app)
#    return f

##### KEYBINDINGS #####

def init_keys():
    keys = [
#            Key(
#                [mod], "Tab",
#                lazy.next_layout()                      # Toggle through layouts
#                ),
#            Key(
#                [mod, "shift"], "q",
#                lazy.window.kill()                      # Kill active window
#                ),
#            Key(
#                [mod, "shift"], "r",
#                lazy.restart()                          # Restart Qtile
#                ),
            Key([mod, "control"], "1",
                lazy.to_screen(0)                       # Keyboard focus screen(0)
                ),
            Key([mod, "control"], "2",
                lazy.to_screen(1)                       # Keyboard focus screen(1)
                ),
            Key([], 'F12',
                lazy.group['scratchpad'].dropdown_toggle('pass')
                ),
            ### Window controls
#            Key(
#                [mod], "j",
#                lazy.layout.down()                      # Switch between windows in current stack pane
#                ),
#            Key(
#                [mod], "k",
#                lazy.layout.up()                        # Switch between windows in current stack pane
#                ),
#            Key(
#                [mod, "shift"], "j",
#                lazy.layout.shuffle_down()              # Move windows down in current stack
#                ),
#            Key(
#                [mod, "shift"], "k",
#                lazy.layout.shuffle_up()                # Move windows up in current stack
#                ),
#            Key(
#                [mod, "shift"], "l",
#                lazy.layout.grow(),                     # Grow size of current window (XmonadTall)
#                lazy.layout.increase_nmaster(),         # Increase number in master pane (Tile)
#                ),
#            Key(
#                [mod, "shift"], "h",
#                lazy.layout.shrink(),                   # Shrink size of current window (XmonadTall)
#                lazy.layout.decrease_nmaster(),         # Decrease number in master pane (Tile)
#                ),
#            Key(
#                [mod], "n",
#                lazy.layout.normalize()                 # Restore all windows to default size ratios
#                ),
#            Key(
#                [mod], "m",
#                lazy.layout.maximize()                  # Toggle a window between minimum and maximum sizes
#                ),
#            Key(
#                [mod, "shift"], "space",
#                lazy.window.toggle_floating()           # Toggle floating
#                ),
        ]
    return keys


##### GROUPS #####

def init_group_names():
    return [
            ("1", {'layout': 'monadtall','label':''}),
            ("2", {'layout': 'monadtall','label':''}),
            ("3", {'layout': 'monadtall','label':''}),
            ("4", {'layout': 'floating','label':''}),
            ("5", {'layout': 'monadtall','label':''}),
            ("6", {'layout': 'monadtall','label':''}),
            ("7", {'layout': 'monadtall','label':''}),
            ("8", {'layout': 'monadtall','label':''}),
            ("9", {'layout': 'monadtall','label':''})
            ]

def init_groups():
    groups = [Group(name, **kwargs) for name, kwargs in group_names]
    groups.append( ScratchPad("scratchpad", [
                    DropDown("term", "alacritty", opacity=1),
                    DropDown("pass", "keepassxc", opacity=1)
                    ]))
    return groups

def init_colors():
    colors = [
            "#5C6370",
            "#4B5263",
            "#E06C75",
            "#BE5046",
            "#98C379",
            "#98C379",
            "#E5C07B",
            "#D19A66",
            "#61AFEF",
            "#61AFEF",
            "#C678DD",
            "#C678DD",
            "#56B6C2",
            "#56B6C2",
            "#ABB2BF",
            "#282C34",
    ]
    return colors;

color = init_colors()

def jgmenu_qtile(qtile):
    qtile.cmd_spawn(os.system('jgmenu_run >/dev/null 2>&1 &'))

def pulseaudio_control(qtile):
    os.system('~/scripts/pulseaudio_control/pulseaudio-control.sh --listen')

def init_bar():
    return bar.Bar([
        widget.TextBox(
            text="",
            font = "fontello",
            foreground=color[14],
            fontsize=23,
            padding=5,
            mouse_callbacks = {'Button1': jgmenu_qtile}
            ),
       widget.GroupBox(
           active = color[12],
           inactive = color[14],
           this_current_screen_border = color[10],
           highlight_method = "line",
           font = "fontello",
           highlight_color=[color[15]],
           center_aligned=True,
           disable_drag=True,
           fontsize=14
       ),
       widget.Spacer(596),
       widget.TextBox(
           text='',
           font="icomoon",
           ),
       widget.Clock(
           format='%Y-%m-%d',
           foreground = color[14],
           fontsize=11,
           font='Cantarell Bold',
           ),
       widget.TextBox(
           text=' ',
           font="icomoon",
           ),
       widget.Clock(
           format='%H:%M',
           foreground = color[14],
           fontsize=11,
           font='Cantarell Bold',
           ),
       widget.Spacer(bar.STRETCH),
       widget.TextBox(
           text="",
           font="icomoon",
           ),
       widget.CheckUpdates(
          display_format= "{updates}",
          font='Cantarell Bold',
          execute='pamac-manager',
          ),
       widget.TextBox(
           font="icomoon",
           text=" ",
           ),
       widget.Volume(
           volume_app="pavucontrol",
           font='Cantarell Bold'
           ),
       widget.CurrentLayoutIcon(
           scale =0.5,
           ),
    ], 26, background=color[15], font='Cantarell Bold', fontsize=11)

##### LAYOUTS #####

def init_floating_layout():
    return layout.Floating(border_focus=color[8])

def init_layout_theme():
    return {"border_width": 2,
            "margin": 16,
            "border_focus": color[8],
            "border_normal": color[15]
           }

def init_border_args():
    return {"border_width": 2}

def init_layouts():
    return [#layout.MonadWide(**layout_theme),
            #layout.Bsp(**layout_theme),
            #layout.Stack(stacks=2, **layout_theme),
            #layout.Columns(**layout_theme),
            #layout.RatioTile(**layout_theme),
            #layout.VerticalTile(**layout_theme),
            #layout.Tile(shift_windows=True, **layout_theme),
            #layout.Matrix(**layout_theme),
            #layout.Zoomy(**layout_theme),
            layout.MonadTall(**layout_theme),
            layout.Max(**layout_theme),
            layout.Floating(**layout_theme)]


##### SCREENS ##### (TRIPLE MONITOR SETUP)

def init_screens():
    return [Screen(top=init_bar(), x=1920, y=0, height=1080, width=1920),
            Screen(top=init_bar(), x=0, y=0, height=1080, width=1920)
            ]

##### FLOATING WINDOWS #####

@hook.subscribe.client_new
def floating(window):
    floating_types = ['notification', 'toolbar', 'splash', 'dialog', 'confirm', 'download'
                      'error', 'file_progress']
    transient = window.window.get_wm_transient_for()
    if window.window.get_wm_type() in floating_types or transient:
        window.floating = True

@hook.subscribe.client_new
def match_group(window):
    music = ['Spotify Premium','cmus']
    video = ['VLC','mpv','Celluloid']
    messaging = ['Thunderbird','Whatsapp - Mozilla Firefox','Discord','Zoom','Microsoft Teams', 'Teamspeak3']
    downloaders = ['Steam','Lutris','pacman','pamac','Blizzard']
    games = ['Overwatch','League of Legends','Dirt Rally','Sunless Sea','Dark Souls']
    for client in messaging:
        if client in window.name:
            window.togroup('5')
    for client in downloaders:
        if client in window.name:
            window.togroup('6')
    for client in games:
        if client in window.name:
            window.togroup('7')
    for player in video:
        if player in window.name:
            window.togroup('8')
    for player in music:
        if player in window.name:
            window.togroup('9')

#@hook.subscribe.client_new
#def reload_tint(window):
#    os.system('pkill -USR1 tint2')


@hook.subscribe.client_name_updated
def match_group(window):
    music = ['Spotify Premium']
    video = []
    messaging = ['Teamspeak3']
    downloaders = []
    games = []
    for client in messaging:
        if client in window.name:
            window.togroup('5')
    for client in downloaders:
        if client in window.name:
            window.togroup('6')
    for client in games:
        if client in window.name:
            window.togroup('7')
    for player in video:
        if player in window.name:
            window.togroup('8')
    for player in music:
        if player in window.name:
            window.togroup('9')

def init_mouse():
    return [Drag([mod], "Button1", lazy.window.set_position_floating(),      # Move floating windows
                 start=lazy.window.get_position()),
            Drag([mod], "Button3", lazy.window.set_size_floating(),          # Resize floating windows
                 start=lazy.window.get_size()),
            Click([mod, "shift"], "Button1", lazy.window.bring_to_front())]  # Bring floating window to front

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])

##### DEFINING A FEW THINGS #####

if __name__ in ["config", "__main__"]:
    mod = "mod4"                                     # Sets mod key to SUPER/WINDOWS
    myTerm = "alacritty"                             # My terminal of choice
    myConfig = "/home/till/.config/qtile/config.py"    # Qtile config file location

    autostart()
    keys = init_keys()
    mouse = init_mouse()
    follow_mouse_focus = False
    group_names = init_group_names()
    groups = init_groups()
    floating_layout = init_floating_layout()

    layout_theme = init_layout_theme()
    border_args = init_border_args()
    layouts = init_layouts()
    screens = init_screens()

##### SETS GROUPS KEYBINDINGS #####

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))          # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))   # Send current window to another group

##### NEEDED FOR SOME JAVA APPS #####

wmname = "LG3D"
