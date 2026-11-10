Just my own shell config.

## Setup / upgrade

```bash
# 1. Clone or update the repo.
mkdir -p ~/src
[ -d ~/src/bashrc ] && git -C ~/src/bashrc pull || git clone https://github.com/fotinakis/bashrc.git ~/src/bashrc

# 2. Point the shell startup files at it, skipping any that already are.
LINE='source ~/src/bashrc/init.sh'
for f in ~/.bashrc ~/.zshrc; do
  touch "$f"
  grep -qxF "$LINE" "$f" || printf '\n%s\n' "$LINE" >> "$f"
done
```

Then `exec $SHELL` (or open a new terminal).

