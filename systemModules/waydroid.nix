{ lib, config, ... }: {
  options = {
    waydroid.enable = lib.mkEnableOption "Enable waydroid";
  };

  config = lib.mkIf config.waydroid.enable {
    virtualisation.waydroid.enable = true;
  };
}
