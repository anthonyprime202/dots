{ lib, config, ... }: {
  options = {
    zsh.enable = lib.mkEnableOption "Enable ZSH config";
  };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      dotDir = ".config/zsh";
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history = {
        ignoreDups = true;
        expireDuplicatesFirst = true;
      };

      initExtraFirst = ''
        ${builtins.readFile ./init.zsh}
      '';

    };
  };

}

