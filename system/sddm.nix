{pkgs, ...}:
{
  # set the display manager
  services = {
    displayManager.sddm = {
      enable = true;
      autoNumlock = true;
    };
  };
}
