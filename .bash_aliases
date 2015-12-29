# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Listing
alias ls='ls -F --color'
alias ll='ls -lF --color'
alias l='ll | less'
alias la='ls -laF --color'
alias lsd="ls -lF --color | grep --color=never '^d'"

# tmux
alias tls='tmux ls'
alias ta='tmux a -t'

alias vi='vim'
alias h='history'
alias p='pwd'
alias r='fc -s'

alias proc='ps -l -u `whoami`'
alias prockill='pgrep -u `whoami` | xargs kill -9'
alias be='sudo su -'

# Git
alias gs='git status'
alias gd='git difftool -w'
alias gl='git log --pretty=oneline'
alias gg='git log --graph --oneline --decorate --all'
