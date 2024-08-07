{ config, pkgs, ... }:
let
  hostname = "zyphron";
  locale = "en_GB.UTF-8";
in
{
  imports =
    [ 
      ./hardware-configuration.nix          # include the hardware specific config
      ../../system/bootloader.nix           # include the bootloader config 
      ../../system/gdm.nix                 # use sddm as display manager
      ../../system/pam.nix                  # enable pam for swaylock
      ../../system/hyprland.nix             # set hyprland as the window manager
      ../../system/podman.nix               # use podman as the container manager
      ../../system/keymap-azerty.nix        # use azerty keymap.
      ../../system/pipewire.nix             # use pipewire for audio
      ../../system/printing.nix             # enable printing
      ../../system/network.nix              # setup neworking
      ../../system/battery.nix              # setup battery
      ../../system/multimedia.nix           # setup multimedia packages
      ../../system/steam.nix           # setup multimedia packages
      ../../system/nix-ld.nix
      { _module.args = { inherit hostname; }; }
      ../../system/i18n.nix                 # setup locale 
      { _module.args = { inherit locale; }; }
      ../../stylix/catppuccin-frappe        # use stylix
    ];

  time.timeZone = "Europe/Brussels"; # Set your time zone.
  services.xserver.enable = true; # Enable xserver. Other config modules set depend on it.
  services.logind.lidSwitch = "ignore"; # machine shuts down on sleep, so don't sleep
  services.libinput.touchpad.naturalScrolling = true; # set naturalScrolling

  # allow flakes and nix-command
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.brent = {
    isNormalUser = true;
    description = "brent";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true; # we set programs.zsh.enable in home-manager, so ignore the warning
  };

  environment.systemPackages = with pkgs; [ nix-index ffmpeg_7 ];

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

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
    };
  };

  # electron for obsidian
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
