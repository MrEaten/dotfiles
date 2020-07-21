import os
from libqtile.config import Screen
from libqtile import bar, widget
from colors import init_colors


def jgmenu_qtile(qtile):
    qtile.cmd_spawn(os.system('jgmenu_run >/dev/null 2>&1 &'))

def init_bar(color=init_colors()):
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
       widget.Spacer(580),
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
          display_format= '{updates}',
          font='Cantarell Bold',
          execute='pamac-manager',
          distro='Arch',
          update_interval=1
          ),
       widget.TextBox(
           text="|",
           ),
       widget.CheckUpdates(
          display_format= '{updates}',
          font='Cantarell Bold',
          distro='Arch',
          custom_command='yay -Qum 2>/dev/null',
          update_interval=1,
          execute='pamac-manager',
          ),
       widget.Spacer(10),
       widget.Net(),
       widget.Spacer(10),
       widget.TextBox(
           #text=' ',
           text='MEM:',
           ),
        widget.MemoryGraph(
            ),
        widget.Spacer(10),
       widget.TextBox(
           #text=" ",
           text='CPU:',
           ),
        widget.CPUGraph(
            ),
        widget.Spacer(10),
       widget.CurrentLayoutIcon(
           scale =0.5,
           ),
    ], 26, background=color[15], font='Cantarell Bold', fontsize=11)

def init_screens():
    return [Screen(top=init_bar(), x=1920, y=0, height=1080, width=1920),
            Screen(top=init_bar(), x=0, y=0, height=1080, width=1920)]
