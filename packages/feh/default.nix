{ pkgs, ... }:

{
  wrappers.feh = {
    basePackage = pkgs.feh;
    env = {
      XDG_CONFIG_HOME = {
        value = ./.;
        force = true;
      };
    };
  };
}
