{ pkgs, lib, config, terminal, ... }: {
  options = {
    gnome.enable = lib.mkEnableOption "Enable Gnome Desktop Environment";
  };
  

  config = lib.mkIf config.gnome.enable {

    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.displayManager.gdm.enable = true;

    programs.nautilus-open-any-terminal = {
      enable = true;
      terminal = "${terminal}";
    };

    environment.systemPackages = with pkgs; [ gnome-tweaks ];

    environment.gnome.excludePackages = (with pkgs; [
      atomix # puzzle game
      epiphany # web browser
      geary # email reader
      gedit # text editor
      gnome-characters
      gnome-music
      gnome-photos
      gnome-terminal
      gnome-tour
      hitori # sudoku game
      iagno # go game
      tali # poker game
    ]);
  };
}
