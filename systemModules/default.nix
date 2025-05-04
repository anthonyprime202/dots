{ pkgs, lib, username, fullname, wm, ... }: {
  imports = [
    ./obs-studio.nix
    ./gnome.nix
    ./plasma.nix
    ./hyprland.nix
    ./packages.nix
    ./distrobox.nix
    ./postgresql.nix
    ./waydroid.nix
    ./mysql.nix
  ];


#     ____        _   _                 
#    / __ \      | | (_)                
#   | |  | |_ __ | |_ _  ___  _ __  ___ 
#   | |  | | '_ \| __| |/ _ \| '_ \/ __|
#   | |__| | |_) | |_| | (_) | | | \__ \
#    \____/| .__/ \__|_|\___/|_| |_|___/
#          | |                          
#          |_|                          


  postgresql.enable = lib.mkDefault true;
  mysql.enable = lib.mkDefault true;
  distrobox.enable = lib.mkDefault true;
  obs-studio.enable = lib.mkDefault true;
  waydroid.enable = lib.mkDefault true;

  hyprland.enable = (wm == "hyprland");
  plasma.enable = (wm == "plasma");
  gnome.enable = (wm == "gnome");


#    _____  _                             _   _     
#   |  __ \| |                           | | | |    
#   | |__) | |_   _ _ __ ___   ___  _   _| |_| |__  
#   |  ___/| | | | | '_ ` _ \ / _ \| | | | __| '_ \ 
#   | |    | | |_| | | | | | | (_) | |_| | |_| | | |
#   |_|    |_|\__, |_| |_| |_|\___/ \__,_|\__|_| |_|
#              __/ |                                
#             |___/                                 


  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  boot.plymouth.enable = true;
  boot.kernelParams = [
    "quiet" "splash" "boot.shell_on_fail"
    "loglevel=3" "rd.systemd.show_status=false"
    "rd.udev.log_level=3" "udev.log_priority=3"
  ];


#    ____              _   _                 _           
#   |  _ \            | | | |               | |          
#   | |_) | ___   ___ | |_| | ___   __ _  __| | ___ _ __ 
#   |  _ < / _ \ / _ \| __| |/ _ \ / _` |/ _` |/ _ \ '__|
#   | |_) | (_) | (_) | |_| | (_) | (_| | (_| |  __/ |   
#   |____/ \___/ \___/ \__|_|\___/ \__,_|\__,_|\___|_|   


  boot.loader = {
    systemd-boot.enable = false;

    grub = {
      enable = true;
      useOSProber = true;
      efiSupport = true;
      device = "nodev";
      theme = ../themes/grub;
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };


#    _______ _                ______                
#   |__   __(_)              |___  /                
#      | |   _ _ __ ___   ___   / / ___  _ __   ___ 
#      | |  | | '_ ` _ \ / _ \ / / / _ \| '_ \ / _ \
#      | |  | | | | | | |  __// /_| (_) | | | |  __/
#      |_|  |_|_| |_| |_|\___/_____\___/|_| |_|\___|


  time.timeZone = "Asia/Kolkata";


#    ______          _       
#   |  ____|        | |      
#   | |__ ___  _ __ | |_ ___ 
#   |  __/ _ \| '_ \| __/ __|
#   | | | (_) | | | | |_\__ \
#   |_|  \___/|_| |_|\__|___/


  fonts = {
    fontDir.enable = true;
    fontconfig.enable = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = ["FiraCode" "JetBrainsMono"]; })
      joypixels
      inter-nerdfont
      liberation_ttf # for microsoft compatibility
      hanazono # for japanese characters
      noto-fonts-cjk-sans # for chinese and korean characters
      noto-fonts-extra # for Arabic, Devanagari, Greek, etc
    ];
  };


#    ____  _            _              _   _     
#   |  _ \| |          | |            | | | |    
#   | |_) | |_   _  ___| |_ ___   ___ | |_| |__  
#   |  _ <| | | | |/ _ \ __/ _ \ / _ \| __| '_ \ 
#   | |_) | | |_| |  __/ || (_) | (_) | |_| | | |
#   |____/|_|\__,_|\___|\__\___/ \___/ \__|_| |_|


  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General.Experimental = true;
    };
  };


