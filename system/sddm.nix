{pkgs, ...}:
{
  # Set the display manager
  services.xserver = {
    displayManager.sddm = {
      enable = true;
      autoNumlock = true;
    };
  };
}
