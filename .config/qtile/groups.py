from libqtile.config import Group, DropDown, ScratchPad
from libqtile import layout
from colors import init_colors

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

def init_groups(group_names=init_group_names()):
    groups = [Group(name, **kwargs) for name, kwargs in group_names]
    groups.append( ScratchPad("scratchpad", [
                    DropDown("term", "alacritty", opacity=1),
                    DropDown("pass", "keepassxc", opacity=1)
                    ]))
    return groups



def init_floating_layout(color=init_colors()):
    return layout.Floating(border_focus=color[8])

def init_layout_theme(color=init_colors()):
    return {"border_width": 2,
            "margin": 16,
            "border_focus": color[8],
            "border_normal": color[15]
           }

def init_layouts(layout_theme=init_layout_theme()):
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

def init_border_args():
    return {"border_width": 2}
