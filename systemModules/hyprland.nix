{ pkgs, lib, config, inputs, system, ... }: {
  options = {
    hyprland.enable = lib.mkEnableOption "Enable hyprland window manager";
  };

  config = lib.mkIf config.hyprland.enable ( let 
    hyprpkg = inputs.hyprland.packages.${system};
  in
  {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;

      package = hyprpkg.hyprland;
      portalPackage = hyprpkg.xdg-desktop-portal-hyprland;
    };

    services.udisks2.enable = true;
    services.tlp.enable = true;

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };


    environment.systemPackages = with pkgs; [
      brightnessctl
      pavucontrol
      pamixer
      playerctl

      lxqt.lxqt-policykit
      gnome-calculator
      gnome-disk-utility
      nemo
      sww
      loupe

      wlinhibit
      hyprshot
      hyprpicker
    ];


    nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  });
}
