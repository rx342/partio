return {
  "neogen",
  after = function()
    require("neogen").setup({
      enabled = true,
      snippet_engine = "luasnip",
      languages = {
        python = {
          template = {
            annotation_convention = "numpydoc",
          },
        },
        cpp = {
          template = {
            annotation_convention = "doxygen",
          },
        },
      },
    })
  end,
  keys = {
    {
      "<leader>D",
      "<cmd>lua require('neogen').generate()<cr>",
      desc = "Add [D]oc",
    },
  },
}
