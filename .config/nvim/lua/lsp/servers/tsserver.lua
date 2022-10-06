--- @module lsp.servers.tsserver
local M = {}

function M.setup()
  require("lspconfig").tsserver.setup({
    capabilities = require("plugins.nvim-cmp").capabilities,
    on_attach = function(client)
      -- formatting is handled by null-ls
      client.server_capabilities.documentFormattingProvider = false
    end,
  })
end

return M
