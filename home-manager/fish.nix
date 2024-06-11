{ pkgs }:

{
  enable = true;

  functions = {
    hs = "home-manager switch --flake $argv";
    gitignore = "curl -sL https://www.gitignore.io/api/$argv";
  };

  interactiveShellInit = ''
    echo "Hello, world!"
    fish_add_path $HOME/.cargo/bin
    fish_add_path $HOME/.dotnet/bin
  '';

  plugins = [
    {
      name = "nix-env.fish";
      src = pkgs.fetchFromGitHub {
        owner = "lilyball";
        repo = "nix-env.fish";
        rev = "7b65bd228429e852c8fdfa07601159130a818cfa";
        sha256 = "RG/0rfhgq6aEKNZ0XwIqOaZ6K5S4+/Y5EEMnIdtfPhk=";
      };
    }
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
}
