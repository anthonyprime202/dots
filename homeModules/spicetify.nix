{ lib, config, inputs, system, ... }: {

  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  options = {
    spicetify.enable = lib.mkEnableOption "Enable spicetify";
  };

  config = lib.mkIf config.spicetify.enable {
    programs.spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${system};
    in {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        beautifulLyrics
      ];
    };
  };
}
