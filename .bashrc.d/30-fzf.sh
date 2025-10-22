# fzf defaults using fd (files, hidden; ignore .git)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# visual options
export FZF_DEFAULT_OPTS='--height=40% --layout=reverse --border'
export FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always --line-range :200 {} 2>/dev/null || head -n 200 {}" --preview-window=right:60%:wrap'
export FZF_ALT_C_OPTS='--preview "ls -la --color=auto {}" --preview-window=right:60%:wrap'

# key-bindings (Ctrl-T, Ctrl-R, Alt-C) and completion
[ -f /usr/share/fzf/shell/key-bindings.bash ] && . /usr/share/fzf/shell/key-bindings.bash
[ -f /usr/share/fzf/shell/completion.bash   ] && . /usr/share/fzf/shell/completion.bash
