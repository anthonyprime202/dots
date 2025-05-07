{ lib, username, terminal, wm, ... }: {

  imports = [
    ./zsh
    ./nvim
    ./git.nix
    ./gnome.nix
    ./plasma.nix
    ./vscode.nix
    ./programs.nix
    ./spicetify.nix
    ./stylix.nix
    ./desktop.nix
  ];

  git.enable = lib.mkDefault true;
  spicetify.enable = lib.mkDefault true;
  nvim.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
  tlauncher.enable = lib.mkDefault true;

  plasma.enable = (wm == "plasma");
  gnome.enable = (wm == "gnome");
  styles.enable  = (wm != "plasma");

  

  dconf.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    desktop = "desk";
    documents = "docx";
    download = "dl";
    music = "music";
    pictures = "pics";
    publicShare = "pub";
    videos = "videos";
    templates = "temp";
  };
  
  home.shellAliases = {
    ls = "lsd";
    lsa = "lsd -A";
    lst = "lsd --tree";
    lsat = "lsd -A --tree";
    lsta = "lsd -A --tree";

    dev = "nix develop --command zsh";

    ".." = "cd ..";
    "$" = "";
  };

  home.sessionVariables = {
    TERMINAL = terminal;
  };

  home = { inherit username; };
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
