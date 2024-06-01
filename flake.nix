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
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.zyphron = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        .profiles/zyphron
      ];
    };
  };
}
