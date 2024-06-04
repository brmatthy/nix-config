{pkgs, ...}:
{
  boot.kernelParams = ["quiet"];
  boot.plymouth.theme = "bgrt";
  boot.plymouth.enable = true; # nice splash screen on boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
  
