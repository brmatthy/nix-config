{config, lib, ...}:
{
  programs.waybar.style = lib.mkAfter
  ''
    /* Define the colors used */
    @define-color base #${config.lib.stylix.colors.base00};
    @define-color mantle #${config.lib.stylix.colors.base01};
    @define-color surface0 #${config.lib.stylix.colors.base02};
    @define-color surface1 #${config.lib.stylix.colors.base03};
    @define-color surface2 #${config.lib.stylix.colors.base04};
    @define-color text #${config.lib.stylix.colors.base05};
    @define-color rosewater #${config.lib.stylix.colors.base06};
    @define-color lavender #${config.lib.stylix.colors.base07};
    @define-color red #${config.lib.stylix.colors.base08};
    @define-color peach #${config.lib.stylix.colors.base0A}; /*I use peach as main colour*/
    @define-color yellow #${config.lib.stylix.colors.base09};
    @define-color green #${config.lib.stylix.colors.base0B};
    @define-color teal #${config.lib.stylix.colors.base0C};
    @define-color blue #${config.lib.stylix.colors.base0D};
    @define-color mauve #${config.lib.stylix.colors.base0E};
    @define-color flamingo #${config.lib.stylix.colors.base0F};
  '';
}
