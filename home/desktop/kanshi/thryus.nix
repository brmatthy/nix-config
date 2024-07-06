{ ... }:
{
  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";

    profiles = {
      main = {
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
        ];
      };
    };
  };
}
