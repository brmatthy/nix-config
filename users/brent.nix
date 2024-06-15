{ config, pkgs, lib, ... }:
let
  aliases = {
    v="nvim";
    cmcd="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1";
    diff="diff --color=auto";
    grep="grep --color=auto";
    ls="eza --icons --color=always --group-directories-first";
    player="if playerctl -l | grep -q 'spotify'; then playerctl -p spotify '$@'; else playerctl '$@'; fi";
    rebuild="sudo nixos-rebuild switch --flake .#zyphron";
    mirror="hyprctl keyword monitor eDP-1,1920x1080@60,0x0,1,mirror,HDMI-A-1";
    docked="wlr-randr --output eDP-1 --off --output DP-1 --pos 0,0 --transform normal --output HDMI-A-1 --pos 1920,-560 --transform 90";
  };
in
{
  home.username = "brent";
  home.homeDirectory = lib.mkDefault "/home/brent";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  # include programs with configuration
  imports = [
    ../home/terminal/kitty.nix
    ../home/terminal/starship.nix
    ../home/terminal/zsh.nix
    { _module.args = { inherit aliases; }; }
    ../home/desktop/hyprland.nix
    ../home/desktop/waybar/laptop.nix
    ../home/desktop/kanshi/laptop.nix
  ];

  stylix.targets.vim.enable = false;
  stylix.targets.waybar.enable = false;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # dev
    git 
    lazygit
    # zsh

    stow
    #pkgs.unstable.distrobox

    # terminal programs
    starship
    eza
    fastfetch
    btop

    firefox
    bitwarden
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
    vesktop
    obsidian
    gnome.nautilus
    wl-clipboard
    kanshi

    wget
    zip
    unzip

    ags
    bun
    libnotify
    sass
    fd

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

  #programs.zsh.enable = true;

  # Install nvim as the default text editor
  programs.neovim = {
    enable = true;
    defaultEditor = true;	
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";
}
