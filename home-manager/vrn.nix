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
    swww
    swaylock-effects
    mako
    grim
    wl-clipboard
    networkmanagerapplet
    brightnessctl
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    font-awesome
    dejavu_fonts    
    moto-fonts-emoji

  ];

  programs.git = {
    enable = true;
    userName = "vrn4";
    userEmail = "lokyas287@gmail.com";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

    xdg.configFile."niri/config.kdl".text = ''
    // Монитор (при необходимости раскомментируй и укажи свой)
    // output "eDP-1" { mode 1920x1080@60Hz; scale 1.0; }

    // Горячие клавиши
    binds {
        Mod+Return { spawn "alacritty"; }
        Mod+D { spawn "fuzzel"; }
        Mod+Q { close-window; }
        Mod+1 { focus-column 1; }
        Mod+2 { focus-column 2; }
        Mod+3 { focus-column 3; }
        Mod+4 { focus-column 4; }
        Mod+5 { focus-column 5; }
        Mod+6 { focus-column 6; }
        Mod+Shift+1 { move-to-column 1; }
        Mod+Shift+2 { move-to-column 2; }
        Mod+Shift+3 { move-to-column 3; }
        Mod+Shift+4 { move-to-column 4; }
        Mod+Shift+5 { move-to-column 5; }
        Mod+Shift+6 { move-to-column 6; }
        Mod+Left  { resize-width -50; }
        Mod+Right { resize-width 50; }
        Mod+Up    { resize-height -50; }
        Mod+Down  { resize-height 50; }
        Mod+Shift+Left  { move-left; }
        Mod+Shift+Right { move-right; }
        Mod+Shift+Up    { move-up; }
        Mod+Shift+Down  { move-down; }
        Mod+Escape { quit; }
    }

    // Автозапуск
    spawn-at-startup "waybar"
    spawn-at-startup "mako"
    // spawn-at-startup "swww init && sleep 1 && swww img ~/wallpapers/main.jpg"
  '';
   
     programs.home-manager.enable = true;
}
