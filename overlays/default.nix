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
        ../packages/yt-dlp/default.nix
        ../packages/feh/default.nix
        ../packages/translate-shell/default.nix
        ../packages/wezterm/default.nix
        ../packages/ghostty/default.nix
        ../packages/rofi/default.nix
        ../packages/waybar/default.nix
        ../packages/swaylock/default.nix
        ../packages/dunst/default.nix
        ../packages/fcitx5/default.nix
        ../packages/sway/default.nix
        ../packages/niri/default.nix
        ../packages/swaync/default.nix
      ];
    };
in
final: prev:
let
  wrapped-with-pkgs = wrapped prev;
  inherit (prev) lib;
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
    yt-dlp = wrapped-with-pkgs.config.wrappers.yt-dlp.wrapped;
    feh = wrapped-with-pkgs.config.wrappers.feh.wrapped;
    translate-shell = wrapped-with-pkgs.config.wrappers.translate-shell.wrapped;
    wezterm = (
      lib.warn "rx342.wezterm is unused and untested, might be removed at some point" wrapped-with-pkgs.config.wrappers.wezterm.wrapped
    );
    ghostty = wrapped-with-pkgs.config.wrappers.ghostty.wrapped;
    ghostty-small = (
      lib.warn "rx342.ghostty-small is unused and untested, might be removed at some point" wrapped-with-pkgs.config.wrappers.ghostty-small.wrapped
    );
    rofi = wrapped-with-pkgs.config.wrappers.rofi.wrapped;
    rofi-translate = prev.callPackage ../packages/rofi-translate/default.nix { };
    rofi-power-menu = prev.callPackage ../packages/rofi-power-menu/default.nix { };
    waybar = wrapped-with-pkgs.config.wrappers.waybar.wrapped;
    swaylock = wrapped-with-pkgs.config.wrappers.swaylock.wrapped;
    dunst = (
      lib.warn "rx342.dunst is unused and untested, might be removed at some point" wrapped-with-pkgs.config.wrappers.dunst.wrapped
    );
    fcitx5 = wrapped-with-pkgs.config.wrappers.fcitx5.wrapped;
    sway = (
      lib.warn "rx342.sway is unused and untested, might be removed at some point" wrapped-with-pkgs.config.wrappers.sway.wrapped
    );
    niri = wrapped-with-pkgs.config.wrappers.niri.wrapped;
    swayfx = (
      lib.warn "rx342.swayfx is unused and untested, might be removed at some point" wrapped-with-pkgs.config.wrappers.swayfx.wrapped
    );
    swaynotificationcenter = wrapped-with-pkgs.config.wrappers.swaynotificationcenter.wrapped;
    realise-symlink = prev.callPackage ../packages/realise-symlink/default.nix { };
    neovim = import ../packages/nvim/default.nix { inherit (prev) system; };
    apple-music = prev.callPackage ../packages/apple-music/default.nix { };
    yazi = prev.callPackage ../packages/yazi/default.nix { };
  };
}
