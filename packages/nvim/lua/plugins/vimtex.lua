return {
  "vimtex",
  after = function()
    vim.g.vimtex_callback_progpath = vim.fn.exepath("nvim")
    vim.g.vimtex_view_method = "sioyek"
    vim.g.vimtex_syntax_conceal_disable = 1
    vim.g.vim_markdown_conceal = 0
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_complete_enabled = 0
    vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1
        and "pplatex"
      or "latexlog"
  end,
}
