{
  system ? builtins.currentSystem,
  source ? import ./npins,
  pkgs ? import source.nixpkgs {
    overlays = [ (import ./overlays/default.nix) ];
    config = { };
    inherit system;
  },
  wrapper-manager ? import source.wrapper-manager,
}:

wrapper-manager.lib.wrapWith pkgs {
  basePackage = pkgs.rx342.fish;
  overrideAttrs = old: {
    pname = "partio";
  };
  pathAdd = with pkgs; [
    rx342.htop
    rx342.bat
    rx342.eza
    rx342.git
    rx342.tmux
    rx342.neovim
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
