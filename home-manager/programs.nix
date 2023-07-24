{ pkgs }:

{
  # Enable home-manager and git
  home-manager.enable = true;
  git.enable = true;
  htop.enable = true;
  lazygit.enable = true;
  
  fish = {
    enable = true;

    plugins = [
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "85f863f20f24faf675827fb00f3a4e15c7838d76";
          sha256 = "+FUBM7CodtZrYKqU542fQD+ZDGrd2438trKM0tIESs0=";
        };
      }
      {
        name = "bass";
        src = pkgs.fetchFromGitHub {
          owner = "edc";
          repo = "bass";
          rev = "f3a547b0239cf8529d35c1922dd242bacf751d3b";
          sha256 = "3mFlFiqGfQ+GfNshwKfhQ39AuNMdt8Nv2Vgb7bBV7L4=";
        };
      }
    ];
  };

  zsh = {
    enable = true;
  };

  helix = import ./helix.nix { inherit pkgs; };
  
  starship = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = {
      shell = { disabled = false; };
    };
  };

  jq.enable = true;

  direnv = {
    enable = true;
    enableZshIntegration = true;

    nix-direnv.enable = true;
  };

  exa = {
    enable = true;
    enableAliases = true;
  };

  fzf = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
