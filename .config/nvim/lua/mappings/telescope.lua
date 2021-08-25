--- nvim-telescope/telescope.nvim
-- @module mappings.telescope
local M = {}

function M.setup()
  local wk = require("which-key")

  wk.register({
    f = {
      name = "telescope",
      ["/"] = { "<Cmd>Telescope search_history<CR>", "history"      },
      b     = { "<Cmd>Telescope buffers<CR>"       , "buffers"      },
      c     = { "<Cmd>Telescope treesitter<CR>"    , "treesitter"   },
      f     = { "<Cmd>Telescope find_files<CR>"    , "files"        },
      g     = { "<Cmd>Telescope git_status<CR>"    , "git status"   },
      h     = { "<Cmd>Telescope oldfiles<CR>"      , "file history" },
      s     = { "<Cmd>Telescope treesitter<CR>"    , "symbols"      },
      t     = { "<Cmd>Telescope live_grep<CR>"     , "text"         },
    },
  }, { prefix = "<Leader>" })
end

return M
