return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "b0o/schemastore.nvim",
    },
    keys = {
      {
        "gK",
        function()
          vim.lsp.buf.signature_help()
        end,
        desc = "Show signature help",
      },
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
      -- {{{ UI
      vim.diagnostic.config({
        severity_sort = true,
        float = { source = true },
        jump = { float = true },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰌵 ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
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

      for _, server in pairs(servers) do
        require("plugins.lsp.servers." .. server).setup()
      end
      -- }}}
    end,
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    dependencies = { "Bilal2453/luvit-meta" },
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
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
