{
  description = "The Ever Incomplete Rice!";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    kwin-effects-forceblur = {
      url = "github:taj-ny/kwin-effects-forceblur";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    stylix.url = "github:danth/stylix/release-24.11";

    ags.url = "github:Aylur/ags/v1";
    catppuccin.url = "github:catppuccin/nix";
    
    hyprland.url = "github:hyprwm/Hyprland";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    ghostty.url = "github:ghostty-org/ghostty";


    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, home-manager, nixpkgs, unstable, ... }@inputs:
    let 
      # System
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          joypixels.acceptLicense = true;
        };
      };
      upkgs = import unstable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      inherit (import ./config.nix) wm username fullname email gitUser terminal;
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit pkgs system;
        specialArgs = { inherit inputs system username fullname terminal wm; };
        # modules = [ 
        #   inputs.stylix.nixosModules.stylix
        #   ./system/main.nix
        # ];
        modules = [ ./hosts/thinkbook/configuration.nix ];
      };

      homeConfigurations.anthonyprime = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs upkgs system username fullname gitUser email terminal wm; };
        # modules = [
        #   inputs.catppuccin.homeManagerModules.catppuccin
        #   inputs.stylix.homeManagerModules.stylix
        #   inputs.plasma-manager.homeManagerModules.plasma-manager
        #   ./home/main.nix
        # ];
        modules = [
          ./hosts/thinkbook/home.nix
        ];
      };
    };
}

