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
PS1="\n${VENV_PROMPT}`EXT_COLOR 242`\d \@ ⎮ \u ⎮ \w\$(__git_ps1)\n`EXT_COLOR 202`▸\[\033[0m\] "

export EDITOR=nvim

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# pyenv
export PATH="~/.pyenv/shims:$PATH"
if [ -f ~/.pyenv/completions/pyenv.bash ]; then
  source ~/.pyenv/completions/pyenv.bash
fi

# Add Geogig to PATH
export PATH="$PATH:/usr/local/bin/geogig/bin"

# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
