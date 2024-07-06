{ ... }:
{
  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";

    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            status = "enable";
          }
        ];
        # exec = [
        #   "hyprctl dispatch moveworkspacetomonitor \"1 0\""
        #   "hyprctl dispatch moveworkspacetomonitor \"2 0\""
        #   "hyprctl dispatch moveworkspacetomonitor \"3 0\""
        #   "hyprctl dispatch moveworkspacetomonitor \"4 0\""
        #   "hyprctl dispatch moveworkspacetomonitor \"5 0\""
        #   "hyprctl dispatch moveworkspacetomonitor \"6 0\""
        #   "hyprctl dispatch moveworkspacetomonitor \"7 0\""
        #   "hyprctl dispatch moveworkspacetomonitor \"8 0\""
        #   "hyprctl dispatch moveworkspacetomonitor \"9 0\""
        #   "hyprctl dispatch moveworkspacetomonitor \"10 0\""
        # ];
      };

      docked_home = {
        outputs = [
          {
            criteria = "Iiyama North America PLX2283H 11593014B8288";
            position = "1920,-560";
            transform = "90";
            scale = 1.0;
            mode = "1920x1080@60Hz";
          }
          {
            criteria = "LG Electronics LG FULL HD 812NTWGCU585";
            position = "0,0";
            scale = 1.0;
            mode = "1920x1080@60Hz";
          }
          {
            criteria = "eDP-1";
            status = "disable";
          }
        ];
        # exec = [
        #   "hyprctl dispatch moveworkspacetomonitor \"1 2\""
        #   "hyprctl dispatch moveworkspacetomonitor \"2 2\""
        #   "hyprctl dispatch moveworkspacetomonitor \"3 2\""
        #   "hyprctl dispatch moveworkspacetomonitor \"4 2\""
        #   "hyprctl dispatch moveworkspacetomonitor \"5 2\""
        #   "hyprctl dispatch moveworkspacetomonitor \"6 1\""
        #   "hyprctl dispatch moveworkspacetomonitor \"7 1\""
        #   "hyprctl dispatch moveworkspacetomonitor \"8 1\""
        #   "hyprctl dispatch moveworkspacetomonitor \"9 1\""
        #   "hyprctl dispatch moveworkspacetomonitor \"10 1\""
        # ];
      };

      docket_intelliprove = {
        outputs = [
          {
            criteria = "Samsung Electric Company C34H89x H4ZT205300";
            position = "0,0";
            mode = "3440x1440@60Hz";
          }
          {
            criteria = "eDP-1";
            position = "770,1440";
          }
        ];
        # exec = [
        #   "hyprctl dispatch moveworkspacetomonitor \"1 2\""
        #   "hyprctl dispatch moveworkspacetomonitor \"2 2\""
        #   "hyprctl dispatch moveworkspacetomonitor \"3 2\""
        #   "hyprctl dispatch moveworkspacetomonitor \"4 2\""
        #   "hyprctl dispatch moveworkspacetomonitor \"5 2\""
        #   "hyprctl dispatch moveworkspacetomonitor \"6 0\""
        #   "hyprctl dispatch moveworkspacetomonitor \"7 0\""
        #   "hyprctl dispatch moveworkspacetomonitor \"8 0\""
        #   "hyprctl dispatch moveworkspacetomonitor \"9 0\""
        #   "hyprctl dispatch moveworkspacetomonitor \"10 0\""
        # ];
      };
    };
  };
}
