{pkgs, ...}:
{
  # Configure keymap in X11
  services.xserver = {
    layout = "be";
    xkbVariant = "wang";
  };

  # Configure console keymap
  console.keyMap = "be-latin1";
}
