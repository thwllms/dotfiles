if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Prompt
function EXT_COLOR () { echo -ne "\[\033[38;5;$1m\]"; }
source ~/git-prompt.sh
export VIRTUAL_ENV_DISABLE_PROMPT=1
function get_venv_prompt () {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV="(${VIRTUAL_ENV##*/}) "
  fi
  echo "$PYTHON_VIRTUALENV"
}
VENV_PROMPT="\$(get_venv_prompt)"
PS1="\n${VENV_PROMPT}`EXT_COLOR 242`\$(date \"+%a %d %b %H:%M\") • \u@\h:\w\$(__git_ps1)\n`EXT_COLOR 202`▸\[\033[0m\] "

if ! type "nvim" &> /dev/null; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

# virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=$HOME/.virtualenvs
  source /usr/local/bin/virtualenvwrapper.sh
fi

# pyenv
if type "pyenv" &> /dev/null; then
  eval "$(pyenv init -)"
fi

# Add Geogig to PATH
if [ -d /usr/local/bin/geogig/bin ]; then
  export PATH="$PATH:/usr/local/bin/geogig/bin"
fi

# Add /usr/local/sbin to PATH
if [ -d /usr/local/sbin ]; then
  export PATH="$PATH:/usr/local/sbin"
fi

# Add ~/bin to PATH
if [ -d ~/bin ]; then
  export PATH="$PATH:~/bin"
fi

# JBOSS
export JBOSS_HOME=/usr/local/opt/jboss-as/libexec
export PATH=${PATH}:${JBOSS_HOME}/bin

# Get any local (non-synchronized) profile settings
if [ -f ~/.bash_profile.local ]; then
    source ~/.bash_profile.local
fi

# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
