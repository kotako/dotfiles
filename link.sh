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

echo "Install Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Update Homebrew..."
brew update && brew upgrade && brew cask upgrade
echo "Install formulaes, casks..."
brew bundle --global
echo "Done"

echo "Change shell to zsh"
if [ ${SHELL} != "/usr/local/bin/zsh"  ]; then
    if [ -z `grep "/usr/local/bin/zsh" /etc/shells` ]; then
        echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
    fi
    chsh -s /usr/local/bin/zsh
fi
echo "Done"
