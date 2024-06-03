{ config, pkgs, lib, ... }:

{
  home.username = "brent";
  home.homeDirectory = lib.mkDefault "/home/brent";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
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
    vesktop
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

  programs.zsh.enable = true;

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

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
