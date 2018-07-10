#!/bin/bash

echo "Starting vim dotfile install..."
date

# make necessary directories
mkdir -p $HOME/.vim/tmp
cd $HOME/.vim/tmp
mkdir backup swap undo

# set up Vundle
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/vundle.vim
vim +PluginInstall +qall

echo "Completed vim dotfile install."
date
