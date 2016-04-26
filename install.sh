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
