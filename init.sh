#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/crazy_prompt.sh

# Local, unversioned init.
if [ -f $DIR/init-local.sh ]
then
  source $DIR/init-local.sh
fi

# Aliases.
alias ..="cd .."
alias cd..="cd .."
alias sr="screen -r"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias gr="egrep -r"
alias brc="vim ~/src/bashrc/init.sh"
# Git.
# Requires hub to be installed: https://github.com/github/hub
# gem install hub; hub hub standalone > /usr/local/bin/hub; chmod +x /usr/local/bin/hub; gem uninstall hub;
alias git='hub'
alias gca="git commit -a"
alias gb="git branch"
alias gd="git diff"
alias gch="git checkout"
# Common repos.
alias s="cd ~/src"
alias sb="cd ~/src/bashrc"

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because other bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

