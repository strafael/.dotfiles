set -o vi               # enable vi-like keybindings
shopt -s cdspell        # auto-correct minor typos in 'cd' targets (transposed/missing chars)
shopt -s cmdhist        # store multi-line commands as a single entry in history
shopt -s dotglob        # include dotfiles (.*) in pathname expansion (globs like *)
shopt -s histappend     # append to the history file rather than overwriting it
shopt -s expand_aliases # enable alias expansion in non-interactive shells too
shopt -s checkwinsize   # update LINES/COLUMNS after each command when the terminal size changes
