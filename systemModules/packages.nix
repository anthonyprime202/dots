{ pkgs, inputs, system, ... }: let 
  zen = inputs.zen-browser.packages.${system}.default;
in {
  environment.systemPackages = with pkgs; [
    home-manager

    wget git unzip
    appimage-run

    android-tools
    arduino-ide

    # Browsers
    firefox
    brave
    zen

    python313

    # Graphical stuff
    libreoffice
    zapzap
    telegram-desktop
    spotify
    vesktop
    figma-linux
    obsidian
    qbittorrent
    vlc
    postman

    # Terminal stuff
    lazygit
    imagemagick
    fzf
    wev
    fastfetch
    tldr
    cowsay
    ripgrep
    smassh
    nh
    scrcpy
    libnotify
    wl-clipboard
  ];
}
