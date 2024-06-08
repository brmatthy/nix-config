{...}:
{
  imports = [
    ./modules/workspaces.nix
    ./modules/time.nix
  ];

  programs.waybar.enable = true;
  programs.waybar.settings."mainbar".layer = "top";
  programs.waybar.settings."mainbar".position = "left";
  programs.waybar.settings."mainbar".output = ["DP-1" "eDP-1"];

  programs.waybar.settings."mainbar".modules-left = ["group/time"];
  programs.waybar.settings."mainbar".modules-center = ["hyprland/workspaces"];
  programs.waybar.settings."mainbar".modules-right = [];
}
