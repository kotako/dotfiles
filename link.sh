#!/usr/bin/env bash

echo "create symlinks"

ln -sf `pwd`/.gitconfig ~/.gitconfig
ln -sf `pwd`/.gitignore_global ~/.gitignore_global
ln -sf `pwd`/.zshrc ~/.zshrc
# ln -snfv `pwd`/fish/* ~/.config/fish
# ln -snfv `pwd`/atom/* ~/.atom
