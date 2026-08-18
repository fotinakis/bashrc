# zsh eternal history.
# Own history file (kept separate from bash's ~/.bash_eternal_history since the
# on-disk formats differ), effectively unlimited, timestamped, and live-shared
# across concurrent sessions.
HISTFILE=~/.zsh_eternal_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt EXTENDED_HISTORY       # record a timestamp for each command
setopt INC_APPEND_HISTORY     # write commands as they are entered, not on exit
setopt SHARE_HISTORY          # interleave history live across running sessions
setopt HIST_IGNORE_ALL_DUPS   # drop older duplicates of a repeated command

# Pause history recording for the current session.
stophistory() {
  unset HISTFILE
  echo 'History recording stopped for this session.'
}
