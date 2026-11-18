return {
  "mini.statusline",
  after = function()
    vim.opt.laststatus = 3
    require("mini.statusline").setup({ set_vim_settings = false })
  end,
}
