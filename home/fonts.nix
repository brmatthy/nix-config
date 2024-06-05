{pkgs, config, ...}:
{
  # set fonts
  stylix.fonts = {
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };

    # only use sans serif fonts
    serif = config.stylix.fonts.sansSerif;

    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };

    sizes = {
      applications = 11;
      terminal = 11;
    };
  };
}
