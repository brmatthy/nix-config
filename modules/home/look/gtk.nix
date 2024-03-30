{ lib, config, options, pkgs, theme, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "peach" ];
        size = "compact";
        tweaks = [ "rimless" "normal" "float" ];
        variant = if (theme.polarity == "light") then "latte" else "frappe";
      };
    };
  };
}
