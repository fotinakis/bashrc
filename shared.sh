# Portable config shared by both the bash and zsh entry points.
# Sourced by init.bash and init.zsh, which each set $BASHRC_DIR first.
# Keep everything in here POSIX / dual-shell compatible.

# Local, unversioned init.
if [ -f "$BASHRC_DIR/init-local.sh" ]
then
  source "$BASHRC_DIR/init-local.sh"
fi

# Aliases.
alias ..="cd .."
alias cd..="cd .."
alias sr="screen -r"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias gr="egrep -r"
alias brc="vim ~/src/bashrc/shared.sh"
alias brcl="vim ~/src/bashrc/init-local.sh"
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

# Go path.
export GOPATH=$HOME/src/go/
export PATH=$PATH:$GOPATH/bin

# Setup ssh-agent.
if [[ $OSTYPE == 'linux-gnu' ]]; then
  # Ensure the .ssh directory exists and has correct permissions
  mkdir -p ~/.ssh
  chmod 700 ~/.ssh

  # Start agent only if it's not running OR if the config file is missing
  if ! pgrep -x ssh-agent > /dev/null || [ ! -f ~/.ssh/agent_config.sh ]; then
    ssh-agent -s > ~/.ssh/agent_config.sh 2>&1
  fi

  # Only evaluate if the file exists and is not empty
  if [ -s ~/.ssh/agent_config.sh ]; then
    eval "$(cat ~/.ssh/agent_config.sh)"
  fi
fi

# Merge shared Claude Code settings into ~/.claude/settings.json (run `claude-sync` to force).
claude-sync() {
  command -v python3 > /dev/null 2>&1 || return 0
  python3 -I "$BASHRC_DIR/claude-settings-sync.py" && touch ~/.claude/.base-settings-stamp
}
if [ "$BASHRC_DIR/claude-base-settings.json" -nt ~/.claude/.base-settings-stamp ]; then
  claude-sync
fi
