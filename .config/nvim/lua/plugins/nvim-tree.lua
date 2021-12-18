--- kyazdani42/nvim-tree.lua
-- @module plugins.nvim-tree
local M = {}

function M.setup()
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_special_files = {}

  vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "M",
      staged = "A",
      unmerged = "C",
      renamed = "R",
      untracked = "U",
      deleted = "D",
      ignored = "",
    },
  }

  local tree_cb = require("nvim-tree.config").nvim_tree_callback

  require("nvim-tree").setup({
    disable_netrw = false,
    update_focused_file = {
      enable = true,
    },
    view = {
      width = 35,
      mappings = {
        list = {
          { key = "l", cb = tree_cb("edit") },
          { key = "h", cb = tree_cb("close_node") },
        },
      },
      number = true,
      relativenumber = true,
    },
    filters = {
      dotfiles = false,
      custom = { ".git", "node_modules", ".cache" },
    },
  })

  require("mappings.nvim-tree").setup()
end

return M
