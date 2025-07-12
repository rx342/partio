{ pkgs, ... }:

{
  wrappers.eza = {
    basePackage = pkgs.eza;
    prependFlags = [
      "--icons"
      "auto"
    ];
  };
}
