# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
   
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    layout = "be";
    xkbVariant = "wang";
  };

  # Configure console keymap
  console.keyMap = "be-latin1";
  
  # laptop settings
  # Hibernate on lidswitch
  services.logind.lidSwitch = "ignore";
  services.xserver.libinput.touchpad.naturalScrolling = true;

  # allow usb
  services.gvfs.enable = true;
  services.udisks2.enable = true;

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

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 
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

    pipewire
    playerctl
    pavucontrol
    #pulseaudio
    spotify
    #pkgs.unstable.vesktop
    obsidian
    gnome.nautilus
    wl-clipboard
    kanshi


    wget
    zip
    unzip
    podman-compose

    # language servers
    cmake-language-server
    nodePackages.pyright
    rust-analyzer
    pkgs.nodePackages.typescript-language-server
    vscode-langservers-extracted
    lua-language-server
    marksman
    #pkgs.unstable.typos-lsp

    # formatters
    stylua
    rustfmt
    black
    isort
  ];

  #hardware.pulseaudio.enable = true;
  #sound.enable = true;
  #nixpkgs.config.pulseaudio = true;
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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

  # Use hyprland as window manager
  programs.hyprland.enable = true;

  # Install podman as container manager
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
