#!/bin/bash

# tmux
echo "# Creating symlinks for tmux..."
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf && echo "[x] .tmux.conf"

# vim
echo
echo "# Creating symlinks for vim..."
ln -sf $(pwd)/.vimrc ~/.vimrc && echo "[x] .vimrc"
# ln -sf $(pwd)/.vim ~/.vim && echo "Created for .vim/"

# vundle
echo
echo "### Is vundle installed?"
VUNDLE_DIR="~/.vim/bundle/vundle"
if [ -d "$VUNDLE_DIR" ]; then
  echo "$VUNDLE_DIR exist, skipping..."
else
  echo "$VUNDLE_DIR doesn't exist, downloading..."
  mkdir -p "$VUNDLE_DIR"
  git clone https://github.com/gmarik/vundle.git "$VUNDLE_DIR" && echo "[x] vundle"
fi
