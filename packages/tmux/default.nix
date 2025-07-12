{ pkgs, lib, ... }:

let
  plugins = with pkgs.tmuxPlugins; [
    yank
    copycat
  ];
  run-plugins = map (plugin: "run-shell ${plugin.rtp}") plugins;
in
{
  wrappers.tmux = {
    basePackage = pkgs.tmux;
    prependFlags = [
      "-f"
      (pkgs.writeText "tmux-conf" ''
        set -g default-shell "${pkgs.fish}/bin/fish"
        run-shell ${pkgs.tmuxPlugins.sensible.rtp}

        source-file ${./tmux.conf}

        ${lib.concatStringsSep "\n" run-plugins}
      '')
    ];
    pathAdd = [
      (pkgs.callPackage ./fuzzy-switch/default.nix { })
    ];
  };
}
