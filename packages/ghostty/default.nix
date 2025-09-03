{ pkgs, ... }:

{
  wrappers.ghostty = {
    basePackage = pkgs.ghostty;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    prependFlags = [
      "--config-file=${./config}"
    ];
  };

  wrappers.ghostty-small = {
    basePackage = pkgs.ghostty;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    prependFlags = [
      "--config-file=${./config-small}"
    ];
  };
}
