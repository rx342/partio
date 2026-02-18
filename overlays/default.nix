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
        ../packages/ghostty/default.nix
        ../packages/waybar/default.nix
        ../packages/swaylock/default.nix
        ../packages/fcitx5/default.nix
        ../packages/niri/default.nix
        ../packages/swaync/default.nix
      ];
    };
in
final: prev:
let
  wrapped-with-pkgs = wrapped prev;
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
    ghostty = wrapped-with-pkgs.config.wrappers.ghostty.wrapped;
    waybar = wrapped-with-pkgs.config.wrappers.waybar.wrapped;
    swaylock = wrapped-with-pkgs.config.wrappers.swaylock.wrapped;
    fcitx5 = wrapped-with-pkgs.config.wrappers.fcitx5.wrapped;
    niri = wrapped-with-pkgs.config.wrappers.niri.wrapped;
    swaynotificationcenter = wrapped-with-pkgs.config.wrappers.swaynotificationcenter.wrapped;
    realise-symlink = prev.callPackage ../packages/realise-symlink/default.nix { };
    neovim = import ../packages/nvim/default.nix { inherit (prev.stdenv.hostPlatform) system; };
    apple-music = prev.callPackage ../packages/apple-music/default.nix { };
    yazi = prev.callPackage ../packages/yazi/default.nix { };
  };
}
