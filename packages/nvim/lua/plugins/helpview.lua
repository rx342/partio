return {
  "helpview.nvim",
  after = function()
    require("helpview").setup({
      preview = {
        icon_provider = "mini",
      },
    })
  end,
}
