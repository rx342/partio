return {
  "luasnip",
  after = function()
    require("luasnip").setup({
      enable_autosnippets = true,
    })
    require("luasnip.loaders.from_lua").load({
      paths = snippet_dir,
    })
  end,
  keys = {
    {
      "<C-J>",
      function()
        if require("luasnip").choice_active() then
          require("luasnip").change_choice(1)
        end
      end,
      mode = { "i", "s" },
    },
  },
}
