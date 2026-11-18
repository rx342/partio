return {
  "nvim-treesitter",
  after = function()
    require("nvim-treesitter").setup()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "nix",
        "python",
        "bash",
        "lua",
        "vim",
        "just",
        "markdown",
        "cpp",
        "nu",
        "haskell",
      },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
