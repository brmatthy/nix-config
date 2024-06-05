{ pkgs, ... }:
{
  stylix.image = ./nixos-dark.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Original-Amber";
  stylix.cursor.size = 20;

  environment.systemPackages = [(
    pkgs.catppuccin-sddm.override {
      flavor = "frappe";
    }
  )];

  services.displayManager.sddm = {
    theme = "catppuccin-frappe";
  };
}
