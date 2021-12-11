--- @module lsp.ui.diagnostics
local M = {}

function M.setup()
  vim.diagnostic.config({
    virtual_text = false,
    -- virtual_text = {
    --   prefix = "■",
    --   spacing = 4,
    --   source = "always",
    -- },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
    source = "always",
  })
end

return M
