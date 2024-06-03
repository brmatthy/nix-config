# ┌─────────────────────────────────────────────┐
# │░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░│
# │░░█▀█░▀█▀░█░█░█▀█░█▀▀░░░█▀▀░█░░░█▀█░█░█░█▀▀░░│
# │░░█░█░░█░░▄▀▄░█░█░▀▀█░▀░█▀░░█░░░█▀█░█▀▄░█▀░░░│
# │░░▀░▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀░▀░▀░▀░▀▀▀░░│
# │░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░│
# │░░░░░░░░░Brent░Matthys░on░01-06-2024░░░░░░░░░│
# └─────────────────────────────────────────────┘

{
  description = "System flake";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.zyphron = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./profiles/zyphron/system.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.extraSpecialArgs = inputs;
          home-manager.users.brent = import ./profiles/zyphron/home.nix;
        }
      ];
    };
  };
}
