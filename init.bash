#!/bin/bash
# Bash entry point for this shell config.
# Normally reached via init.sh, but can be sourced directly from ~/.bashrc.

BASHRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export BASHRC_DIR

# Prompt (sets PROMPT_COMMAND=bash_prompt_command).
source "$BASHRC_DIR/prompt.bash"

# Shared, portable config (local hook, aliases, env, ssh-agent).
source "$BASHRC_DIR/shared.sh"

# Bash-specific reload alias.
alias src="source ~/.bashrc"

# Eternal history (prepends to the PROMPT_COMMAND set by prompt.bash).
source "$BASHRC_DIR/history.bash"

# Completion (must come after aliases are defined in shared.sh).
source "$BASHRC_DIR/completion.bash"

# Turn off annoying mac message.
export BASH_SILENCE_DEPRECATION_WARNING=1
