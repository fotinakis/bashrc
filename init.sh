# Single entry point for this shell config.
# Add `source ~/src/bashrc/init.sh` to your ~/.bashrc or ~/.zshrc.
# Dispatches to init.zsh or init.bash based on the running shell.

if [ -n "$ZSH_VERSION" ]; then
  _INIT_DIR="${${(%):-%x}:A:h}"
  source "$_INIT_DIR/init.zsh"
  unset _INIT_DIR
elif [ -n "$BASH_VERSION" ]; then
  _INIT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  source "$_INIT_DIR/init.bash"
  unset _INIT_DIR
else
  echo "bashrc: unsupported shell, expected bash or zsh" >&2
fi
