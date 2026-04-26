{ pkgs, ... }:
{
  programs.go = {
    enable = true;
    package = pkgs.emptyDirectory;
    env.GOPATH = ".go";
  };
}
