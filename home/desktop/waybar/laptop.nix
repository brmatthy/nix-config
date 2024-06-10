{config, lib, ...}:
{
  imports = [
    ./colours.nix
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

  programs.waybar.style = lib.mkAfter
  ''
    * {
      font-size: 16px;
      font-family: "JetBrainsMono Nerd Font,JetBrainsMono NF";
      min-width: 8px;
      min-height: 0px;
      border: none;
      border-radius: 0;
      box-shadow: none;
      text-shadow: none;
      padding: 0px;
      border-radius: 8px;
    }

    window#waybar {
      border-radius: 8px;
      background: transparent;
      color: @peach;
    }
  '';
}
