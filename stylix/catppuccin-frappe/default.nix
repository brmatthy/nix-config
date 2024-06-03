{ pkgs, ... }:
{
  stylix.image = ./nixos-dark.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Amber-Right";
  stylix.cursor.size = 20;

}
