{ pkgs, upkgs, ... }: {

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
    package = upkgs.vscodium;

    userSettings = {
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.startupEditor" = "none";
      "svelte.enable-ts-plugin" = true;
    };

    extensions = with upkgs.vscode-extensions; [
      ms-vscode.cpptools-extension-pack
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      ms-vsliveshare.vsliveshare
      # rust-lang.rust-analyzer
      tauri-apps.tauri-vscode
      vscodevim.vim
      svelte.svelte-vscode
      tamasfe.even-better-toml

      esbenp.prettier-vscode
      editorconfig.editorconfig

      ms-python.python
      ms-toolsai.jupyter
      ms-toolsai.vscode-jupyter-cell-tags
      ms-toolsai.vscode-jupyter-slideshow
      ms-toolsai.jupyter-renderers
      ms-toolsai.jupyter-keymap

      jnoortheen.nix-ide
    ];
  };
  home.packages = with pkgs; [
    python312Packages.ipykernel
  ];
}
