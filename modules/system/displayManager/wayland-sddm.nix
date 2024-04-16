{ lib, config, options, pkgs, ... }:
{
  environment.systemPackages = [ pkgs.wayland pkgs.waydroid ];

  services.xserver = {
    enable = true;
    layout = "be";
    xkbVariant = "wang";
    xkbOptions = "caps:escape";
    displayManager.sddm = {
      enable = true;
      #wayland.enable = true;
      autoNumlock = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
