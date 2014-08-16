#!/bin/bash

# Clone submodules
git submodule update --init --recursive

# Link config files
ln -s `pwd`/zsh/.zshrc ~/.zshrc
ln -s `pwd`/.vimrc ~/.vimrc
ln -s `pwd`/.tmux.conf ~/.tmux.conf
ln -s `pwd`/.tmux-osx.conf ~/.tmux-osx.conf
ln -s `pwd`/.amethyst ~/.amethyst

# Install vim-plug
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim \
    https://raw.github.com/junegunn/vim-plug/master/plug.vim
