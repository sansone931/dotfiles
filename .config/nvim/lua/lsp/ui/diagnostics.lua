--- @module lsp.ui.diagnostics
local M = {}

function M.setup()
  vim.lsp.handlers["textDocument/publishDiagnostics"] =
    function(_, _, params, client_id, _)
      local config = {
        underline = true,
        virtual_text = {
          prefix = "■",
          spacing = 4,
        },
        signs = true,
        update_in_insert = false,
      }
      local uri = params.uri
      local bufnr = vim.uri_to_bufnr(uri)

      if not bufnr then
        return
      end

      local _diagnostics = params.diagnostics

      for i, v in ipairs(_diagnostics) do
        _diagnostics[i].message = string.format("%s: %s", v.source, v.message)
      end

      vim.lsp.diagnostic.save(_diagnostics, bufnr, client_id)

      if not vim.api.nvim_buf_is_loaded(bufnr) then
        return
      end

      vim.lsp.diagnostic.display(_diagnostics, bufnr, client_id, config)
    end
end

return M
