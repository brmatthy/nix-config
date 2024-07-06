{ ... }:
{
  # symlink nvim
  xdg.enable = true;
  xdg.configFile = {
    "nvim" = {
      source = ../.config/nvim;
      recursive = true;
    };
  };
}
