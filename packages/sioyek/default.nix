{ pkgs, ... }:

{
  wrappers.sioyek = {
    basePackage = pkgs.sioyek;
    env = {
      XDG_CONFIG_HOME = {
        value = ./.;
        force = true;
      };
    };
  };
}
