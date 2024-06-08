{...}:
{
  programs.waybar.settings."mainbar"."battery" = {
    rotate = 270;
    states = {
      good = 95;
      warning = 30;
      critical = 15;
    };
    format = "{icon}";
    format-charging = "󰚥";
    format-full = "{icon}";
    format-icons = [
      "󰁻"
      "󰁼"
      "󰁾"
      "󰂀"
      "󰂂"
      "󰁹"
    ];
    tooltip-format = "{timeTo} {capacity} % | {power} W";
  };
}
