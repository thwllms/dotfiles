#! /bin/bash

DOTFILES=(
".bash_profile"
".bash_aliases"
".vimrc"
"git-prompt.sh"
)

CWD=$(pwd)

echo "Creating symbolic links to dotfiles in $HOME"
for dotfile in "${DOTFILES[@]}"
do
  echo $dotfile
  ln -si "$CWD/$dotfile" ~
done
echo "Done."

echo "Installing molokai colorscheme for Vim."
mkdir -p ~/.vim/colors
curl https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim \
  > ~/.vim/colors/molokai.vim

echo "Run 'source ~/.bash_profile' to update."
