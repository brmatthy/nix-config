{pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      layer = "top";
      position = "top";
      output = ["DP-1" "eDP-1"];
      
      modules-left = ["hyprland/workspaces"];
      modules-center = ["clock"];
      #modules-right = ["network" "pulseaudio" "backlight" "battery" "custom/power"];

      "hyprland/workspaces" = {
        all-outputs = true;
        format = "{name} {windows}";
        window-rewrite-default = "";
        window-rewrite = {
          "firefox" = "󰈹";
          "brave" = "󰖟";
          "kitty" = "";
          "gnome-disks" = "󱛟";
          "Spotify" = "";
          "pavucontrol" = "󰓃";
          "thunar" = "";
          "discord" = "󰙯";
          "obsidian" = "";
          "xwaylandvideobridge" = "";
        };
      };

      "clock" = {
        interval = 1;
        format = "{:%a %d %B %Y %H:%M:%S}";
      };
    };
  };
}
