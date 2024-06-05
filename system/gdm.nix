{pkgs, ...}:
{
  # set the display manager
  services = {
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
