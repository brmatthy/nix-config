{ ... }:
let
  hostname = "thryus";
in
{
  imports = [
    ../../users/brent.nix
    { _module.args = { inherit hostname; }; }
  ];
}
