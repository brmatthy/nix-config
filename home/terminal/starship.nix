{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$os$directory
$character
"; # this cannot be indented, since it will indent the prompt
      right_format = "$all";

      character = {
        success_symbol = "[](green)";
        error_symbol = "[](red)";
        vimcmd_symbol = "[](green)";
      };

      os = {
        disabled = false;
        symbols = {
          NixOS = "[](blue) ";
        };
      };

      git_branch = {
        symbol = " ";
        format = "[$symbol$branch(:$remote_branch)]($style)";
      };

      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
        modified = "*";
      };
    };
  };
}
