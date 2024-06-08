{...}:
{
  programs.waybar.settings."mainbar"."group/network" = {
    orientation = "inherit";
    drawer = {
      transition-duration = 500;
      transition-left-to-right = false;
    };
    modules = [
      "network"
      "network#essid"
    ];
  };

  programs.waybar.settings."mainbar"."network" = {
    format = "{icon}";
    format-wifi = "{icon}";
    format-icons = {
      wifi = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
      ethernet = ["󰈀"];
    };
    format-ethernet = "{icon}";
    format-disconnected = "󰤭";
    tooltip = false;
    max-length = 50;
    on-click = "kitty nmtui";
    interval = 1;
    format-linked = "󰈁";
  };

  programs.waybar.settings."mainbar"."network#essid" = {
    format = " {essid} ";
    rotate = 90;
    interval = 5;
    tooltip-format = "{ipaddr}";
    tooltip-format-wifi = " {bandwidthDownBits}";
    tooltip-format-ethernet = "{ifname} 󰈀 \n{ipaddr} | {frequency} MHz{icon} ";
    tooltip-format-disconnected = "Not Connected to any type of Network";
    tooltip = true;
    on-click = "kitty nmtui";
  };
}
