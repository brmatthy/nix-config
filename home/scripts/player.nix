{ pkgs, ... }:
let
  player = pkgs.writeShellScriptBin "player.sh" ''
    if playerctl -l | grep -q "spotify"; then
      playerctl -p spotify "$@"
    else
      playerctl "$@"
    fi
  '';
in
{
  home.packages = with pkgs; [
    player
  ];
}
