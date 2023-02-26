--- Server configurations
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local M = {}

function M.setup()
  require("lsp.servers.jsonls").setup()
  require("lsp.servers.lua_ls").setup()
  require("lsp.servers.pyright").setup()
  require("lsp.servers.tsserver").setup()
end

return M
