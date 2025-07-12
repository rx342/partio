{ pkgs, ... }:

{
  wrappers.rofi-wayland = {
    basePackage = pkgs.rofi-wayland;
    prependFlags = [
      "-config"
      ./config.rasi
      "-theme"
      ./themes/tokyonight.rasi
    ];
  };
}
