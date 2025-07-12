{ pkgs, ... }:

{
  wrappers.sioyek = {
    basePackage = pkgs.sioyek;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    env = {
      XDG_CONFIG_HOME = {
        value = ./.;
        force = true;
      };
    };
  };
}
