return {
  "conform.nvim",
  event = { "BufWritePre" },
  after = function()
    require("conform").setup({
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 5000, lsp_format = "fallback" }
      end,
      formatters_by_ft = {
        markdown = { "prettierd" },
        lua = { "stylua" },
        python = { "ruff_format", "isort" },
        tex = function(bufnr)
          if
            require("conform").get_formatter_info("tex-fmt", bufnr).available
          then
            return { "tex-fmt" }
          else
            return { "latexindent" }
          end
        end,
        bib = function(bufnr)
          if
            require("conform").get_formatter_info("tex-fmt", bufnr).available
          then
            return { "tex-fmt" }
          else
            return { "latexindent" }
          end
        end,
        c = { "clang-format" },
        cpp = { "clang-format" },
        nix = { "nixfmt" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        just = { "just" },
        nu = { "nufmt" },
      },
    })

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })
  end,
}
