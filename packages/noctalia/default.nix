{ pkgs, lib, ... }:

{
  wrappers.noctalia = {
    basePackage = pkgs.noctalia;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    env = {
      NOCTALIA_CONFIG_HOME = {
        value = lib.fileset.toSource {
          root = ./..;
          fileset = lib.fileset.unions [
            ../noctalia
          ];
        };
      };
    };
  };
}
