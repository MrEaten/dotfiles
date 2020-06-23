from libqtile.config import Key, Group, ScratchPad, DropDown, Drag, Click
from libqtile.command import lazy
from groups import init_group_names

mod = "mod4"

def init_keys(group_names=init_group_names()):
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
    for i, (name, kwargs) in enumerate(group_names, 1):
        keys.append(Key([mod], str(i), lazy.group[name].toscreen()))          # Switch to another group
        keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))   # Send current window to another group
    return keys

def init_mouse():
    return [Drag([mod], "Button1", lazy.window.set_position_floating(),      # Move floating windows
                 start=lazy.window.get_position()),
            Drag([mod], "Button3", lazy.window.set_size_floating(),          # Resize floating windows
                 start=lazy.window.get_size()),
            Click([mod, "shift"], "Button1", lazy.window.bring_to_front())]  # Bring floating window to front
