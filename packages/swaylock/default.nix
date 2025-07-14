{ pkgs, ... }:

{
  wrappers.swaylock = {
    basePackage = pkgs.swaylock-effects;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    prependFlags = [
      "--config"
      ./config
    ];
  };
}
