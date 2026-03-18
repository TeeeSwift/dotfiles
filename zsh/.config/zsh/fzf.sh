# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -n "$commands[fzf]" ]; then
  source <(fzf --zsh)
fi

export FZF_DEFAULT_OPTS="--height 40% --border"
export FZF_ALT_C_COMMAND="fd --type d"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# 1. Define the function
fzf-back() {
  # Get the stack, skip the first line (current dir), fuzzy find, and grab the path
  local target=$(dirs -p -v | tail -n +2 | fzf --height 20% --reverse --header="Jump Back" | awk '{print $2}')
  
  # If we picked something, cd into it
  if [ -n "$target" ]; then
    cd "${target/#\~/$HOME}"
  fi
}

# 2. Create the alias
alias -- -='fzf-back'
