# Bash tab-completion.
# git completion first, then alias-aware completion (which wraps the
# completions defined above, so it must come after them).
source "$BASHRC_DIR/git-autocomplete.sh"
source "$BASHRC_DIR/alias-tab-completion.sh"
