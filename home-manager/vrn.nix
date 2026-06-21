{ config, pkgs, ... }:

{
  home.username = "vrn";
  home.homeDirectory = "/home/vrn";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    fastfetch
    git
    curl
    wget
  ];

  programs.git = {
    enable = true;
    userName = "vrn4";
    userEmail = "lokyas287@gmail.com";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
