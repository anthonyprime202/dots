{ upkgs, lib, config, ... }: {
  options = {
    zellij.enable = lib.mkEnableOption "Enable Zellij Multiplexer";
  };
  
  config = lib.mkIf config.zellij.enable {
    xdg.configFile."zellij/config.kdl".source = ./config.kdl;
    programs. zellij = {
      enable = true;
      package = upkgs.zellij;
    };
  };
}
