{ pkgs, inputs, lib, config, system, ... }: {
  
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  options = {
    plasma.enable = lib.mkEnableOption "Enable Plasma Configuration";
  };

  config = lib.mkIf config.plasma.enable {
  
    home.packages = with pkgs; [ 
      catppuccin-cursors.mochaBlue
      inputs.kwin-effects-forceblur.packages.${system}.default
    ];

    services = {
      kdeconnect = {
        enable = true;
        package = pkgs.kdePackages.kdeconnect-kde;
        indicator = true;
      };
    };

    programs.plasma = let 
      wallpaper = ../wallpapers/japanese_houses.jpg;
    in {
      enable = true;

      kscreenlocker.appearance = { inherit wallpaper; };
      workspace = {
        inherit wallpaper;
        iconTheme = "breeze-dark";
        splashScreen.theme = "a2n.kuro";
        cursor = {
          theme = "catppuccin-mocha-blue-cursors";
          size = 18;
        };
      };


      kwin = {
        effects = {
          blur.enable = false;
          shakeCursor.enable = false;
          wobblyWindows.enable = true;
          translucency.enable = true;
          slideBack.enable = true;

          windowOpenClose.animation = "scale";

        };

        virtualDesktops = {
          number = 9;
          rows = 3;
        };
      };


      fonts = let 
        monoFamily = "FiraCode Nerd Font";
        generalFamily = "Inter Nerd Font";
        normalSize = 10;
        smallSize = 8;
      in {
        fixedWidth = {
          family = monoFamily;
          pointSize = normalSize;
        };
        general = {
          family = generalFamily;
          pointSize = normalSize;
        };
        small = {
          family = generalFamily;
          pointSize = smallSize;
        };
        menu = {
          family = generalFamily;
          pointSize = normalSize;
        };
        toolbar = {
          family = generalFamily;
          pointSize = normalSize;
        };
        windowTitle = {
          family = generalFamily;
          pointSize = normalSize;
        };
      };

    };
  };

}
