{ pkgs }:

{
  # Enable home-manager and git
  home-manager.enable = true;
  git.enable = true;
  htop.enable = true;
  lazygit.enable = true;

  fish = import ./fish.nix { inherit pkgs; };  

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

  fzf = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
