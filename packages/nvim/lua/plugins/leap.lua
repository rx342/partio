return {
  "leap.nvim",
  after = function()
    require("leap").opts.preview = function(ch0, ch1, ch2)
      return not (
        ch1:match("%s")
        or (ch0:match("%a") and ch1:match("%a") and ch2:match("%a"))
      )
    end
  end,
  keys = {
    {
      "s",
      "<Plug>(leap)",
      mode = { "n", "x", "o" },
    },
  },
}
