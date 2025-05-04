{ pkgs, lib, config, inputs, ... }: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  options = {
    styles.enable = lib.mkEnableOption "Enable Stylix for Theming";
  };

  config = lib.mkIf config.styles.enable {
    stylix = {
      enable = true;
      image = ../wallpapers/forest_dark_winter.jpg;
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

      opacity.terminal = 1.0;

      targets = {
        rofi.enable = false;
        neovim.enable = false;
        vscode.enable = false;
        hyprlock.enable = false;
      };


      iconTheme = {
        enable = true;
        package = pkgs.papirus-icon-theme;
        light = "Papirus-Light";
        dark = "Papirus-Dark";
      };

      cursor = {
        package = pkgs.catppuccin-cursors.mochaBlue;
        name = "catppuccin-mocha-blue-cursors";
        size = 18;
      };

      fonts = {
        serif = {
          name = "Inter Nerd Font";
          package = pkgs.inter-nerdfont;
        };
        sansSerif = {
          name = "Inter Nerd Font";
          package = pkgs.inter-nerdfont;
        };
        monospace = {
          name = "FiraCode Nerd Font";
          package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
        };
        emoji = {
          name = "JoyPixels";
          package = pkgs.joypixels;
        };
        sizes = {
          terminal = 11;
          applications = 10;
        };
      };
    };
  };
}
