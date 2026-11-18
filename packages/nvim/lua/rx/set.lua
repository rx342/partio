vim.opt.hidden = true
vim.opt.encoding = "UTF-8"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.autoread = true
vim.opt.hlsearch = true
vim.opt.backspace = "indent,eol,start"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.breakindent = true
-- Hide tab bar
vim.opt.showtabline = 0
vim.opt.expandtab = true
vim.opt.listchars =
  "tab:→ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨"
vim.opt.list = true
vim.opt.ttyfast = true
vim.opt.regexpengine = 1
vim.opt.timeoutlen = 500
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildignorecase = true
vim.opt.errorbells = false
vim.opt.conceallevel = 0
-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"
-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"
-- Decrease update time
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
-- fish might slow startup
vim.opt.shell = "bash"

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.g.clipboard = "osc52"
end)

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.laststatus = 3
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable bold font
vim.g.enable_bold_font = 1

if vim.fn.has("persistent_undo") == 1 then
  local path = vim.fn.stdpath("state") .. "/undo"
  vim.fn.mkdir(path, "p")
  vim.opt.undofile = true
  vim.opt.undodir = path
end

-- Comments in italic
vim.api.nvim_set_hl(0, "Comment", { italic = true })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup(
    "kickstart-highlight-yank",
    { clear = true }
  ),
  callback = function()
    vim.hl.on_yank()
    local copy_to_unnamedplus = require("vim.ui.clipboard.osc52").copy("+")
    copy_to_unnamedplus(vim.v.event.regcontents)
    local copy_to_unnamed = require("vim.ui.clipboard.osc52").copy("*")
    copy_to_unnamed(vim.v.event.regcontents)
  end,
})

-- project config
vim.opt.exrc = true
vim.opt.secure = true
