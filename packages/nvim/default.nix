{
  system ? builtins.currentSystem,
  source ? import ../../npins,
  nvim-rx ? import source.nvim-rx { inherit system; },
}:

nvim-rx.nvim
