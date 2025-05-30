{ pkgs, lib, config, ... }: {
  options = {
    nvim.enable = lib.mkEnableOption "Enable Neovim";
  };

  config = lib.mkIf config.nvim.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraLuaConfig = '' 
        ${ builtins.readFile ./init.lua }
      '';

      extraPackages = with pkgs; [
        # Lua
        lua-language-server
        stylua

        # Rust
        rust-analyzer
        rustfmt

        # Python
        python312Packages.python-lsp-server
        python312Packages.black
        python312Packages.pylsp-mypy

        # Typescript / Javascript
        typescript
        typescript-language-server
        nodePackages.prettier

        # Tailwind
        tailwindcss-language-server

        # HTML / CSS
        emmet-language-server
        vscode-langservers-extracted

        # Svelte
        svelte-language-server

        # C / CPP
        clang-tools

        # Nix
        nil

        # Hyprlang
        hyprlang
      ];
    };

    xdg.configFile."nvim/lua".source = ./lua;
  };
}
