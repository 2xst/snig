{ ... }:
{
  programs.git = {
    enable = true;
    signing = {
      key = null;
      signByDefault = true;
      format = "openpgp";
    };
    settings = {
      core.editor = "nvim";
      pull = {
        ff = "only";
      };
      init.defaultBranch = "main";
      format.pretty = "oneline";
    };
  };
}
