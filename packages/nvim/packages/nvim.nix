{
  pkgs,
  mnw,
  lib,
}:

mnw.lib.wrap pkgs {
  neovim = pkgs.neovim-unwrapped;
  aliases = [
    "vi"
    "vim"
  ];
  appName = "nvim-rx";
  desktopEntry = false;
  providers = {
    python3.enable = true;
    nodeJs.enable = true;
  };
  extraLuaPackages =
    ps: with ps; [
      jsregexp
    ];
  extraBinPath = with pkgs; [
    fd
    ripgrep
    bat
    shellcheck
    basedpyright
    bash-language-server
    prettierd
    neovim-remote
    lua-language-server
    nixd
    nixfmt
    ruff
    isort
    shfmt
    stylua
    marksman
    yarn # markdown-preview
    nufmt
    imagemagick
  ];
  plugins = {
    start =
      (with pkgs.vimPlugins; [
        blink-cmp
        (nvim-treesitter.withPlugins (
          p: with p; [
            tree-sitter-nix
            tree-sitter-python
            tree-sitter-bash
            tree-sitter-lua
            tree-sitter-vim
            tree-sitter-just
            tree-sitter-markdown
            tree-sitter-markdown-inline
            tree-sitter-cpp
            tree-sitter-nu
            tree-sitter-haskell
          ]
        ))
      ])
      ++ mnw.lib.npinsToPlugins pkgs ./start.json;
    opt =
      (with pkgs.vimPlugins; [
        markdown-preview-nvim
      ])
      ++ mnw.lib.npinsToPlugins pkgs ./opt.json;
    dev.rx = {
      pure = lib.fileset.toSource {
        root = ./..;
        fileset = lib.fileset.unions [
          ../lua
          ../after
        ];
      };
    };
  };
  initLua = # lua
    ''
      require("rx")
      require("lz.n").load("plugins")
      require("rx.colors")

      snippet_dir = "${../lua/custom/snippets}"
    '';
}
