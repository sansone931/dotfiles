--- tpope/vim-fugitive
local M = {}

function M.setup()
  local wk = require("which-key")

  wk.register({
    g = {
      name = "+git",
      d = { "<Cmd>Gdiffsplit!<CR>", "diff split"      },
      B = { "<Cmd>Git blame<CR>"  , "blame"           },
      g = { "<Cmd>Git<CR>"        , "status"          },
      h = { "<Cmd>0Gclog<CR>"     , "file history"    },
      l = { "<Cmd>Git log<CR>"    , "log"             },
      x = { "<Cmd>GBrowse<CR>"    , "show in browser" },
    },
  }, { prefix = "<Leader>" })
end

return M
