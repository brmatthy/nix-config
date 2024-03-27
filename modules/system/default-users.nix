# takes a list of usernames
# creates a user for each username
{ lib, config, options, pkgs, usernames, ... }:
let
  createUser = username: {
    "${username}" = {
      isNormalUser = true;
      description = username;
      extraGroups = [ "networkmanager" "wheel" "audio" ];
      packages = with pkgs; [];
    };
  };

  userAccounts = builtins.listToAttrs (map createUser usernames);
in
{
  users.users = userAccounts;
}
