{
  system ? builtins.currentSystem,
  source ? import ../../npins,
  lix ? import source.lix,
}:

lix.packages.${system}.default
