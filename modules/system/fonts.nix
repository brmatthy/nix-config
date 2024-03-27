{ lib, config, options, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    roboto
    (nerdfonts.override {fonts = ["JetBrainsMono" "RobotMono"];})
  ];
}
