# --- 1. Load Antidote (The Plugin Manager) ---
# Nix installs antidote to your profile path. On macOS (aarch64-darwin):
source $(nix-build --no-out-link '<nixpkgs>' -A antidote)/share/antidote/antidote.zsh 2>/dev/null || \
source /run/current-system/sw/share/antidote/antidote.zsh 2>/dev/null || \
source $(brew --prefix)/share/antidote/antidote.zsh 2>/dev/null

# Initialize plugins from a simple text file
# Create this file: ~/.zsh_plugins.txt
antidote load ~/.config/zsh/plugins.txt

# Source every .sh file in your config directory
for file in "$HOME/.config/zsh/"*.sh; do
  source "$file"
done


# case insensitive tab completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit
