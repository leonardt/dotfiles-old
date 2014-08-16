#!/bin/bash

# Clone submodules
git submodule update --init --recursive

# Link config files
ln -s zsh/.zshrc ~/.zshrc
ln -s .vimrc ~/.vimrc
ln -s .tmux.conf ~/.tmux.conf
ln -s .tmux-osx.conf ~/.tmux-osx.conf
ln -s .amethyst ~/.amethyst

# Install vim-plug
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim \
    https://raw.github.com/junegunn/vim-plug/master/plug.vim
