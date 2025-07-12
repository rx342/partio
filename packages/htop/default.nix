{ pkgs, ... }:

{
  wrappers.htop = {
    basePackage = pkgs.htop;
    env = {
      HTOPRC.value = ./htoprc;
    };
  };
}
