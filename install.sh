#!/bin/bash

# Clone submodules
git submodule update --init --recursive

# Link config files
ln zsh/.zshrc ~/.zshrc
ln .vimrc ~/.vimrc
ln .tmux.conf ~/.tmux.conf
ln .amethyst ~/.amethyst

# Install vim-plug
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim \
    https://raw.github.com/junegunn/vim-plug/master/plug.vim
