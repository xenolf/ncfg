{ pkgs }:

{
  enable = true;

  functions = {
    hs = "home-manager switch --flake $argv";
    gitignore = "curl -sL https://www.gitignore.io/api/$argv";
  };

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
}
