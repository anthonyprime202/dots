{ pkgs, lib, config }: let
  tlauncher = ../extras/TLauncher.jar;

  tLauncherIcon = pkgs.fetchurl {
    url = "https://gyazo.com/a4abc5fdb965d1b97db38453012efc73/thumb/1000";
    sha256 = "13ssg7l16zbjv8810rgw47f1bxcicnxg4mp0aa3dicci4az1rlhm";
  };

  in {
  options = {
    tlauncher.enable = lib.mkEnableOption "Enable TLauncher for Minecraft";
  };


  config = {
    xdg.desktopEntries = lib.mkIf config.tlauncher.enable {
      tlauncher = {
        name = "TLauncher";
        comment = "Launcher to run Minecraft";
        exec = "distrobox enter fedora -- java -jar '${tlauncher}'";
        icon = "${tLauncherIcon}";
        type = "Application";
        categories = [ "Game" ];
      };
    };
  };
}
