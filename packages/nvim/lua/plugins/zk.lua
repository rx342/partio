return {
  "zk-nvim",
  after = function()
    require("zk").setup({
      picker = "snacks_picker",
    })
  end,
  keys = {
    {
      "<leader>zn",
      "<cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<cr>",
      desc = "[Z]k [N]ew",
    },
    {
      "<leader>zl",
      "<cmd>ZkLinks<cr>",
      desc = "[Z]k Open [L]inks",
    },
    {
      "<leader>zb",
      "<cmd>ZkBacklinks<cr>",
      desc = "[Z]k Open [B]acklinks",
    },
    {
      "<leader>zi",
      "<cmd>ZkInsertLink<cr>",
      desc = "[Z]k [I]nsert Links",
    },
    {
      "<leader>zo",
      "<cmd>ZkNotes { sort = { 'modified' } }<cr>",
      desc = "[Z]k [O]pen",
    },
    {
      "<leader>zt",
      "<cmd>ZkTags<cr>",
      desc = "[Z]k Open [T]ags",
    },
  },
}
