{ config, lib, pkgs, ... }:

{
  security = {
    sudo.enable = true;
    sudo.wheelNeedsPassword = false;
    protectKernelImage = true;
    allowSimultaneousMultithreading = true;
  };
  
  networking.firewall = {
    enable = true;
  };
}
