# Created by newuser for 5.7.1

# Plugins
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "agnoster/agnoster-zsh-theme", use:agnoster.zsh-theme, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Load all plugins
zplug load

# Auto complete
autoload -U compinit
compinit
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Save history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt share_history
setopt EXTENDED_HISTORY

# Move cursor with Vim keybind
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Show icon, title with Hyper
## Override auto-title when static titles are desired
title() {
    export TITLE_OVERRIDDEN=1
    echo -en "\e]0;$*\a"
}

## Turn off static titles ($ autotitle)
autotitle() { export TITLE_OVERRIDDEN=0 }
autotitle

## Condition checking if title is overridden
overridden() { [[ $TITLE_OVERRIDDEN == 1 ]]; }

## Echo asterisk if git state is dirty
gitDirty() { [[ $(git status 2> /dev/null | grep -o '\w\+' | tail -n1) != ("clean"|"") ]] && echo "*" }

## Show cwd when shell prompts for input
precmd() {
   if overridden; then return; fi
   cwd=${$(pwd)##*/}
   print -Pn "\e]0;$cwd$(gitDirty)\a"
}

## Prepend command (w/o arguments) to cwd while waiting for command to complete
preexec() {
   if overridden; then return; fi
   printf "\033]0;%s\a" "${1%% *} | $cwd$(gitDirty)"
}

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Alias
## General
alias e='exit'

alias ll='ls -lh'
alias la='ls -la'

alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'

## Git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gds='git diff --staged'
alias gc='git commit -m'
alias gp='git push'
alias gi='git switch'
