{ config, pkgs, ... }:

{
  home.username = "vrn";
  home.homeDirectory = "/home/vrn";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    fastfetch
    steam
    google-chrome
    discord
    spotify
    neovim
    libreoffice-fresh
    fuzzel
    waybar
    tree
    awww
    swaylock-effects
    mako
    grim
    wl-clipboard
    networkmanagerapplet
    brightnessctl
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    font-awesome
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "vrn4";
      user.email = "lokyas287@gmail.com";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  programs.home-manager.enable = true;
}
