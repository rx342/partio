return {
  "neogit",
  after = function()
    require("neogit").setup({
      disable_commit_confirmation = true,
      integrations = {
        snacks = true,
      },
      graph_style = "kitty",
    })
  end,
  keys = {
    { "<leader>gn", "<cmd>Neogit<cr>", desc = "[G]it [N]vim" },
  },
}
