{ ... }:
{
  programs.git = {
    enable = true;
    userName = "brmatthy";
    userEmail = "109791839+brmatthy@users.noreply.github.com";
    extraConfig = {
      push = {
        autoSetupRemote = true;
      };
      pull = {
        rebase = false;
      };
    };
  };
}
