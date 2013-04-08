#!/bin/bash

# tmux
echo "\n### Creating symlinks for tmux..."
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf && echo "Created for .tmux.conf"

# vim
echo "\n### Creating symlinks for vim..."
ln -sf $(pwd)/.vimrc ~/.vimrc && echo "Created for .vimrc"
ln -sf $(pwd)/.vim ~/.vim && echo "Created for .vim/"