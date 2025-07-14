{ pkgs, ... }:

{
  wrappers.polybar = {
    basePackage = pkgs.polybarFull;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    prependFlags = [
      "--config=${./config.ini}"
    ];
    pathAdd = [
      (pkgs.callPackage ../spotify-module/default.nix { })
    ];
  };
}
