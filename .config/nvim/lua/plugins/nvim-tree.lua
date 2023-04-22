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
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
      end,
      update_focused_file = {
        enable = true,
      },
      view = {
        width = 35,
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
