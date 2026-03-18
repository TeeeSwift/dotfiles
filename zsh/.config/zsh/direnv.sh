# 1. Hook direnv
eval "$(direnv hook zsh)"

# 2. Source nix-direnv (This is the magic link)
if [ -f "$HOME/.nix-profile/share/nix-direnv/direnvrc" ]; then
    source "$HOME/.nix-profile/share/nix-direnv/direnvrc"
fi

