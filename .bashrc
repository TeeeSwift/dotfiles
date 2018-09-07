## Initiate Tmux
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

## Source fzf (fuzzy finder)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

## Powerline
export PATH=$PATH:$HOME/Library/Python/2.7/bin
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /Users/taylor/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh
powerline-config tmux setup

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

## Aliases
alias c='clear'
alias ..='cd ..'
alias ~='cd ~'
alias ls='ls -G'
alias ctags="`brew --prefix`/bin/ctags"
alias config='/usr/bin/git --git-dir=/Users/taylor/.cfg/ --work-tree=/Users/taylor'


## QOL
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on" 
