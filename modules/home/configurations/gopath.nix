{ config, pkgs, ... }:
{
  programs.go = {
    enable = true;
    package = pkgs.emptyDirectory;
    env.GOPATH = "${config.home.homeDirectory}/.go";
  };
}
