return {
  {
    "catppuccin-nvim",
    after = function()
      require("catppuccin").setup({
        lsp_styles = {
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        integrations = {
          gitsigns = true,
          mini = true,
          neogit = true,
          cmp = true,
          snacks = {
            enabled = false,
            indent_scope_color = "lavender",
          },
          markdown = true,
          harpoon = true,
          notify = true,
          treesitter_context = true,
          treesitter = true,
          ts_rainbow2 = true,
          which_key = true,
        },
      })
    end,
  },
  {
    "tokyonight.nvim",
  },
}
