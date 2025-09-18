{ pkgs, ... }:

{
  wrappers.rofi = {
    basePackage = pkgs.rofi;
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
