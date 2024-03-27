{ lib, config, options, pkgs, device, ... }:
{
  boot.loader.grub.enable = true; 
  boot.loader.grub.device = device; 
  boot.loader.grub.enable = true; 
}
