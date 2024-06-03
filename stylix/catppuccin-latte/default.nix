{ pkgs, ... }:
{
  stylix.image = ./nixos-light.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";

  stylix.cursor.package = pkgs.catppuccin-cursors;
  stylix.cursor.name = "lattePeach";
  stylix.cursor.size = 24;

}
