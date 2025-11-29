--- jdtls
local M = {}

function M.setup()
  vim.lsp.config('jdtls', {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })
end

return M
