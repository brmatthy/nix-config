{pkgs, config, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        output = ["DP-1" "eDP-1"];
        
        modules-left = ["custom/os" "hyprland/workspaces"];
        modules-center = ["clock"];
        #modules-right = ["network" "pulseaudio" "backlight" "battery" "custom/power"];

        "custom/os" = {
          format = "";
        };

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

    style = ''
      window#waybar {
        background-color: transparent;
        transition-property: background-color;
        transition-duration: 0.5s;
      }

      #custom-os {
        background-color: #${config.lib.stylix.colors.base00}
        foreground-color: #${config.lib.stylix.colors.base0C}
      }

    '';
  };
}
