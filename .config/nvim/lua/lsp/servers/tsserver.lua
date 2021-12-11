--- @module lsp.servers.tsserver
local M = {}

function M.setup()
  require("lspconfig").tsserver.setup({
    on_attach = function(client)
      -- formatting is handled by null-ls
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      -- format on save
      vim.cmd([[
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      ]])
    end,
  })
end

return M
