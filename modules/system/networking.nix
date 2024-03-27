{ lib, config, options, pkgs, hostname, ... }:
{
  networking.hostName = hostname;
  networking.networkmanager.enable = true;
}
