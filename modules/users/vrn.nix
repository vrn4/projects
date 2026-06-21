{ config, lib, pkgs, ... }:

{
  users.users.vrn = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
  };
  
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
