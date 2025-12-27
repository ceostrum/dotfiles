# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Listing
alias ls='ls -F --color --group-directories-first'
alias ll='ls -lFh --color --group-directories-first'
alias l='ll | less'
alias la='ls -laF --color --group-directories-first'
alias lsd="ls -lF --color | grep --color=never '^d'"
alias lr='ls -lFhR --color --group-directories-first'

# tmux
alias tmux="TERM=screen-256color-bce tmux"
alias tls='tmux ls'
alias ta='tmux a -t'

alias h='history'
alias p='pwd'

alias proc='ps -l -u `whoami`'
alias prockill='pgrep -u `whoami` | xargs kill -9'
alias be='sudo su -'

# Git
alias gs='git status'
alias cgs='clear; git status'
alias gp='git pull'
alias gpu='git push'
# alias gb='git branch'
alias gd='git difftool -w'
alias gl='git log --pretty=oneline'
alias gg='git log --graph --oneline --decorate --all'
alias gco='git checkout'
alias gcod='git checkout develop'
alias gcom='git checkout main'
alias gca='git commit -am'
alias gcm='git commit -m'
alias gprunelocal='git branch --merged main | grep -v 'main$' | xargs git branch -d 2>/dev/null'
alias gpruneremote='git remote prune origin'

# curl
alias get='curl -s'
alias getv='curl -v'
alias post='curl -s -X POST'
alias postv='curl -v -X POST'

# docker
alias dco='docker container'
alias di='docker image'

# python
alias pve='python -m venv venv'
alias cpve='rm -rf venv'
alias pa='source venv/bin/activate'
alias pd='deactivate'
alias pipu='pip3 install --upgrade pip'
alias pipi='pip3 install -r requirements.txt'
alias pysetup='pve; pa; pipu; pipi'

# uv
alias uvr='uv run'

# time
alias epochnow='date +%s%N | cut -b1-16'

# go
alias gmt='go mod tidy'
alias gmc='go clean -cache -modcache'

# make
alias mb='make dev'
alias ml='make local'
alias mr='make run'
alias mt='make test'

# vscode
ci() {
    local display_set=false

    if [ -n "$TMUX" ]; then
        for try_display in $(tmux show-environment | grep "^DISPLAY" | cut -d= -f2) \
                           "$DISPLAY" \
                           ":0" \
                           ":1" \
                           ":10"; do
            if [ -n "$try_display" ]; then
                export DISPLAY="$try_display"
                if xset q &>/dev/null 2>&1 || xdpyinfo &>/dev/null 2>&1; then
                    display_set=true
                    echo "Using DISPLAY=$DISPLAY"
                    break
                fi
            fi
        done
    elif [ -z "$DISPLAY" ]; then
        for try_display in ":0" ":1" ":10"; do
            export DISPLAY="$try_display"
            if xset q &>/dev/null 2>&1 || xdpyinfo &>/dev/null 2>&1; then
                display_set=true
                echo "Using DISPLAY=$DISPLAY"
                break
            fi
        done
    fi

    if [ "$display_set" = false ] && [ -z "$DISPLAY" ]; then
        export DISPLAY=":0"
        echo "Warning: No valid X display found, defaulting to DISPLAY=:0"
    fi

    code-insiders "$@"
}

alias fix-display='~/.local/bin/fix-display'
alias cir='DISPLAY=:0 code-insiders'
alias cursor='DISPLAY=:1 cursor'

# fzw
alias R='cd "$(git rev-parse --show-toplevel)"'
alias ga="git status --porcelain -u | fzf -m --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all | awk '{\$1=\"\"; print \$0}' | xargs -I {} git add {}"
alias gb="git branch | fzf | awk '{print $1}' | xargs git checkout"
alias gbd="git branch | fzf -m | awk '{print $1}' | xargs -I {} git branch -D {}"
alias gr="git status --porcelain | grep -v '^??' | grep -v '^ ' | fzf -m --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all | awk '{\$1=\"\"; print \$0}' | xargs -I {} git restore --staged {}"

# copilot
alias cp5="COPILOT_MODEL=gpt-5 copilot --allow-all-tools"

# claude
alias tac="ta claude"
alias claude="/home/costrum/.claude/local/claude"
alias cld='claude --dangerously-skip-permissions'
alias cldo='cld --model opus'
alias clds='cld --model sonnet'
alias cldp='cld --mcp-config /home/costrum/.claude/.mcp.playwright.json'
alias cldma='cld --mcp-config /home/costrum/.claude/.mcp.json'

