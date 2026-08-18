# zsh quality-of-life options.
setopt AUTO_CD            # type a directory name with no `cd` to enter it
setopt AUTO_PUSHD         # every cd pushes onto a stack; `cd -2` jumps back two
setopt PUSHD_IGNORE_DUPS  # keep the directory stack free of duplicates
setopt EXTENDED_GLOB      # recursive **/, ^negation, and glob qualifiers
setopt CORRECT            # offer "did you mean ..." on a mistyped command
