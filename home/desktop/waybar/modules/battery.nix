{lib, ...}:
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


  programs.waybar.style = lib.mkAfter 
  ''
    #battery {
      padding: 4px 0px;
    }

    #battery.discharging.warning {
      animation-name: blink-peach;
      animation-duration: 1s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }

    #battery.discharging.critical {
      animation-name: blink-red;
      animation-duration: 1s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }

    @keyframes blink-peach {
      to {
        background-color: @peach;
        color: @text;
      }
    }

    @keyframes blink-red {
      to {
        background-color: @red;
        color: @text;
      }
    }
  '';
}
