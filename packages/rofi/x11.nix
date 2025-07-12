{ pkgs, ... }:

{
  wrappers.rofi = {
    basePackage = pkgs.rofi;
    prependFlags = [
      "-config"
      ./config.rasi
      "-theme"
      ./themes/tokyonight.rasi
    ];
  };
}
