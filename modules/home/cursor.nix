{ lib, config, options, pkgs, theme, ... }:
{
  gtk.cursorTheme = {
    package = if (theme.polarity == "light") then pkgs.catppuccin-cursors.lattePeach else pkgs.catppuccin-cursors.frappePeach;
    name = if (theme.polarity == "light") then "Catppuccin-Latte-Peach-Cursors" else "Catppuccin-Frappe-Peach-Cursors";
    size = 24;
  };
}
