{ pkgs, ... }:

{
  wrappers.bat = {
    basePackage = pkgs.bat;
    env = {
      BAT_CONFIG_PATH.value = ./config;
    };
  };
}
