--- lua_ls
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
local M = {}

function M.setup()
  vim.lsp.config("lua_ls", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
    end,
  })

  vim.lsp.enable("lua_ls")
end

return M
