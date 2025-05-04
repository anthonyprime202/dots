{ pkgs, lib, config, ... }: {
  options = {
    obs-studio.enable = lib.mkEnableOption "Enable OBS Studio";
  };

  config = lib.mkIf config.obs-studio.enable {
    # For virtualcam
    boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';

    environment.systemPackages = [ 
      (pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          obs-backgroundremoval
          droidcam-obs
          obs-composite-blur
          obs-source-clone
        ];
      })
    ];
  };
}
