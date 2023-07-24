{ pkgs, ... }:

{
  programs = import ./programs.nix { inherit pkgs; };
  xdg.configFile."fish/completions/nix.fish".source = "${pkgs.nix}/share/fish/vendor_completions.d/nix.fish";
}
