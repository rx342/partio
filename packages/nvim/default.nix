{
  system ? builtins.currentSystem,
  source ? import ../../npins,
  pkgs ? import source.nixpkgs {
    overlays = [ ];
    config = { };
    inherit system;
  },
  mnw ? import source.mnw,
}:

pkgs.callPackage ./packages/nvim.nix { inherit mnw; }
