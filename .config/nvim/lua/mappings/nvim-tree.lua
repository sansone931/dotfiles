--- kyazdani42/nvim-tree.lua
-- @module mappings.nvim-tree
local M = {}

function M.setup()
  local wk = require("which-key")
  local tree_cb = require("nvim-tree.config").nvim_tree_callback

  vim.g.nvim_tree_bindings = {
    { key = "l", cb = tree_cb("edit") },
    { key = "h", cb = tree_cb("close_node") },
  }

  wk.register({
    e = { "<Cmd>NvimTreeToggle<CR>", "toggle explorer" },
  }, { prefix = "<Leader>" })
end

return M
