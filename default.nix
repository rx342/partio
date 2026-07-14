{
  system ? builtins.currentSystem,
  source ? import ./npins,
  pkgs ? import source.nixpkgs {
    overlays = [ ];
    config = { };
    inherit system;
  },
  wrapper-manager ? import source.wrapper-manager,
}:

pkgs.lib.makeScope pkgs.newScope (final: {
  partio =
    let
      pkgs' = pkgs.extend final.overlays.default;
    in
    wrapper-manager.lib.wrapWith pkgs' {
      basePackage = pkgs'.rx342.fish;
      overrideAttrs = old: {
        pname = "partio";
      };
      pathAdd = with pkgs'; [
        rx342.htop
        rx342.bat
        rx342.git
        rx342.eza
        rx342.tmux
        rx342.neovim
        rx342.yazi
        nix-output-monitor
        just
        npins
        fd
        ripgrep
        zoxide
        nushell
        direnv
      ];
    };
  overlays = {
    default = import ./overlays/default.nix;
  };
  shell = pkgs.mkShellNoCC {
    packages = with pkgs; [
      caligula
      just
      qemu
    ];
  };
})
