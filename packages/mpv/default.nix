{ pkgs, ... }:

{
  wrappers.mpv = {
    basePackage = pkgs.mpv;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    prependFlags = [
      "--config-dir=${./config}"
    ];
  };
}
