shopt -s expand_aliases

# Homebrew-installed Vim
alias vim='/usr/local/Cellar/vim/7.4.903/bin/vim'

# ls colors
alias ls='ls -G'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# Git
alias gg='git grep -In'
alias ggl='git grep -Il'
ggr () {
    git grep -Il $1 | xargs sed -i '' -e "s/${1}/${2}/g" 
}
export -f ggr
alias gs='git status'
alias gd='git diff'

# Vagrant
alias v='vagrant'
alias vs='vagrant ssh'

alias untargz='tar xzvf'
alias targz='tar czvf'

alias weather='curl wttr.in'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias c='clear'

alias wget='wget -c'
