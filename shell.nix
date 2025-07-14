{
  system ? builtins.currentSystem,
  source ? import ./npins,
  pkgs ? import source.nixpkgs {
    overlays = [ ];
    config = { };
    inherit system;
  },
}:

pkgs.mkShellNoCC {
  packages = with pkgs; [
    caligula
    just
    qemu
  ];
}
