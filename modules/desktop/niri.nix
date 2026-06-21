{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.my.desktop.niri;
in {
  options.my.desktop.niri = {
    enable = lib.mkEnableOption "Niri compositor";
    
    package = lib.mkPackageOption pkgs "niri" {
      default = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri;
    };
    
    extraConfig = lib.mkOption {
      type = lib.types.lines;
      default = "";
      description = "Дополнительная конфигурация Niri";
    };
  };

  config = lib.mkIf cfg.enable {
    services.xserver.enable = false;
    
    hardware.opengl = {
      enable = true;
      driSupport = true;
    };
    
    environment.systemPackages = [
      cfg.package
      
      (pkgs.writeShellScriptBin "niri-session" ''
        export XDG_SESSION_TYPE=wayland
        export XDG_CURRENT_DESKTOP=niri
        export WAYLAND_DISPLAY=wayland-0
        exec ${cfg.package}/bin/niri ${lib.optionalString (cfg.extraConfig != "") "--config ${pkgs.writeText "niri-config" cfg.extraConfig}"}
      '')
    ];
    
    services.displayManager.sessionPackages = [
      (pkgs.makeDesktopItem {
        name = "niri";
        desktopName = "Niri";
        comment = "Scrollable-tiling Wayland compositor";
        exec = "niri-session";
        type = "Application";
        categories = [ "System" ];
      })
    ];
    
    environment.variables = {
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "niri";
    };
  };
}
