#!/usr/bin/env bash

ln -sf `pwd`/.gitconfig ~/.gitconfig
ln -snfv `pwd`/git/* ~/.config/git
ln -sf `pwd`/.zshrc ~/.zshrc
# ln -snfv `pwd`/fish/* ~/.config/fish
# ln -snfv `pwd`/atom/* ~/.atom
