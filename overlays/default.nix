let
  source = import ../npins;
  wrapper-manager = import source.wrapper-manager;
  wrapped =
    pkgs:
    wrapper-manager.lib {
      inherit pkgs;
      modules = [
        ../packages/htop/default.nix
        ../packages/bat/default.nix
        ../packages/zk/default.nix
        ../packages/eza/default.nix
        ../packages/git/default.nix
        ../packages/tmux/default.nix
        ../packages/fish/default.nix
        ../packages/sioyek/default.nix
        ../packages/mpv/default.nix
        ../packages/feh/default.nix
        ../packages/translate-shell/default.nix
        ../packages/wezterm/default.nix
        ../packages/polybar/default.nix
        ../packages/rofi/x11.nix
        ../packages/rofi/wayland.nix
        ../packages/waybar/default.nix
        ../packages/swaylock/default.nix
        ../packages/i3/default.nix
        ../packages/dunst/default.nix
      ];
    };
in
final: prev:
let
  wrapped-with-pkgs = wrapped prev;
  nvim-rx = import source.nvim-rx { inherit (prev) system; };
in
{
  rx342 = {
    htop = wrapped-with-pkgs.config.wrappers.htop.wrapped;
    bat = wrapped-with-pkgs.config.wrappers.bat.wrapped;
    zk = wrapped-with-pkgs.config.wrappers.zk.wrapped;
    eza = wrapped-with-pkgs.config.wrappers.eza.wrapped;
    git = wrapped-with-pkgs.config.wrappers.git.wrapped;
    tmux = wrapped-with-pkgs.config.wrappers.tmux.wrapped;
    fish = wrapped-with-pkgs.config.wrappers.fish.wrapped;
    sioyek = wrapped-with-pkgs.config.wrappers.sioyek.wrapped;
    mpv = wrapped-with-pkgs.config.wrappers.mpv.wrapped;
    feh = wrapped-with-pkgs.config.wrappers.feh.wrapped;
    translate-shell = wrapped-with-pkgs.config.wrappers.translate-shell.wrapped;
    wezterm = wrapped-with-pkgs.config.wrappers.wezterm.wrapped;
    polybar = wrapped-with-pkgs.config.wrappers.polybar.wrapped;
    rofi = wrapped-with-pkgs.config.wrappers.rofi.wrapped;
    rofi-wayland = wrapped-with-pkgs.config.wrappers.rofi-wayland.wrapped;
    rofi-translate = prev.callPackage ../packages/rofi-translate/default.nix { };
    rofi-power-menu = prev.callPackage ../packages/rofi-power-menu/default.nix { };
    rofi-monitor = prev.callPackage ../packages/rofi-monitor/default.nix { };
    waybar = wrapped-with-pkgs.config.wrappers.waybar.wrapped;
    swaylock = wrapped-with-pkgs.config.wrappers.swaylock.wrapped;
    i3 = wrapped-with-pkgs.config.wrappers.i3.wrapped;
    dunst = wrapped-with-pkgs.config.wrappers.dunst.wrapped;
    neovim = nvim-rx.nvim;
  };
}
