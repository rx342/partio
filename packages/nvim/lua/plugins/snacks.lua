return {
  "snacks.nvim",
  lazy = false,
  priority = 1000,
  after = function()
    require("snacks").setup({
      styles = {},
      bigfile = { enabled = false },
      dashboard = { enabled = false },
      explorer = { enabled = false },
      indent = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
      picker = { enabled = true },
      git = { enabled = true },
      toggle = { enabled = true },
    })
  end,
  keys = {
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line()
      end,
      desc = "[G]it [B]lame Line",
    },
    {
      "<leader>u",
      function()
        Snacks.picker.undo()
      end,
      desc = "[U]ndo tree",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files({ cmd = "fd" })
      end,
      desc = "[F]ZF [F]iles",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "[F]ZF [G]it Files",
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "[F]ZF [B]uffers",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.grep({ cmd = "rg" })
      end,
      desc = "[F]ZF [R]ipgrep",
    },
    {
      "<leader>fh",
      function()
        Snacks.picker.help()
      end,
      desc = "[F]ZF [H]elp",
    },
    {
      "q:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "command history",
    },
    {
      "q/",
      function()
        Snacks.picker.search_history()
      end,
      desc = "search history",
    },
  },
}
