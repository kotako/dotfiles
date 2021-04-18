#!/usr/bin/env bash

IGNORE_PATTERN="^\.(gitignore)"

echo "Create dotfile link..."
for dotfile in .??*
do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
done
ln -snfv `pwd`/git/* ~/.config/git
echo "Done"
