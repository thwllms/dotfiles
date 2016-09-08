shopt -s expand_aliases

# ls colors
alias ls='ls -G'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# Git
alias gg='git --no-pager grep -In'
alias ggl='git grep -Il'
ggr () {
    git grep -Il $1 | xargs sed -i '' -e "s/${1}/${2}/g" 
}
export -f ggr
alias gs='git status'
alias gd='git diff'
git_log_format="%C(cyan)%h%C(reset) - %C(dim cyan)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(yellow)%d%C(reset)"
alias ghist="git log --graph --abbrev-commit --decorate --format=format:'$git_log_format' --all"
alias gb='git branch'
alias gnpd='git --no-pager diff'
alias gdf='git diff --name-only'

# Vagrant
alias v='vagrant'
alias vs='vagrant status'
alias vssh='vagrant ssh'

alias untargz='tar xzvf'
alias targz='tar czvf'

alias weather='curl wttr.in'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias c='clear'

alias wget='wget -c'

# Get any local (non-synchronized) aliases
if [ -f ~/.bash_aliases.local ]; then
    source ~/.bash_aliases.local
fi
