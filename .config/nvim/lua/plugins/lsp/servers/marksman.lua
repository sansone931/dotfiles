--- marksman
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#marksman
local M = {}

function M.setup()
  vim.lsp.config('marksman', {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })

  vim.lsp.enable("marksman")
end

return M
