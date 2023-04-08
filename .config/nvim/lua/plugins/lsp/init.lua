return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim",
      "b0o/schemastore.nvim",
      "j-hui/fidget.nvim",
    },
    keys = {
      { "K", vim.lsp.buf.hover, desc = "Show hover" },
      { "gK", vim.lsp.buf.signature_help, desc = "Show signature help" },
      { "<C-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Show signature help" },
      { "[d", vim.diagnostic.goto_prev, mode = { "n", "x" }, desc = "Previous diagnostic" },
      { "]d", vim.diagnostic.goto_next, mode = { "n", "x" }, desc = "Next diagnostic" },
      { "<Leader>la", vim.lsp.buf.code_action, desc = "Show code actions" },
      { "<Leader>ld", vim.diagnostic.open_float, desc = "Show line diagnostics" },
      {
        "<Leader>lf",
        function()
          vim.lsp.buf.format({ async = true })
        end,
        desc = "Format document",
      },
      { "<Leader>lr", vim.lsp.buf.rename, desc = "Rename" },
    },
    config = function()
      -- Automatically install servers with mason.nvim
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })

      require("neodev").setup()

      -- {{{ UI
      local signs = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({
        virtual_text = false,
        float = {
          source = "always",
          format = function(diagnostic)
            local code = diagnostic.code or (diagnostic.user_data and diagnostic.user_data.lsp.code)

            if code then
              return string.format("%s [%s]", diagnostic.message, code)
            end

            return diagnostic.message
          end,
        },
      })
      -- }}}

      require("plugins.lsp.servers").setup()
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      local builtins = null_ls.builtins

      local sources = {
        -- {{{ Formatters
        builtins.formatting.eslint_d, -- https://github.com/mantoni/eslint_d.js
        builtins.formatting.prettierd, -- https://github.com/fsouza/prettierd
        builtins.formatting.black, -- https://github.com/psf/black
        builtins.formatting.stylua, -- https://github.com/JohnnyMorganz/StyLua
        -- }}}

        -- {{{ Linters
        builtins.diagnostics.eslint_d, -- https://github.com/mantoni/eslint_d.js
        builtins.code_actions.eslint_d, -- https://github.com/mantoni/eslint_d.js
        builtins.diagnostics.flake8, -- https://github.com/PyCGA/flake8
        -- }}}
      }

      null_ls.setup({ sources = sources })

      -- Automatically install sources with mason.nvim
      require("mason-null-ls").setup({
        automatic_installation = true,
      })
    end,
  },
}
