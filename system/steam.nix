{ pkgs, ... }: 
{
  programs.steam.enable = true;
  programs.steam.gamescopeSession = true;

  environment.systemPackages = with pkgs; [
    mangohud
  ];

  programs.gamemode.enable = true;

}

