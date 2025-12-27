#!/bin/bash

# bash_profile

umask 002
set -o monitor          # enable job control
set -o ignoreeof        # do not let CNTL-D exit the shell
set -o vi               # vi terminal

# Set the prompt
# PS1="\W|\h [\!]: "

# set 256 color profile where possible
if [[ $COLORTERM == gnome-* && $TERM == xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
    export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
    export TERM=xterm-256color
fi

# eval `dircolors ~/.dir_colors`

source $HOME/.bash_exports
source $HOME/.bash_options
source $HOME/.bash_aliases
source $HOME/.bash_shift5
source $HOME/.bash_functions

# Load Claude secrets (API keys, tokens, etc.)
[ -f ~/.claude-secrets ] && source ~/.claude-secrets

# settings for simple-git-prompt
#SIMPLE_GIT_PROMPT_MAX_PWD_LEN=24             # Uncomment to set a maximum length of current path (PWD). Use 0 to not display $PWD at all
SIMPLE_GIT_PROMPT_PREFIX="\u"               # Uncomment to change the standard prefix of this prompt
SIMPLE_GIT_PROMPT_SUFFIX=":"               # Uncomment to change the standard postfix of this prompt
source $HOME/.simple-git-prompt/simplegitprompt.sh

# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# mise
eval "$(/home/costrum/.local/bin/mise activate bash)"

# zoxide
eval "$(zoxide init bash)"

# Auto-set display variables for tmux when display server is accessible
if [ -n "$TMUX" ] && [ -z "$DISPLAY" ]; then
    # Check for Wayland first
    if [ -S "/run/user/$(id -u)/wayland-0" ]; then
        export DISPLAY=:0
        export WAYLAND_DISPLAY=wayland-0
        export XDG_SESSION_TYPE=wayland
        # Find and set XAUTHORITY for X11 apps under Wayland (XWayland)
        XAUTH_FILE=$(find /run/user/$(id -u) -name ".mutter-Xwaylandauth*" 2>/dev/null | head -1)
        if [ -n "$XAUTH_FILE" ]; then
            export XAUTHORITY="$XAUTH_FILE"
        fi
    # Check for X11 if not Wayland
    elif [ -S "/tmp/.X11-unix/X0" ]; then
        export DISPLAY=:0
        export XDG_SESSION_TYPE=x11
        # Find XAUTHORITY for X11
        if [ -z "$XAUTHORITY" ]; then
            if [ -f "$HOME/.Xauthority" ]; then
                export XAUTHORITY="$HOME/.Xauthority"
            else
                # Try to find it from a running X session
                XAUTH_FILE=$(find /run/user/$(id -u) -name "xauth_*" 2>/dev/null | head -1)
                [ -n "$XAUTH_FILE" ] && export XAUTHORITY="$XAUTH_FILE"
            fi
        fi
    fi
fi

