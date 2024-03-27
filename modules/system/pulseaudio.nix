{ lib, config, options, pkgs, ... }:
{
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
}
