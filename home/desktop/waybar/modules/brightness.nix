{...}:
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
}
