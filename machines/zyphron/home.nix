{ ... }:
let
  hostname = "zyphron";
in
{
  imports = [
    ../../users/brent.nix
    { _module.args = { inherit hostname; }; }
  ];
}
