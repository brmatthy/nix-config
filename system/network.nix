{ hostname, ... }:
{
  networking.networkmanager.enable = true;
  networking.hostName = hostname;
  networking.networkmanager.wifi.scanRandMacAddress = false;
}
