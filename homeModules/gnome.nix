{ pkgs, lib, config, ... }: {
  options = {
    gnome.enable = lib.mkEnableOption "Enable Gnome Specific Configurations";
  };


  config = lib.mkIf config.gnome.enable {
    dconf = {

      settings = {
        "org/gnome/shell" = {
          disable-user-extensions = false; # enables user extensions
          enabled-extensions = with pkgs.gnomeExtensions; [
            gsconnect.extensionUuid
            blur-my-shell.extensionUuid
            dash-to-dock.extensionUuid
            user-themes.extensionUuid
            just-perfection.extensionUuid
            caffeine.extensionUuid
            pano.extensionUuid
            middle-click-to-close-in-overview.extensionUuid
            color-picker.extensionUuid
            app-hider.extensionUuid
            alphabetical-app-grid.extensionUuid
            media-controls.extensionUuid
            coverflow-alt-tab.extensionUuid
            appindicator.extensionUuid
            system-monitor.extensionUuid
            tiling-shell.extensionUuid
            vitals.extensionUuid
            emoji-copy.extensionUuid
          ];
        };
      };
    };

    home.packages = with pkgs.gnomeExtensions; [
      gsconnect
      blur-my-shell
      dash-to-dock
      user-themes
      just-perfection
      caffeine
      pano
      middle-click-to-close-in-overview
      color-picker
      app-hider
      alphabetical-app-grid
      media-controls
      coverflow-alt-tab
      tiling-shell
      appindicator
      vitals
      emoji-copy
    ];

  };
}
