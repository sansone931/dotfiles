--- numToStr/Comment.nvim
local M = {}

function M.setup()
  local wk = require("which-key")
  local api = require('Comment.api')

  local function toggle_comment_normal_mode()
    if (vim.v.count == 0) then
      api.toggle.linewise.current()
    else
      api.toggle.linewise.count(vim.v.count)
    end
  end

  wk.register({
    ["/"] = { toggle_comment_normal_mode, "toggle comment" },
  }, { prefix = "<Leader>" })

  wk.register({
    ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "toggle comment" },
  }, { mode = "v", prefix = "<Leader>" })
end

return M
