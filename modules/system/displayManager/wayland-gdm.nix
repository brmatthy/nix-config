{ lib, config, options, pkgs, ... }:
{
  environment.systemPackages = [ pkgs.wayland pkgs.waydroid ];

  services.xserver = {
    enable = true;
    layout = "be";
    xkbVariant = "wang";
    xkbOptions = "caps:escape";
    displayManager.gdm = {
      enable = true;
      wayland = true;
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
