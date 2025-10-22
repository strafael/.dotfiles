# --- Find files and open in $EDITOR ---
ff() {
  local preview='bat --style=numbers --color=always --line-range :200 {} 2>/dev/null || head -n 200 {}'
  local -a files
  mapfile -t files < <(fd --type f --hidden --follow --exclude .git \
    | fzf --height=40% --layout=reverse --border \
    --preview="$preview" --preview-window='right:60%:wrap' \
    -m --query="$*")
  ((${#files[@]})) || return
    "${EDITOR:-nvim}" -- "${files[@]}"
  }

# --- Find dir ---
fp() {
  if command -v eza >/dev/null 2>&1; then
    preview='eza -lah --tree --level=2 --color=always {}'
  elif command -v tree >/dev/null 2>&1; then
    preview='tree -aC -L 2 {}'
  else
    preview='ls -la --color=auto {}'
  fi

  sel="$(fd --type d --hidden --follow --exclude .git . "$PWD" \
    | fzf --height=40% --layout=reverse --border \
    --preview="$preview" --preview-window='right:60%:wrap')" || return
  [ -n "$sel" ] && cd -- "$sel"
}

# --- Search content in path with ripgrep + fzf; open $EDITOR at line ---
sp() {
  local query="$*"
  local preview sel file line

  # Preview with bat
  if command -v bat >/dev/null 2>&1; then
    preview='bat --style=numbers --color=always --highlight-line {2} {1} 2>/dev/null || sed -n "1,200p" {1}'
  else
    preview='sed -n "1,200p" {1}'
  fi

  sel="$(
    rg --line-number --no-heading --color=always -S \
      --hidden --follow --glob '!.git/*' -- "$query" \
      | fzf --ansi --delimiter=: --nth=3.. \
      --preview="$preview" --preview-window='right:60%:wrap' \
      --layout=reverse --height=40% --border
    )" || return

    # Safe parser to support names with space
    IFS=: read -r file line _ <<<"$sel"
    [ -n "$file" ] || return
    "${EDITOR:-nvim}" +"${line:-1}" -- "$file"
}
