# used to place shared libraries in their proper location

{pkgs, ...}:
{
  # enable nix-ld for pip and friends
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib # numpy
    # needed for some python packages
    libgcc 
    libglvnd
    glibc
  ];
}
