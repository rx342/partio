{ pkgs, ... }:

{
  wrappers.eza = {
    basePackage = pkgs.eza;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    prependFlags = [
      "--group"
      "--icons"
      "auto"
    ];
  };
}
