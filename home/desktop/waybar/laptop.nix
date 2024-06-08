{...}:
{
  imports = [
    ./modules/workspaces.nix
    ./modules/time.nix
    ./modules/brightness.nix
    ./modules/audio.nix
    ./modules/network.nix
    ./modules/utils.nix
    ./modules/battery.nix
  ];

  programs.waybar.enable = true;
  programs.waybar.settings."mainbar".layer = "top";
  programs.waybar.settings."mainbar".position = "left";
  programs.waybar.settings."mainbar".output = ["DP-1" "eDP-1"];

  programs.waybar.settings."mainbar".modules-left = ["group/time"];
  programs.waybar.settings."mainbar".modules-center = ["hyprland/workspaces"];
  programs.waybar.settings."mainbar".modules-right = [
    "group/brightness"
    "group/audio"
    "group/network"
    "group/utils"
    "battery"
  ];
}
