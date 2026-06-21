{ config, lib, pkgs, ... }:

{
  imports = [
    ./gpu.nix
    ./audio.nix
  ];
}
