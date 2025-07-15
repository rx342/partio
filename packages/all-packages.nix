{
  system ? builtins.currentSystem,
  source ? import ../npins,
  pkgs ? import source.nixpkgs {
    overlays = [ (import ../overlays/default.nix) ];
    config = { };
    inherit system;
  },
}:

builtins.attrValues pkgs.rx342
