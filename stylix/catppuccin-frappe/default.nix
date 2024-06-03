{ pkgs, ... }:
{
  stylix.image = ./nixos-dark.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";

  stylix.cursor.package = pkgs.catppuccin-cursors.frappePeach;
  #stylix.cursor.name = "";
  stylix.cursor.size = 24;

}
