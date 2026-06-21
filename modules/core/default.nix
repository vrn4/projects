{ config, lib, pkgs, ... }:

{
  imports = [
    ./locale.nix
    ./system.nix
    ./security.nix
  ];
}
