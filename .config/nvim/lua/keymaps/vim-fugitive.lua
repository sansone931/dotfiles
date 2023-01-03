--- tpope/vim-fugitive
local M = {}

function M.setup()
  local wk = require("which-key")

  wk.register({
    g = {
      name = "+git",
      d = { "<Cmd>Gdiffsplit<CR>", "diff split"      },
      B = { "<Cmd>G blame<CR>"   , "blame"           },
      g = { "<Cmd>G<CR>"         , "status"          },
      x = { "<Cmd>GBrowse<CR>"   , "show in browser" },
    },
  }, { prefix = "<Leader>" })
end

return M
