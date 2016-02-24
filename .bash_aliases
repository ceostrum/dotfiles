# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Listing
alias ls='ls -F --color --group-directories-first'
alias ll='ls -lF --color --group-directories-first'
alias l='ll | less'
alias la='ls -laF --color --group-directories-first'
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
alias gp='git pull'
alias gd='git difftool -w'
alias gl='git log --pretty=oneline'
alias gg='git log --graph --oneline --decorate --all'

# rubocop
alias rc='rubocop'
