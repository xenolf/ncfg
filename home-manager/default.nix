{ pkgs, ... }:

{
  programs = import ./programs.nix { inherit pkgs; };
}
