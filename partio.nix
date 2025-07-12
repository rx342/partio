{
  system ? builtins.currentSystem,
  source ? import ./npins,
  pkgs ? import source.nixpkgs {
    overlays = [ ];
    config = { };
    inherit system;
  },
  wrapper-manager ? import source.wrapper-manager,
  nvim-rx ? import source.nvim-rx { inherit system; },
}:

let
  wrapped-packages =
    (wrapper-manager.lib {
      inherit pkgs;
      modules = [
        ./packages/htop/default.nix
        ./packages/bat/default.nix
        ./packages/zk/default.nix
        ./packages/eza/default.nix
        ./packages/git/default.nix
        ./packages/tmux/default.nix
      ];
    }).config.build.toplevel;

  fish-wrapped =
    (wrapper-manager.lib {
      inherit pkgs;
      modules = [
        ./packages/fish/default.nix
      ];
    }).config.wrappers.fish.wrapped;
in
wrapper-manager.lib.wrapWith pkgs {
  basePackage = fish-wrapped;
  pathAdd = with pkgs; [
    wrapped-packages
    nvim-rx.nvim
    nix-output-monitor
    just
    npins
    fzf
    fd
    ripgrep
    zoxide
    direnv
    yazi
  ];
}
