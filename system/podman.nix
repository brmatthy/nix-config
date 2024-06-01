{ pkgs, ... }:
{
  # Container manager like docker
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # Useful otherdevelopment tools
  environment.systemPackages = with pkgs; [
    podman-tui # status of containers in the terminal
    podman-compose # start group of containers for dev
  ];
