{ pkgs, ... }:

{
  wrappers.rofi-wayland = {
    basePackage = pkgs.rofi-wayland;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    prependFlags = [
      "-config"
      ./config.rasi
      "-theme"
      ./themes/tokyonight.rasi
    ];
  };
}
