import os
import subprocess
from libqtile import hook
import psutil

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

@hook.subscribe.client_name_updated
def match_group_updated(window):
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

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])

@hook.subscribe.client_new
def _swallow(window):
    pid = window.window.get_net_wm_pid()
    ppid = psutil.Process(pid).ppid()
    cpids = {c.window.get_net_wm_pid(): wid for wid, c in window.qtile.windows_map.items()}
    for i in range(5):
        if not ppid:
            return
        if ppid in cpids:
            parent = window.qtile.windows_map.get(cpids[ppid])
            parent.minimized = True
            window.parent = parent
            return
        ppid = psutil.Process(ppid).ppid()

@hook.subscribe.client_killed
def _unswallow(window):
    if hasattr(window, 'parent'):
        window.parent.minimized = False
