--- Server configurations
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local M = {}

function M.setup()
  require("plugins.lsp.servers.jsonls").setup()
  require("plugins.lsp.servers.lua_ls").setup()
  require("plugins.lsp.servers.pyright").setup()
  require("plugins.lsp.servers.tsserver").setup()
  require("plugins.lsp.servers.graphql").setup()
end

return M
