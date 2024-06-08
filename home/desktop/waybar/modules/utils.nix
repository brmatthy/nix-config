{...}:
{
  programs.waybar.settings."mainbar"."utils" = {
    orientation = "inherit";
    drawer = {
      transition-duration = 500;
      transition-left-to-right = false;
    };
    modules = [
      "custom/tool"
      "custom/hyprkill"
    ];
  };


  programs.waybar.settings."mainbar"."custom/tool" = {
    format = "";
    tooltip = false;
  };

  programs.waybar.settings."mainbar"."custom/hyprkill" = {
    format = "{}";
    interval = "once";
    exec = "echo '󰅙\nKill clients using hyrpctl kill'";
    on-click = "sleep 1 && hyprctl kill";
  };


}
