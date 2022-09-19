--- romgrk/barbar.nvim
-- @module mappings.barbar
local M = {}

function M.setup()
  local wk = require("which-key")
  local map = vim.api.nvim_set_keymap
  local opts = { silent = true, noremap = true }

  map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts)
  map("n", "<Tab>", "<Cmd>BufferNext<CR>", opts)
  map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
  map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
  map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
  map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
  map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
  map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
  map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
  map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
  map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
  map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
  map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
  map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
  map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
  map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
  map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
  map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
  map("n", "<S-q>", "<Cmd>BufferClose<CR>", opts)

  wk.register({
    b = {
      name = "buffers",
      c = { "<Cmd>BufferClose!<CR>"            , "close buffer (force)"           },
      D = { "<Cmd>BufferOrderByDirectory<CR>"  , "sort buffers by directory"      },
      e = { "<Cmd>BufferCloseAllButCurrent<CR>", "close all but current buffer"   },
      h = { "<Cmd>BufferCloseBuffersLeft<CR>"  , "close all buffers to the left"  },
      j = { "<Cmd>BufferPick<CR>"              , "jump to buffer"                 },
      l = { "<Cmd>BufferCloseBuffersRight<CR>" , "close all buffers to the right" },
      L = { "<Cmd>BufferOrderByLanguage<CR>"   , "sort buffers by language"       },
      p = { "<Cmd>BufferPin<CR>"               , "pin/unpin buffer"               },
      P = { "<Cmd>BufferCloseAllButPinned<CR>" , "close all but pinned buffers"   },
    }
  }, { prefix = "<Leader>" })
end

return M
