{
  system ? builtins.currentSystem,
  source ? import ../npins,
  pkgs ? import source.nixpkgs {
    overlays = [ (import ../overlays/default.nix) ];
    config = {
      allowUnfree = true;
    };
    inherit system;
  },
}:

builtins.attrValues pkgs.rx342
