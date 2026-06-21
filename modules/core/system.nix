{ config, lib, pkgs, ... }:

{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
  
  documentation = {
    enable = true;
    man.enable = true;
    dev.enable = true;
  };
  
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };
}
