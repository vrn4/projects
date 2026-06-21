{ config, lib, pkgs, ... }:

{
  # PipeWire (современный звук)
  security.rtkit.enable = true;
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  
  # Для старых приложений (если нужно)
  hardware.pulseaudio.enable = false;
}
