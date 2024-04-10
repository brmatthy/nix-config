{ lib, config, options, pkgs, ... }:
let
  hostname = "thryus";
  device = "/dev/vda"; # the device for the bootloader
  usernames = ["brent"];
  timezone = "Europe/Brussels";
  locale = "en_GB.UTF-8";
in 
{
  # import the system modules wanted for this system
  imports = [
    ../../../modules/system/grub-bootloader.nix { # set grub as bootloader
      _module.args = {
        inherit device;
      };
    }

    # ../../../modules/system/default-users.nix { # add users accounts
    #   _module.args = {
    #     inherit usernames;
    #   };
    # }

    ../../../modules/system/networking.nix { # set networking
      _module.args = {
        inherit hostname;
      };
    }

    ../../../modules/system/locale.nix { # set time and locale
      _module.args = { 
        inherit timezone;
        inherit locale;
      };
    }

    ../../../modules/system/locale.nix # set keymap to azerty
    ../../../modules/system/garbage-collect.nix # enable weekly garbage collection
    ../../../modules/system/printing.nix # enable printing
    ../../../modules/system/fonts.nix # install fonts

    ../../../modules/system/wayland-sddm.nix # use sddm as wayland display manager
    ../../../modules/system/hyprland.nix # use hyprland as the window manager
    ../../../modules/system/dbus.nix
    ../../../modules/system/pulseaudio.nix # use pulseaudio for sound
    ../../../modules/system/polkit.nix # start polkit on startup

    ./hardware-configuration.nix # set hardware configuration
    ];

  nix.settings.experimental-features = ["nix-command" "flakes"]; # enable nix flakes
  nixpkgs.config.allowUnfree = true; # allow unfree software

  users.extraUsers.brent = {
    isNormalUser = true;
    description = "brent";
    extraGroups = [ "wheel" "audio" "video" "networkmanager" "docker" ];
    useDefaultShell = true;
    packages = with pkgs; [];
  };

  # System packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    zsh
    git
    home-manager
  ];

  # set zsh as default shell
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  fonts.fontDir.enable = true;
  # It is ok to leave this unchanged for compatibility purposes
  system.stateVersion = "23.11";
}
