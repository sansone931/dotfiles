return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = {
      "NvimTreeOpen",
      "NvimTreeClose",
      "NvimTreeToggle",
      "NvimTreeFocus",
      "NvimTreeRefresh",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
      "NvimTreeClipboard",
      "NvimTreeResize",
      "NvimTreeCollapse",
      "NvimTreeCollapseKeepBuffers",
      "NvimTreeGenerateOnAttach",
    },
    keys = {
      { "<Leader>e", "<Cmd>NvimTreeToggle<CR>", desc = "Toggle explorer" },
    },
    opts = {
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
    },
  },
}
