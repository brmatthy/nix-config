{lib, ...}:
{
  programs.waybar.settings."mainbar"."group/time" = {
    orientation = "inherit";
    drawer = {
      transition-duration = 500;
      transition-left-to-right = true;
    };
    modules = [
      "group/gclock"
      "clock#date"
    ];
  };

  programs.waybar.settings."mainbar"."group/gclock" = {
    orientation = "inherit";
    modules = [
      "custom/clock-icon"
      "clock"
    ];
  };

  programs.waybar.settings."mainbar"."custom/clock-icon" = {
    format = "󰥔";
    tooltip = false;
  };

  programs.waybar.settings."mainbar"."clock" = {
    format = "{:%H\n%M\n%S}";
    interval = 1;
  };

  programs.waybar.settings."mainbar"."clock#date" = {
    format = "{:%a %d %b %Y}";
    rotate = 90;
  };

  programs.waybar.style = lib.mkAfter
  ''
    #time {
      background: @sky;
      color: @base;
      margin-bottom: 4px;
    }

    #custom-clock-icon {
      font-size: 20px;
      padding-right: 3px;
    }

    #clock.date {
      padding-bottom: 4px;
    }
  '';
}
