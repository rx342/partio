return {
  "mini.diff",
  after = function()
    require("mini.diff").setup({
      view = {
        style = "sign",
        signs = { add = "▎", change = "▎", delete = "▎" },
        mappings = {
          apply = "",
          reset = "",
          textobject = "",
          goto_first = "",
          goto_prev = "",
          goto_next = "",
          goto_last = "",
        },
      },
    })
  end,
}
