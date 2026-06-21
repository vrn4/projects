{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware.nix
  ];

  # Имя хоста
  networking.hostName = "nixos-vrn";
  
  # Сеть
  networking.networkmanager.enable = true;
  
  # Загрузчик
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  
  # Включаем Niri
  my.desktop.niri.enable = true;
  
  # Базовая конфигурация Niri
  my.desktop.niri.extraConfig = ''
    binds {
      Mod { super }
      Mod+Shift { super shift }
      
      "Mod T" { spawn "alacritty"; }
      "Mod D" { spawn "fuzzel"; }
      "Mod Q" { close-window; }
      "Mod S" { spawn "firefox"; }
      
      "Mod 1" { focus-workspace 0; }
      "Mod 2" { focus-workspace 1; }
      "Mod 3" { focus-workspace 2; }
      "Mod 4" { focus-workspace 3; }
      
      "Mod Shift 1" { move-column-to-workspace 0; }
      "Mod Shift 2" { move-column-to-workspace 1; }
      "Mod Shift 3" { move-column-to-workspace 2; }
      "Mod Shift 4" { move-column-to-workspace 3; }
    }
    
    environment_variables {
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "niri";
    }
  '';
  
  # Системный уровень
  system.stateVersion = "24.11";
}
