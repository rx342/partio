{ pkgs, ... }:

{
  wrappers.polybar = {
    basePackage = pkgs.polybarFull;
    prependFlags = [
      "--config=${./config.ini}"
    ];
    pathAdd = [
      (pkgs.callPackage ../spotify-module/default.nix { })
    ];
  };
}
