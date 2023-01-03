--- pyright
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
local M = {}

function M.setup()
  require("lspconfig").pyright.setup({
    capabilities = require("plugins.nvim-cmp").capabilities,
  })
end

return M
