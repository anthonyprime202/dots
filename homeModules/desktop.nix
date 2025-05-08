{ pkgs, lib, config, ... }: let
  

  minecraft = pkgs.fetchurl {
    url = "https://dl.llaun.ch/legacy/bootstrap";
    sha256 = "0ph73ghxjdy1s1ffmli4s5y4fd30zwmd7hkf3f7rj207lvi94xfr";
  };

  minecraftIcon = pkgs.fetchurl {
    url = "https://gyazo.com/a4abc5fdb965d1b97db38453012efc73/thumb/1000";
    sha256 = "13ssg7l16zbjv8810rgw47f1bxcicnxg4mp0aa3dicci4az1rlhm";
  };

  in {
  options = {
    minecraft.enable = lib.mkEnableOption "Enable Minecraft Launcher";
  };


  config = lib.mkIf config.minecraft.enable {
    xdg.desktopEntries =  {
      minecraft = {
        name = "Minecraft";
        comment = "Launcher to run Minecraft";
        exec = "distrobox enter fedora -- java -jar \"${minecraft}\"";
        icon = "${minecraftIcon}";
        type = "Application";
        categories = [ "Game" ];
      };
    };
  };
}
