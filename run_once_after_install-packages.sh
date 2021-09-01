#!/usr/bin/env bash

mkdir -p /home/wesley/.vim/bundle
# Vundle for vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

