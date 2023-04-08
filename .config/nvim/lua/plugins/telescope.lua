return {
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
      local ok, telescope = pcall(require, "telescope")

      if not ok then
        return
      end

      local builtin = require("telescope.builtin")
      local extensions = telescope.extensions

      local document_diagnostics = function()
        builtin.diagnostics({ bufnr = 0 })
      end

      return {
        { "<Leader>f/", builtin.current_buffer_fuzzy_find, desc = "Current buffer" },
        { "<Leader>f?", builtin.builtin, desc = "Builtin pickers" },
        { "<Leader>fb", builtin.buffers, desc = "Buffers" },
        { "<Leader>fd", document_diagnostics, desc = "Document diagnostics" },
        { "<Leader>fD", builtin.diagnostics, desc = "Workspace diagnostics" },
        { "<Leader>ff", builtin.find_files, desc = "Files" },
        { "<Leader>fh", builtin.oldfiles, desc = "Oldfiles" },
        { "<Leader>fk", builtin.keymaps, desc = "Keymaps" },
        { "<Leader>fm", builtin.man_pages, desc = "Man pages" },
        { "<Leader>fn", extensions.notify.notify, desc = "Notifications" },
        { "<Leader>fq", builtin.quickfix, desc = "Quickfix" },
        { "<Leader>fr", builtin.resume, desc = "Resume last search" },
        { "<Leader>fs", builtin.lsp_document_symbols, desc = "Document symbols" },
        { "<Leader>fS", builtin.lsp_dynamic_workspace_symbols, desc = "Workspace symbols" },
        { "<Leader>ft", builtin.live_grep, desc = "Text" },
        { "<Leader>fw", builtin.grep_string, desc = "Word under cursor" },
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
      require("telescope").load_extension("notify")
    end,
  },
}
