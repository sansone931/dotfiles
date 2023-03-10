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

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    keys = function()
      local builtin = require("telescope.builtin")

      return {
        { "<Leader>ff", builtin.find_files, desc = "Files" },
        { "<Leader>fg", builtin.git_status, desc = "Git status" },
        { "<Leader>fh", builtin.oldfiles, desc = "File history" },
        { "<Leader>ft", builtin.live_grep, desc = "Text" },
        { "<Leader>fw", builtin.grep_string, desc = "Word under cursor" },
        { "<Leader>f?", builtin.builtin, desc = "Builtin pickers" },
        { "<Leader>f/", builtin.current_buffer_fuzzy_find, desc = "Current buffer" },
        {
          "<Leader>fd",
          function()
            builtin.diagnostics({ bufnr = 0 })
          end,
          desc = "Document diagnostics",
        },
        { "<Leader>fD", builtin.diagnostics, desc = "Workspace diagnostics" },
        { "<Leader>fs", builtin.lsp_document_symbols, desc = "Document symbols" },
        { "<Leader>fS", builtin.lsp_dynamic_workspace_symbols, desc = "Workspace symbols" },
        { "<Leader>fr", builtin.resume, desc = "Resume last search" },
        { "gd", builtin.lsp_definitions, desc = "Definitions" },
        { "gI", builtin.lsp_implementations, desc = "Implementations" },
        { "gr", builtin.lsp_references, desc = "References" },
        { "gy", builtin.lsp_type_definitions, desc = "Type definitions" },
      }
    end,
    config = function()
      require("telescope").setup({
        defaults = {
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
            },
          },
          set_env = { ["COLORTERM"] = "truecolor" },
        },
      })

      require("telescope").load_extension("fzf")
    end,
  },

  {
    "unblevable/quick-scope",
    keys = {
      { "f", mode = { "n", "x" } },
      { "F", mode = { "n", "x" } },
      { "t", mode = { "n", "x" } },
      { "T", mode = { "n", "x" } },
    },
    init = function()
      vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
    end,
  },
}
