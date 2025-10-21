# Toolbox binaries
alias eza='podman exec -it --workdir "$(pwd)" arch-utils eza'
alias nvim='podman exec -it --workdir "$(pwd)" arch-nvim nvim'

alias vim='nvim'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias l="eza --icons=always"
alias ls="eza --icons=always"
alias ll="eza -lg --icons=always"
alias la="eza -lag --icons=always"
alias lt="eza -lTg --icons=always"
alias lt2="eza -lTg --level=2 --icons=always"
alias lt3="eza -lTg --level=3 --icons=always"
alias lt4="eza -lTg --level=4 --icons=always"
alias lta="eza -lTag --icons=always"
alias lta2="eza -lTag --level=2 --icons=always"
alias lta3="eza -lTag --level=3 --icons=always"
alias lta4="eza -lTag --level=4 --icons=always"

alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

