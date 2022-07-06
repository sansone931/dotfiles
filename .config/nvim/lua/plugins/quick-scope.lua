--- unblevable/quick-scope
-- @module plugins.quick-scope
local M = {}

function M.setup()
  vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
end

return M
