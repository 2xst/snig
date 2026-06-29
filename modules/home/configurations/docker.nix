{ pkgs, ... }:
{
  services.colima.enable = true;
  home.packages = with pkgs; [ docker ];
  programs.docker-cli.enable = true;
}
