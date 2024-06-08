{...}:
{
  imports = [
    ./modules/workspaces.nix
    ./modules/time.nix
  ];


  programs.waybar.enable = true;
  programs.waybar.settings.mainBar.layer = "top";
  programs.waybar.settings.mainBar.position = "left";
  programs.waybar.settings.mainBar.output = ["DP-1" "eDP-1"];

  programs.waybar.settings.mainBar.modules-left = ["group/time"];
  programs.waybar.settings.mainBar.modules-center = ["hyprland/workspaces"];
  programs.waybar.settings.mainBar.modules-right = [];
}
