{ lib, config, options, pkgs, ... }:
let
  theme = import ../../../modules/home/themes/frappe.nix;
in 
{
  home.stateVersion = "23.11";
  imports = [
    ../../../modules/home/hyprland.nix { # use hyprland as window manager
      _module.args = {
        inherit theme;
      };
    }
    #
    # ../../../modules/home/look/gtk.nix { # set gtk theme
    #   _module.args = {
    #     inherit theme;
    #   };
    # }
    #
    # ../../../modules/home/look/cursor.nix { # set cursor theme
    #   _module.args = {
    #     inherit theme;
    #   };
    # }
  ];

}
