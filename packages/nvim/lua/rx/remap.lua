vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "H", "^", { noremap = true, silent = true })
vim.keymap.set("n", "L", "$", { noremap = true, silent = true })
vim.keymap.set("n", "U", "<C-R>", { noremap = true, silent = true })
vim.keymap.set("c", "%s/", "%s/\\v", { noremap = true })
vim.keymap.set(
  "t",
  "<esc><esc>",
  "<C-\\><C-n>",
  { noremap = true, silent = true }
)

-- Move block of lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Stay at the beginning of line when doing `J`
vim.keymap.set("n", "J", "mzJ`z")
-- Keep the cursor in the middle when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Keep the cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Keep the cursor in the middle when going to the end
vim.keymap.set("n", "G", "Gzz")
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
