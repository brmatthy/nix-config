{pkgs, ...}:
{
  boot.kernelParams = ["quiet"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
  
