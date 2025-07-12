{ pkgs, ... }:

{
  wrappers.mpv = {
    basePackage = pkgs.mpv;
    prependFlags = [
      "--config-dir=${./config}"
    ];
  };
}
