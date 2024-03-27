{
  description = "Flake for my system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      # Set configuration for each profile
      thryus = nixpkgs.lib.nixosSystem { # my main desktop
        system = "x86_64-linux";

        modules = [
          ./profile/thryus

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs;
            home-manager.users.brent = import ./home;
          }
        ];
      };
    };
  };
}
