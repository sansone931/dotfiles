return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim",
      "b0o/schemastore.nvim",
    },
    keys = {
      { "K", vim.lsp.buf.hover, desc = "Show hover" },
      { "gK", vim.lsp.buf.signature_help, desc = "Show signature help" },
      { "<C-K>", vim.lsp.buf.signature_help, mode = "i", desc = "Show signature help" },
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

      -- {{{ UI
      local signs = {
        Error = " ",
        Warn = " ",
        Hint = "󰌵 ",
        Info = " ",
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({
        severity_sort = true,
        virtual_text = false,
        float = { source = "always" },
      })
      -- }}}

      -- {{{ Server configurations
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      local servers = {
        "astro",
        "cssls",
        "eslint",
        "graphql",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "rust_analyzer",
        "ts_ls",
      }

      require("neodev").setup()

      for _, server in pairs(servers) do
        require("plugins.lsp.servers." .. server).setup()
      end
      -- }}}
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      local builtins = null_ls.builtins

      local sources = {
        builtins.formatting.prettierd, -- https://github.com/fsouza/prettierd
        builtins.formatting.stylua, -- https://github.com/JohnnyMorganz/StyLua
      }

      null_ls.setup({ sources = sources })

      -- Automatically install sources with mason.nvim
      require("mason-null-ls").setup({
        automatic_installation = true,
      })
    end,
  },
}
