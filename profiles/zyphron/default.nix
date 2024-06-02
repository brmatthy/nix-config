{ config, pkgs, ... }:
   
{
  imports =
    [ 
      ./hardware-configuration.nix  # include the hardware specific config
      ../../system/bootloader.nix   # include the bootloader config 
      ../../system/hyprland.nix     # set hyprland as the window manager
      ../../system/podman.nix       # use podman as the container manager
      ../../system/keymap-azerty.nix # use azerty keymap.
      ../../system/pipewire.nix     # use pipewire for audio
    ];
  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "zyphron"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Enable xserver. Other config modules set depend on it.
  services.xserver.enable = true;

  # machine shuts down on sleep, so don't sleep
  services.logind.lidSwitch = "ignore";

  # allow flakes and nix-command
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

  services.libinput.touchpad.naturalScrolling = true;

  # install zsh
  programs.zsh.enable = true;

  # kanshi systemd service
  systemd.user.services.kanshi = {
    description = "kanshi daemon";
    serviceConfig = {
      Type = "simple";
      ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.brent = {
    isNormalUser = true;
    description = "brent";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # dev
    git 
    lazygit

    stow
    #pkgs.unstable.distrobox

    # terminal programs
    kitty
    starship
    eza
    fastfetch
    btop

    firefox
    bitwarden
    waybar
    wlr-randr
    rofi-wayland
    grimblast

    ripgrep

    rustc
    cargo

    clang
    cmake
    python3
    gnumake
    nodejs_20
    lua
    typescript

    spotify
    #pkgs.unstable.vesktop
    obsidian
    gnome.nautilus
    wl-clipboard
    kanshi


    wget
    zip
    unzip

    # language servers
    cmake-language-server
    nodePackages.pyright
    rust-analyzer
    pkgs.nodePackages.typescript-language-server
    vscode-langservers-extracted
    lua-language-server
    marksman
    nil
    typos-lsp

    # formatters
    stylua
    rustfmt
    black
    isort
  ];
  # Install nvim as the default text editor
  programs.neovim = {
    enable = true;
    defaultEditor = true;	
  };

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
