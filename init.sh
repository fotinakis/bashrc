#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/crazy-prompt.sh
source $DIR/git-autocomplete.sh

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
alias n="npm run start"
alias nt="npm test"
alias beg="bundle exec guard"
# Git.
alias gca="git commit -a"
alias gb="git branch"
alias gd="git diff"
alias gdc="git diff --cached"
alias gch="git checkout"
alias gpom="git pull origin main"
alias gp="git pull"
alias gs="git status"
alias gbddd="git branch --merged | grep -v '\*' | grep -v '^  main$' | xargs -n 1 git branch -d"
# Common repos.
alias s="cd ~/src"
alias sgo="cd ~/src/go/src"
alias sb="cd ~/src/bashrc"
# Misc.
alias dc="docker-compose"
alias ember="./node_modules/ember-cli/bin/ember"

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
  echo 'History recording stopped. Make sure to `kill -9 $$` at the end of the session.'
}

# Go path.
export GOPATH=$HOME/src/go/
export PATH=$PATH:$GOPATH/bin

# Setup ssh-agent.
if [[ $OSTYPE == 'linux-gnu' ]]; then
  pgrep -f ssh-agent > /dev/null || ssh-agent > ~/.ssh/agent_config.sh
  eval `cat ~/.ssh/agent_config.sh`
fi

# Enable tab completion for aliases. Must come after everything else.
source $DIR/alias-tab-completion.sh

# Turn off annoying mac message.
export BASH_SILENCE_DEPRECATION_WARNING=1
