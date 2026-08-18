# zsh prompt: replicate the bash prompt's rendered output.
autoload -U colors && colors
PROMPT='%F{green}%m%f:%F{cyan}%40<..<%~%<<%f$ '
