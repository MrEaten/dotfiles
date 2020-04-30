# Compatible with ranger 1.4.2 through 1.7.*
#
# Automatically change the directory in bash after closing ranger
#
# This is a bash function for .bashrc to automatically change the directory to
# the last visited one after ranger quits.
# To undo the effect of this function, you can type "cd -" to return to the
# original directory.
function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# powerline
#function _update_ps1() {
#    PS1=$(~/.local/bin/powerline-shell $?)
#}

#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi
#
# add to .dotfiles and create symlink

function add_dot  {

    directory=$(dirname $(readlink -f $1))
    directory_in_dot=${directory#"/home/"}
    directory_in_dot=${directory_in_dot#"$USER"}
    filename=$(basename $1)
    mkdir -p ~/.dotfiles$directory_in_dot
    mv $directory/$filename ~/.dotfiles$directory_in_dot/$filename
    ln -s ~/.dotfiles$directory_in_dot/$filename $directory/$filename

}

# set a shortcut for neovim
function v {
    nvim $1
}
