{ pkgs, ... }:

{
  wrappers.translate-shell = {
    basePackage = pkgs.translate-shell;
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
