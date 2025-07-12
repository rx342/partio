{ pkgs, ... }:

{
  wrappers.translate-shell = {
    basePackage = pkgs.translate-shell;
    env = {
      XDG_CONFIG_HOME = {
        value = ./.;
        force = true;
      };
    };
  };
}