#     _____                 _     _          
#    / ____|               | |   (_)         
#   | |  __ _ __ __ _ _ __ | |__  _  ___ ___ 
#   | | |_ | '__/ _` | '_ \| '_ \| |/ __/ __|
#   | |__| | | | (_| | |_) | | | | | (__\__ \
#    \_____|_|  \__,_| .__/|_| |_|_|\___|___/
#                    | |                     
#                    |_|                     


  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };


#   __   _______   _____   _____           _        _     
#   \ \ / /  __ \ / ____| |  __ \         | |      | |    
#    \ V /| |  | | |  __  | |__) |__  _ __| |_ __ _| |___ 
#     > < | |  | | | |_ | |  ___/ _ \| '__| __/ _` | / __|
#    / . \| |__| | |__| | | |  | (_) | |  | || (_| | \__ \
#   /_/ \_\_____/ \_____| |_|   \___/|_|   \__\__,_|_|___/
  

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  };


#    _____      _ _    _ _   
#   |  __ \    | | |  (_) |  
#   | |__) |__ | | | ___| |_ 
#   |  ___/ _ \| | |/ / | __|
#   | |  | (_) | |   <| | |_ 
#   |_|   \___/|_|_|\_\_|\__|


  security.polkit.enable = true;


#    _    _               
#   | |  | |              
#   | |  | |___  ___ _ __ 
#   | |  | / __|/ _ \ '__|
#   | |__| \__ \  __/ |   
#    \____/|___/\___|_|   


  programs.zsh.enable = true; # Properly enable zsh
  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" # for sudo
                    "networkmanager" # pretty self explanatory
                    "dialout" # for access to serial ports (needed by arduino ide)
                    "storage" # for mounting and unmounting privileges
                    "adbusers" # for android development
                  ];
    home = "/home/${username}";
    description = fullname;
  };


#     _____                 _               
#    / ____|               (_)              
#   | (___   ___ _ ____   ___  ___ ___  ___ 
#    \___ \ / _ \ '__\ \ / / |/ __/ _ \/ __|
#    ____) |  __/ |   \ V /| | (_|  __/\__ \
#   |_____/ \___|_|    \_/ |_|\___\___||___/


  services = {
    libinput.enable = true; # prolly for better touchpad support
    upower.enable = true; # for battery management 
    gvfs.enable = true; # for some file access thing (idk... i forgot ;-;)
    resolved.enable = true; # for dns lookups (i have no idea what that means)
    openssh.enable = true;

    xserver = {
      enable = true;
      videoDrivers = ["amdgpu"];
    };
  };
  

#    _   _      _                      _    _             
#   | \ | |    | |                    | |  (_)            
#   |  \| | ___| |___      _____  _ __| | ___ _ __   __ _ 
#   | . ` |/ _ \ __\ \ /\ / / _ \| '__| |/ / | '_ \ / _` |
#   | |\  |  __/ |_ \ V  V / (_) | |  |   <| | | | | (_| |
#   |_| \_|\___|\__| \_/\_/ \___/|_|  |_|\_\_|_| |_|\__, |
#                                                    __/ |
#                                                   |___/


  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    dhcpcd.enable = true;

    firewall = rec {
      enable = true;

      # for KDE Connect
      allowedTCPPortRanges = [ { from = 1714; to = 1764; } { from = 5555; to = 5555; } { from = 1420; to = 1420; } ];  
      allowedTCPPorts = [ 8000 5173 ];
      allowedUDPPortRanges = allowedTCPPortRanges; 
    };
  };


#     _____                       _ 
#    / ____|                     | |
#   | (___   ___  _   _ _ __   __| |
#    \___ \ / _ \| | | | '_ \ / _` |
#    ____) | (_) | |_| | | | | (_| |
#   |_____/ \___/ \__,_|_| |_|\__,_|


  hardware.pulseaudio.enable = false; 
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;   
  };


#    _   _ _      
#   | \ | (_)     
#   |  \| |___  __
#   | . ` | \ \/ /
#   | |\  | |>  < 
#   |_| \_|_/_/\_\

  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}
