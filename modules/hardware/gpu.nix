{ config, lib, pkgs, ... }:

{
  # Поддержка OpenGL
	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};
	services.xserver.videoDrivers = [ "nvidia" ];
        hardware.nvidia = {
                modesetting.enable = true;
                open = false;
                nvidiaSettings = true;
                powerManagement.enable = true;
        };
 
   
  # Для гибридной графики (если есть)
  # Если у тебя только AMD - закомментируй блок ниже
  /*
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  */
}
