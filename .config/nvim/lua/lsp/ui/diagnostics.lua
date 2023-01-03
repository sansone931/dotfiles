--- lsp diagnostics
local M = {}

function M.setup()
  vim.diagnostic.config({
    virtual_text = false,
    float = {
      source = "always",
    },
  })
end

return M
