#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/crazy_prompt.sh

# Aliases.
alias ..="cd .."
alias cd..="cd .."
alias sr="screen -r"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
# Git.
alias gca="git commit -a"
alias gb="git branch"
alias gch="git checkout"
# Repos.
alias s="cd ~/src"

# Local aliases.
if [ -f $DIR/init-local.sh ]
then
  source $DIR/init-local.sh
fi

# Eternal bash history.
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="%F %T "

