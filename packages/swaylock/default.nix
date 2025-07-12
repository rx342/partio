{ pkgs, ... }:

{
  wrappers.swaylock = {
    basePackage = pkgs.swaylock-effects;
    prependFlags = [
      "--config"
      ./config
    ];
  };
}
