return {
  "no-neck-pain.nvim",
  after = function()
    require("no-neck-pain").setup({
      autocmds = {
        enableOnVimEnter = true,
      },
    })
  end,
}
