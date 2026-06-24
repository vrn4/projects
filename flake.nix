{
  description = "NixOS configuration with zapret, home-manager and niri";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zapret-discord-youtube = {
      url = "github:kartavkun/zapret-discord-youtube";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, zapret-discord-youtube, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations.nixos-vrn = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nixos-vrn/configuration.nix
          ./modules/core/default.nix
          ./modules/hardware/default.nix
          ./modules/desktop/default.nix
          ./modules/users/default.nix

          zapret-discord-youtube.nixosModules.default
          {
            services.zapret-discord-youtube = {
              enable = true;
              config = "general (ALT12)";
              gameFilter = "all";
              listGeneral = [ "example.com" "test.org" ];
              listExclude = [ "ubisoft.com" ];
              ipsetAll = [ "192.168.1.0/24" ];
              ipsetExclude = [ "203.0.113.0/24" ];
            };
          }

          {
            services.openssh.enable = true;
            networking.firewall.allowedTCPPorts = [ 22 ];
          }

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.vrn = import ./home-manager/vrn.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    };
}
