--- kyazdani42/nvim-tree.lua
-- @module plugins.nvim-tree
local M = {}

function M.setup()
  vim.g.nvim_tree_width = 35
  vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_special_files = {}
  vim.g.nvim_tree_disable_netrw = 0

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

  require("mappings.nvim-tree").setup()
end

return M
