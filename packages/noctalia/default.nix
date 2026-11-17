{ pkgs, lib, ... }:

let
  noctalia = import (import ../../npins).noctalia { inherit pkgs; };
in
{
  wrappers.noctalia = {
    basePackage = noctalia.package;
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
