return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      extensions = { "fugitive", "man", "nvim-dap-ui", "nvim-tree", "quickfix" },
      options = { section_separators = "", component_separators = "|" },
      sections = {
        lualine_b = { "diff", "diagnostics" },
        lualine_x = { "filetype" },
      },
    },
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        insert_only = false,
        win_options = {
          winblend = 0,
        },
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<Leader>N", "<Cmd>Noice<CR>", desc = "Show message history" },
    },
    opts = {
      cmdline = {
        enabled = false,
      },
      messages = {
        enabled = false,
      },
      lsp = {
        hover = {
          silent = true,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      views = {
        mini = {
          position = {
            row = -2,
          },
        },
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    keys = {
      { "<Leader>i", "<Cmd>IBLToggle<CR>", desc = "Toggle Indent Blankline" },
    },
    config = true,
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    cmd = {
      "ColorizerAttachToBuffer",
      "ColorizerDetachFromBuffer",
      "ColorizerReloadAllBuffers",
      "ColorizerToggle",
    },
    config = function()
      require("colorizer").setup()
    end,
  },
}
