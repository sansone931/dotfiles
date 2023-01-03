--- kyazdani42/nvim-tree.lua
local M = {}

function M.setup()
  require("nvim-tree").setup({
    update_focused_file = {
      enable = true,
    },
    view = {
      width = 35,
      mappings = {
        list = {
          { key = "l", action = "edit" },
          { key = "h", action = "close_node" },
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

  require("keymaps.nvim-tree").setup()
end

return M
