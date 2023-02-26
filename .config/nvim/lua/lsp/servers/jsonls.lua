--- jsonls
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
local M = {}

function M.setup()
  require("lspconfig").jsonls.setup({
    capabilities = require("plugins.nvim-cmp").capabilities,
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  })
end

return M
