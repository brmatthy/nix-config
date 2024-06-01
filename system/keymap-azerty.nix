{pkgs, ...}:
{
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "be";
    variant = "wang";
  };

  # Configure console keymap
  console.keyMap = "be-latin1";
}
