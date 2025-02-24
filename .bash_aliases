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
alias tls='tmux ls'
alias ta='tmux a -t'

alias h='history'
alias p='pwd'

alias proc='ps -l -u `whoami`'
alias prockill='pgrep -u `whoami` | xargs kill -9'
alias be='sudo su -'

# Git
alias gs='git status'
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

# testing
alias R='cd "$(git rev-parse --show-toplevel)"'
alias ga="git status --porcelain -u | fzf -m --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all | awk '{\$1=\"\"; print \$0}' | xargs -I {} git add {}"
alias gb="git branch | fzf | awk '{print $1}' | xargs git checkout"
alias gbd="git branch | fzf -m | awk '{print $1}' | xargs -I {} git branch -D {}"
alias gr="git status --porcelain | grep -v '^??' | grep -v '^ ' | fzf -m --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all | awk '{\$1=\"\"; print \$0}' | xargs -I {} git restore --staged {}"

