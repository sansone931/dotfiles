--- lewis6991/gitsigns.nvim
local M = {}

function M.setup()
  local wk = require("which-key")
  local map = vim.api.nvim_set_keymap
  local opts = { silent = true, noremap = true }

  map("n", "[g", '<Cmd>lua require("gitsigns.actions").prev_hunk()<CR>', opts)
  map("n", "]g", '<Cmd>lua require("gitsigns.actions").next_hunk()<CR>', opts)
  map("o", "ih", '<Cmd>lua require("gitsigns.actions").select_hunk()<CR>', opts)
  map("x", "ih", '<Cmd>lua require("gitsigns.actions").select_hunk()<CR>', opts)

  wk.register({
    g = {
      name = "+git",
      s = { '<Cmd>lua require("gitsigns").stage_hunk()<CR>'               , "stage hunk"      },
      u = { '<Cmd>lua require("gitsigns").undo_stage_hunk()<CR>'          , "undo stage hunk" },
      p = { '<Cmd>lua require("gitsigns").preview_hunk()<CR>'             , "preview hunk"    },
      r = { '<Cmd>lua require("gitsigns").reset_hunk()<CR>'               , "reset hunk"      },
      R = { '<Cmd>lua require("gitsigns").reset_buffer()<CR>'             , "reset buffer"    },
      b = { '<Cmd>lua require("gitsigns").blame_line({ full = true })<CR>', "blame line"      },
    },
  }, { prefix = "<Leader>" })

wk.register({
  g = {
    name = "+git",
    s = { '<Cmd>lua require("gitsigns").stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', "stage hunk" },
    r = { '<Cmd>lua require("gitsigns").reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', "reset hunk" },
  },
}, { mode = "v", prefix = "<Leader>" })
end

return M
