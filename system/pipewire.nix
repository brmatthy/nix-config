{ pkgs, ... }:
{
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  # install pipewire with pulseaudio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # install aditional audio packages
  environment.systemPackages = with pkgs; [
    playerctl
    pavucontrol
  ];
}
