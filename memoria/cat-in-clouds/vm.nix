{ config, ... }:

{
  virtualisation = {
    cores = 6;
    memorySize = 6 * 1024;
    resolution = {
      x = 1920;
      y = 1080;
    };
    diskImage = null;
    bootLoaderDevice = "/dev/vda";
    fileSystems."/".options = [ "mode=755" ];
    qemu.options = with config.virtualisation.resolution; [
      "-vga none"
      "-device qxl-vga,xres=${toString x},yres=${toString y}"
    ];
  };
}
