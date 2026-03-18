# C-x, C-e to edit command in editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

bindkey -v
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
