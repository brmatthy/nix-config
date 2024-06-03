{ pkgs, ... }:
{
  stylix.image = ./nixos-light.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Original-Amber";
  stylix.cursor.size = 20;

}
