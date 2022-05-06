#!/bin/bash

# bash_profile

umask 002
set -o monitor          # enable job control
set -o ignoreeof        # do not let CNTL-D exit the shell

# Set the prompt
PS1="\W|\h [\!]: "

# set 256 color profile where possible
if [[ $COLORTERM == gnome-* && $TERM == xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
    export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
    export TERM=xterm-256color
fi
eval `dircolors ~/.dir_colors`

source $HOME/.bash_exports
source $HOME/.bash_options
source $HOME/.bash_aliases
source $HOME/.bash_functions
source $HOME/.git-completion.bash

eval "$(rbenv init -)"
eval "$(pyenv init --path)"
eval "$(nodenv init -)"

eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
