{ pkgs, ... }:

{
  wrappers.htop = {
    basePackage = pkgs.htop;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    env = {
      HTOPRC.value = ./htoprc;
    };
  };
}
