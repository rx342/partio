{ pkgs, ... }:

{
  wrappers.swaylock = {
    basePackage = pkgs.swaylock;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    prependFlags = [
      "--config"
      ./config
    ];
  };
}
