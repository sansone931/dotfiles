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
    "romgrk/barbar.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<A-h>", "<Cmd>BufferPrevious<CR>", desc = "Previous buffer" },
      { "<A-l>", "<Cmd>BufferNext<CR>", desc = "Next buffer" },
      { "<A-H>", "<Cmd>BufferMovePrevious<CR>", desc = "Move buffer to the left" },
      { "<A-L>", "<Cmd>BufferMoveNext<CR>", desc = "Move buffer to the right" },
      { "<A-1>", "<Cmd>BufferGoto 1<CR>", desc = "Go to buffer 1" },
      { "<A-2>", "<Cmd>BufferGoto 2<CR>", desc = "Go to buffer 2" },
      { "<A-3>", "<Cmd>BufferGoto 3<CR>", desc = "Go to buffer 3" },
      { "<A-4>", "<Cmd>BufferGoto 4<CR>", desc = "Go to buffer 4" },
      { "<A-5>", "<Cmd>BufferGoto 5<CR>", desc = "Go to buffer 5" },
      { "<A-6>", "<Cmd>BufferGoto 6<CR>", desc = "Go to buffer 6" },
      { "<A-7>", "<Cmd>BufferGoto 7<CR>", desc = "Go to buffer 7" },
      { "<A-8>", "<Cmd>BufferGoto 8<CR>", desc = "Go to buffer 8" },
      { "<A-9>", "<Cmd>BufferGoto 9<CR>", desc = "Go to buffer 9" },
      { "<A-0>", "<Cmd>BufferLast<CR>", desc = "Go to last buffer" },
      { "<A-p>", "<Cmd>BufferPin<CR>", desc = "Toggle buffer pin" },
      { "<A-P>", "<Cmd>BufferCloseAllButPinned<CR>", desc = "Close all but pinned buffers" },
      { "<A-q>", "<Cmd>BufferClose<CR>", desc = "Close buffer" },
      { "<Leader>bc", "<Cmd>BufferClose!<CR>", desc = "Close buffer (force)" },
      { "<Leader>bD", "<Cmd>BufferOrderByDirectory<CR>", desc = "Sort buffers by directory" },
      { "<Leader>be", "<Cmd>BufferCloseAllButVisible<CR>", desc = "Close all but visible buffers" },
      { "<Leader>bh", "<Cmd>BufferCloseBuffersLeft<CR>", desc = "Close all buffers to the left" },
      { "<Leader>bj", "<Cmd>BufferPick<CR>", desc = "Jump to buffer" },
      { "<Leader>bl", "<Cmd>BufferCloseBuffersRight<CR>", desc = "Close all buffers to the right" },
      { "<Leader>bL", "<Cmd>BufferOrderByLanguage<CR>", desc = "Sort buffers by language" },
      { "<Leader>bp", "<Cmd>BufferPin<CR>", desc = "Toggle buffer pin" },
      { "<Leader>bP", "<Cmd>BufferCloseAllButPinned<CR>", desc = "Close all but pinned buffers" },
    },
    config = function()
      require("barbar").setup({
        icons = {
          pinned = {
            button = "󰐃",
            filename = true,
          },
        },
      })

      -- Integration with nvim-tree
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(tbl)
          local set_offset = require("barbar.api").set_offset

          local bufwinid
          local last_width
          local autocmd = vim.api.nvim_create_autocmd("WinScrolled", {
            callback = function()
              bufwinid = bufwinid or vim.fn.bufwinid(tbl.buf)

              local width = vim.api.nvim_win_get_width(bufwinid)
              if width ~= last_width then
                set_offset(width + 1, "FileTree")
                last_width = width
              end
            end,
          })

          vim.api.nvim_create_autocmd("BufWipeout", {
            buffer = tbl.buf,
            callback = function()
              vim.api.nvim_del_autocmd(autocmd)
              set_offset(0)
            end,
            once = true,
          })
        end,
        pattern = "NvimTree",
      })
    end,
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
