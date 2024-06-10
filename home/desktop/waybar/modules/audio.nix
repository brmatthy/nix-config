{lib, ...}:
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


  programs.waybar.style = lib.mkAfter
  ''
    #pulseaudio-slider slider {
      background-color: transparent;
      box-shadow: none;
    }

    #pulseaudio-slider highlight{
      border-radius: 8px;
      background-color: @text;
    }

    #pulseaudio-slider trough {
      margin-top: 4px;
      min-width: 6px;
      min-height: 60px;
      border-radius: 8px;
      border-style: solid;
      border-color: @text;
      border-width: 1px;
      background-color: @base;
    }

    #pulseaudio.muted {
        color: @red;
    }

    #pulseaudio.mic {
      color: @green;
      padding-left: 4px;
    }

    #pulseaudio.mic.muted {
      color: @red;
    }
  '';
}
