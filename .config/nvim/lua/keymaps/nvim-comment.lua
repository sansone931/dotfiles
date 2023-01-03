--- terrortylor/nvim-comment
local M = {}

function M.setup()
  local wk = require("which-key")

  wk.register({
    ["/"] = { "<Cmd>CommentToggle<CR>", "toggle comment" },
  }, { prefix = "<Leader>" })

  wk.register({
    ["/"] = { ":CommentToggle<CR>", "toggle comment" },
  }, { mode = "v", prefix = "<Leader>" })
end

return M
