return {
  "blink.cmp",
  event = "DeferredUIEnter",
  before = function()
    require("lz.n").trigger_load("luasnip")
    require("lz.n").trigger_load("lazydev")
  end,
  after = function()
    require("blink.cmp").setup({
      keymap = {
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-k>"] = { "select_and_accept" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-l>"] = { "snippet_forward", "fallback" },
        ["<C-h>"] = { "snippet_backward", "fallback" },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      sources = {
        default = {
          "lazydev",
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
      completion = {
        keyword = {
          range = "full",
        },
        accept = {
          auto_brackets = {
            enabled = false,
          },
        },
        documentation = {
          auto_show = true,
        },
      },
      snippets = {
        preset = "luasnip",
      },
      signature = { enabled = true },
    })
  end,
}
