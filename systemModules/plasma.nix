{ pkgs, lib, config, ... }: {
  options = {
    plasma.enable = lib.mkEnableOption "Enable Plasma Desktop Environment";
  };

  config = lib.mkIf config.plasma.enable {
    services.desktopManager.plasma6.enable = true;
    services.displayManager.defaultSession = "plasma";

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      settings.Theme.CursorSize = "18";
    };

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      konsole
      oxygen
    ];
  };
}
