return {
  "todo-comments.nvim",
  after = function()
    require("todo-comments").setup({
      signs = false,
    })
  end,
}
