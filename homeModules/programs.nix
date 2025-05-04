{ upkgs, ... }: {

  programs = {
    cava.enable = true; 
    yazi.enable = true;
    bat.enable = true;
    lsd.enable = true;

    zellij = {
      enable = true;
      package = upkgs.zellij;
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
        format = "$all";
        character = {
          success_symbol = "[❯](bold green)";
          error_symbol = "[❯](bold red)";
        };
      };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    foot = {
      enable = true;
      server.enable = true;
      settings = {
        main = {
          pad = "5x5";
        };
      };
    };

    alacritty = {
      enable = true;
      settings = {
        window = {
          padding = { x = 10; };
        };
      };
    };


    btop = {
      enable = true;
      settings = {
        theme_background = false;
      };
    };

    ghostty = {
      enable = true;
      enableZshIntegration = true;
    };
  };


}
