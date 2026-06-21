{ config, lib, pkgs, ... }:

{
  # Поддержка OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  
  # Для AMD (radeon/amdgpu)
  hardware.amdgpu = {
    enable = true;
    opencl = {
      enable = true;
      icd = true;
    };
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
