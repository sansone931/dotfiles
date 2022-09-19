--- kyazdani42/nvim-tree.lua
-- @module plugins.nvim-tree
local M = {}

function M.setup()
  local tree_cb = require("nvim-tree.config").nvim_tree_callback

  require("nvim-tree").setup({
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
    renderer = {
      highlight_git = true,
      special_files = {},
      icons = {
        glyphs = {
          default = "",
          git = {
            unstaged = "M",
            staged = "A",
            unmerged = "C",
            renamed = "R",
            untracked = "U",
            deleted = "D",
            ignored = "",
          },
        },
      },
    },
  })

  require("mappings.nvim-tree").setup()
end

return M
