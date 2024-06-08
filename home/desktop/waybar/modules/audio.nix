{...}:
{
  programs.waybar.settings."mainbar"."group/audio" = {
    orientation = "inherit";
    drawer = {
      transition-duration = 500;
      transition-left-to-right = false;
    };
    modules = [
      "pulseaudio"
      "pulseaudio#mic"
      "pulseaudio/slider"
    ];
  };

  programs.waybar.settings."mainbar"."pulseaudio" = {
    format = "{icon}";
    format-bluetooth = "{icon}";
    tooltip-format = "{volume}% {icon} | {desc}";
    format-muted = "󰖁";
    format-icons = {
      headphones = "󰋌";
      handsfree = "󰋌";
      headset = "󰋌";
      phone = "";
      portable = "";
      car = " ";
      default = [
        ""
        ""
        ""
      ];
    };
    on-click = "pamixer -t";
    on-click-right = "pavucontrol";
    smooth-scrolling-threshold = 1;
  };

  programs.waybar.settings."mainbar"."pulseaudio#mic" = {
    format = "{format_source}";
    format-source = "";
    format-source-muted = "";
    tooltip-format = "{volume}% {format_source} ";
    on-click = "pactl set-source-mute 0 toggle";
    on-scroll-down = "pactl set-source-volume 0 -1%";
    on-scroll-up = "pactl set-source-volume 0 +1%";
  };

  programs.waybar.settings."mainbar"."pulseaudio/slider" = {
    min = 0;
    max = 100;
    orientation = "vertical";
  };
}
