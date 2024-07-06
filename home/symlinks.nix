{ ... }:
{
  # symlink nvim
  xdg.enable = true;
  xdg.configFile = {
    "nvim" = {
      source = ~/nix-config/.config/nvim;
      recursive = true;
    };
  };
}
