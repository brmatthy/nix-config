{lib, ...}:
{
  programs.waybar.settings."mainbar"."group/brightness" = {
    orientation = "inherit";
    drawer = {
      transition-duration = 500;
      transition-left-to-right = false;
    };
    modules = [
      "backlight"
      "backlight/slider"
    ];
  };

  programs.waybar.settings."mainbar"."backlight" = {
    format = "{icon}";
    format-icons = [
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
    ];
    tooltip = true;
    tooltip-format = "Brightness: {percent}% ";
  };


  programs.waybar.settings."mainbar"."backlight/slider" = {
    min = 0;
    max = 100;
    orientation = "vertical";
  };


  programs.waybar.style = lib.mkAfter
  ''
    #backlight {
      color: @text;
    }

    #backlight-slider slider {
      background-color: transparent;
      box-shadow: none;
    }

    #backlight-slider highlight{
      border-radius: 8px;
      background-color: @text;
    }

    #backlight-slider trough {
      margin-top: 4px;
      min-width: 6px;
      min-height: 60px;
      border-radius: 8px;
      border-style: solid;
      border-color: @text;
    }
  '';
}
