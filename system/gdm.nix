{pkgs, ...}:
{
  # set the display manager
  services.xserver = {
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
