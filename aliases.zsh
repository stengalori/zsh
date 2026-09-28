# APPS & FILES ALIASES
alias vimrc='$EDITOR $HOME/.config/nvim'
alias vim='nvim'
alias zshrc='$EDITOR $HOME/.config/zsh'
alias zshsrc='source $HOME/.config/zsh/.zshrc'
alias hosts='$EDITOR $HOME/.ssh/known_hosts'
alias smoca='cd $HOME/smoca'
alias me='cd $HOME/me'

# GIT ALIASES
alias branch='git branch'
alias clone='git clone'
alias glog='git log --graph --abbrev-commit --decorate --all --oneline'
alias main='git switch main'
alias pull='git pull origin'
alias push='git push'
alias suba='git submodule add'
alias subi='git submodule init'
alias subu='git submodule update'
alias swi='git fetch; git switch'
alias swic='git switch -c'
alias gui='gitui'

# RAILS ALIASES
alias rg='rails generate'
alias rg:mo='rg model'
alias rg:mi='rg migration'
alias rg:v='rg view'
alias rg:c='rg controller'
alias rdb:c='rails db:create'
alias rdb:d='rails db:drop'
alias rdb:s='rails db:seed'
alias rdb:m='rails db:migrate'
alias rdb:cms='rails db:create db:migrate db:seed'

# SHELL ALIASES
alias l='ls -lah'
alias la='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

# VERSION MANAGEMENT ALIASES
alias nvm="_nvm"
alias jvm="_jvm"

