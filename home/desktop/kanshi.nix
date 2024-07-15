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
      };

      zyphron_docked_home = {
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
      };

      thryus_docked_home = {
        outputs = [
          {
            criteria = "DP-1";
            position = "1920,-560";
            transform = "90";
            scale = 1.0;
            mode = "1920x1080@60Hz";
          }
          {
            criteria = "HDMI-A-1";
            position = "0,0";
            scale = 1.0;
            mode = "1920x1080@60Hz";
          }
          {
            criteria = "Unknown-1";
            status = "disable";
          }
        ];
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
            scale = 1.0;
          }
        ];
      };
      docket_intelliprove_2 = {
        outputs = [
          {
            criteria = "Samsung Electric Company C34H89x H4ZT205303";
            position = "0,0";
            mode = "3440x1440@60Hz";
          }
          {
            criteria = "eDP-1";
            position = "770,1440";
            scale = 1.0;
          }
        ];
      };
    };
  };
}
