# zsh entry point for this shell config.
# Normally reached via init.sh, but can be sourced directly from ~/.zshrc.

BASHRC_DIR="${${(%):-%x}:A:h}"
export BASHRC_DIR

# Shared, portable config (local hook, aliases, env, ssh-agent).
source "$BASHRC_DIR/shared.sh"

# zsh-native prompt, history, options and completion.
source "$BASHRC_DIR/prompt.zsh"
source "$BASHRC_DIR/history.zsh"
source "$BASHRC_DIR/options.zsh"
source "$BASHRC_DIR/completion.zsh"

# zsh-specific reload alias.
alias src="source ~/.zshrc"
