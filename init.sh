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
alias brcl="vim ~/src/bashrc/init-local.sh"
alias src="source ~/.bashrc"
alias k="kill %%"
alias r="bundle exec rspec"
alias beg="bundle exec guard"
# Git.
alias gca="git commit -a"
alias gb="git branch"
alias gd="git diff"
alias gch="git checkout"
alias gpom="git pull origin master"
alias gs="git status"
alias gbddd="git branch --merged | grep -v '\*' | grep -v '^  master$' | xargs -n 1 git branch -d"
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
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history

# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
shopt -s histappend
stophistory () {
  PROMPT_COMMAND="bash_prompt_command"
  echo 'History recording stopped.'
}

# Go path.
export GOPATH=$HOME/go/
export PATH=$PATH:$GOPATH/bin

# Setup ssh-agent.
if [[ $OSTYPE == 'linux-gnu' ]]; then
  pgrep -f ssh-agent > /dev/null || ssh-agent > ~/.ssh/agent_config.sh
  eval `cat ~/.ssh/agent_config.sh`
fi

