{ lib, config, options, pkgs, layout, xkbVariant, consoleKeymap, ... }:
{
  services.xserver = {
    layout = "be";
    xkbVariant = "wang";
  };
  console.keyMap = "be-latin1";
}
