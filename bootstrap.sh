#!/bin/bash

# 0. git
# 1. tmux
# 2. vim
# 3. zsh

unamestr=`uname`
if [ $1 == "system" ]; then
  echo "### Installing git, tmux, vim and zsh"
  if [[ "$unamestr" == 'Linux' ]]; then
    echo "You're running Ubuntu"
    sudo apt-get install -f git tmux vim zsh > /dev/null

  elif [[ "$unamestr" == 'FreeBSD' ]]; then
    echo "You're running OS X"
    echo "Installing homebrew first"

    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)" && echo "[x] homebrew"

    brew install git && echo "[x] git"
    brew install tmux && echo "[x] tmux"
    brew install macvim --override-system-vim && "[x] vim"
    brew install zsh && echo "[x] zsh"

  fi

  echo
  echo "### Setting zsh as default shell"
  sudo chsh -s $(which zsh) $(whoami)
  if [ $? -eq 0 ]; then
    echo "[x] zsh"
  else
    echo "[ ] zsh, something went wrong..."
  fi
fi



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
  echo "$VUNDLE_DIR exists, skipping..."
else
  echo "$VUNDLE_DIR doesn't exist, downloading..."
  mkdir -p "$VUNDLE_DIR"
  git clone https://github.com/gmarik/vundle.git "$VUNDLE_DIR" && echo "[x] vundle"
fi

# zsh
echo
echo "# Creating symlinks for zsh..."
ln -sf $(pwd)/.zshrc ~/.zshrc && echo "[x] .zshrc"

# oh-my-zsh
echo
echo "### Is oh-my-zsh installed?"
OH_MY_ZSH_DIR="~/.oh-my-zsh"
if [ -d "$OH_MY_ZSH_DIR" ]; then
  echo "$OH_MY_ZSH_DIR exists, skipping..."
else
  echo "$OH_MY_ZSH_DIR doesn't exist, downloading..."
  git clone git://github.com/robbyrussell/oh-my-zsh.git "$OH_MY_ZSH_DIR"

  if [ $? -eq 0]; then
    "[x] oh-my-zsh"
  else
    "[ ] oh-my-zsh, downloading failed..."
  fi

fi
