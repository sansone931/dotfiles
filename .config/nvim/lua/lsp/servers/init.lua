--- @module lsp.servers
local M = {}

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
function M.setup()
  require("lsp.servers.pyright").setup()
  require("lsp.servers.sumneko_lua").setup()
  require("lsp.servers.tsserver").setup()
end

return M
