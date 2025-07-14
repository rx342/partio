{ pkgs, ... }:

{
  wrappers.bat = {
    basePackage = pkgs.bat;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    env = {
      BAT_CONFIG_PATH.value = ./config;
    };
  };
}
