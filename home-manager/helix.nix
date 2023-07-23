{ pkgs }:
{
  enable = true;
  
  languages = {
    language = [{
      name = "rust";
      auto-format = true;
    }];
  };
  settings = {
    editor = {
      true-color = true;
      lsp.display-messages = true;
    };
    keys.normal = {
      space.space = "file_picker";
      space.w = ":w";
      space.q = ":q";
    };
    theme = "catppuccin_mocha";
  };
}
