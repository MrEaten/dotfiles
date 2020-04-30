# Lines configured by zsh-newuser-install
unsetopt autocd beep extendedglob notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

# End of lines added by compinstall

# Enable colors and change prompt:
autoload -U colors && colors
#PS1="%B%{$fg[white]%}[%{$fg[magenta]%}%n%{$fg[white]%}@%{$fg[blue]%}%M %{$fg[white]%}%~%{$fg[white]%}]%{$reset_color%}$%b "


# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/histfile
setopt appendhistory nomatch

# enable substitution
set -o GLOB_SUBST

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

source ~/.config/zsh/agkozak-zsh-prompt.plugin.zsh
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/zsh/.zsh_aliases" ] && source "$HOME/.config/zsh/.zsh_aliases"
[ -f "$HOME/.config/zsh/.zsh_functions" ] && source "$HOME/.config/zsh/.zsh_functions"
[ -f "$HOME/.config/zsh/.zsh_envvar" ] && source "$HOME/.config/zsh/.zsh_envvar"


# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
