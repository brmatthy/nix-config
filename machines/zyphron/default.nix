{ config, pkgs, ... }:
let
  hostname = "zyphron";
  locale = "en_GB.UTF-8";
in
{
  imports =
    [ 
      ./hardware-configuration.nix  # include the hardware specific config
      ../../system/bootloader.nix   # include the bootloader config 
      ../../system/hyprland.nix     # set hyprland as the window manager
      ../../system/podman.nix       # use podman as the container manager
      ../../system/keymap-azerty.nix # use azerty keymap.
      ../../system/pipewire.nix     # use pipewire for audio
      ../../system/printing.nix     # enable printing
      ../../system/network.nix      # setup neworking
      { _module.args = { inherit hostname; }; }
      ../../system/i18n.nix         # setup locale 
      { _module.args = { inherit locale; }; }
    ];

  time.timeZone = "Europe/Brussels"; # Set your time zone.
  services.xserver.enable = true; # Enable xserver. Other config modules set depend on it.
  services.logind.lidSwitch = "ignore"; # machine shuts down on sleep, so don't sleep
  services.libinput.touchpad.naturalScrolling = true; # set naturalScrolling

  # allow flakes and nix-command
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

  # kanshi systemd service
  # systemd.user.services.kanshi = {
  #   description = "kanshi daemon";
  #   serviceConfig = {
  #     Type = "simple";
  #     ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
  #   };
  # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.brent = {
    isNormalUser = true;
    description = "brent";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    #shell = pkgs.zsh;
  };

  # Allow unfree packages
  # And use unstable branch
  nixpkgs.config = {
    allowUnfree = true;
    # packageOverrides = pkgs: {
    #   unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {
	  #   config = config.nixpkgs.config;
    #   };
    # };
  };

  # electron for obsidian
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  # Set the display manager
  services.xserver = {
    displayManager.sddm = {
      enable = true;
      autoNumlock = true;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
