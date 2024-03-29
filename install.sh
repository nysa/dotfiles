#!/bin/bash

cd "$( dirname "$0" )"

echo "Symlinking dotfiles..."
for f in bin/* git/* tmux/* vim/* ripgrep/* ruby/*; do
  filepath=( ${f//\// } )
  filename=${filepath[$((${#filepath[@]} - 1))]}
  src="$(pwd)/$f"
  target="$HOME/.$filename"

  if [ -h "$target" ]; then
    unlink $target
  fi

  ln -vsf $src $target
done
echo "Dotfiles symlinked!"

echo "Installing submodules..."
git submodule update --init
echo "Submodules installed!"

echo "Installing Vundle bundles..."
vim +PluginInstall +qall
echo "Vundle bundles installed!"
