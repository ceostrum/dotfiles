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

# tmux
alias tls='tmux ls'
alias ta='tmux a -t'

# alias vim='nvim'
alias em='emacs'
alias h='history'
alias p='pwd'
alias r='fc -s'

alias proc='ps -l -u `whoami`'
alias prockill='pgrep -u `whoami` | xargs kill -9'
alias be='sudo su -'

# Git
alias gs='git status'
alias gp='git pull'
alias gpu='git push'
alias gb='git branch'
alias gd='git difftool -w'
alias gl='git log --pretty=oneline'
alias gg='git log --graph --oneline --decorate --all'
alias gco='git checkout'
alias gcod='git checkout develop'
alias gcom='git checkout master'
alias gca='git commit -am'
alias gprunelocal='git branch --merged master | grep -v 'master$' | xargs git branch -d 2>/dev/null'
alias gpruneremote='git remote prune origin'

# vscode
alias vscodeupdate='sudo yum install code -y'

# rubocop
alias rc='rubocop'

# redis
alias redis-flushall="redis-cli flushall"

# tags
alias tagc='rm GPATH 2>/dev/null; rm GRTAGS 2>/dev/null; rm GTAGS 2>/dev/null; rm tags 2>/dev/null'
