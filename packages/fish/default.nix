{ pkgs, lib, ... }:

let
  vendorConf = "share/fish/vendor_conf.d";
  loadPlugin = pkgs.writeTextDir "${vendorConf}/rx_plugin.fish" (
    builtins.readFile ./functions/fish_load_plugin.fish
  );
  loadSessionizer = pkgs.writeTextDir "${vendorConf}/rx_sessionizer.fish" (
    builtins.readFile ./functions/fish_tmux_sessionizer.fish
  );
  loadTmpSessionizer = pkgs.writeTextDir "${vendorConf}/rx_tmp_sessionizer.fish" (
    builtins.readFile ./functions/fish_tmux_tmp_dir.fish
  );
  loadKeybinds = pkgs.writeTextDir "${vendorConf}/rx_keybinds.fish" (
    builtins.readFile ./functions/fish_user_key_bindings.fish
  );
  loadColors = pkgs.writeTextDir "${vendorConf}/rx_colors.fish" (
    builtins.readFile ./colors/tokyonight.fish
  );
  config =
    pkgs.writeTextDir "${vendorConf}/rx_config.fish"
      # fish
      ''
        if status is-interactive
          set -gx fish_greeting

          ${lib.concatStringsSep "\n" (
            map (plugin: "rx_load_plugin ${plugin}") (
              with pkgs.fishPlugins;
              [
                autopair
              ]
            )
          )}

          source ${./interactive.fish}
          source ${./env.fish}
          source ${./aliases.fish}
          source ${./ssh-agent.fish}

          fzf --fish | source

          set -gx STARSHIP_CONFIG ${../starship/starship.toml}
          starship init fish | source
        end
      '';
in
{
  wrappers.fish = {
    basePackage = pkgs.fish;
    overrideAttrs = old: {
      pname = "${old.pname}-rx342";
    };
    programs.fish = {
      wrapFlags = [
        "--prefix"
        "XDG_DATA_DIRS"
        ":"
        (lib.makeSearchPathOutput "out" "share" [
          loadPlugin
          loadSessionizer
          loadTmpSessionizer
          loadKeybinds
          loadColors
          config
        ])
      ];
      pathAdd = [
        (pkgs.callPackage ../tmux/sessionizer/default.nix { })
        pkgs.starship
        pkgs.fzf
      ];
    };
  };
}
