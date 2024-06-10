{lib, ...}:
{
  programs.waybar.settings."mainbar"."hyprland/workspaces" = {
    all-outputs = true;
    on-click = "activate";
    format = "{icon}";
    format-icons = {
      "1" = "1";
      "2" = "";
      "3" = "";
      "4" = "󰉋";
      "5" = "5";
      "6" = "󰖟";
      "7" = "7";
      "8" = "8";
      "9" = "";
      "10" = "󰙯";
    };
  };

  programs.waybar.style = lib.mkAfter
  ''
    #workspaces {
      border-radius: 8px;
    }

    #workspaces button {
      background: transparent;
      border-radius: 4px;
      color: alpha(@text, 0.7);
    }

    #workspaces button.urgent {
      font-weight: bold;
      background: @red;
      color: @base;
    }

    #workspaces button.visible {
      padding: 4px 2px;
      color: @peach;
    }

    #workspaces button.active {
      padding: 4px 2px;
      background: @peach;
      color: @base;
      border-radius: 4px;
    }
  '';

}
