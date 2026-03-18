{
  description = "My declarative nix-profile metapackage";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
    let
      system = "aarch64-darwin"; # Change to "aarch64-darwin" for Apple Silicon
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.${system}.default = pkgs.buildEnv {
        name = "my-packages";
        paths = with pkgs; [
          git
          zsh
          antidote
          stow
          fzf
          gnupg
          sops
          tree
          ripgrep
          fd
          tmux
          neovim
          python3
          uv
          ffmpeg
          bat
          delta
          yazi
          direnv
          nix-direnv

          # The core Rust toolchain
          rustc
          cargo

          # Optional but recommended tools
          clippy
          rustfmt
          bacon

          # LSPs, linters, debuggers
          typescript-language-server
          deno
          nodejs
          vscode-js-debug
          marksman
          lua-language-server
          rust-analyzer
          vscode-extensions.vadimcn.vscode-lldb.adapter
          prettierd
          biome

          # Database CLIs
          postgresql
          mariadb
          sqlite
        ];
      };
    };
}
