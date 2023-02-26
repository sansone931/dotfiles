--- nvim-telescope/telescope.nvim
local M = {}

function M.setup()
  local builtin = require("telescope.builtin")

  vim.keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "Files" })
  vim.keymap.set("n", "<Leader>fg", builtin.git_status, { desc = "Git status" })
  vim.keymap.set("n", "<Leader>fh", builtin.oldfiles, { desc = "File history" })
  vim.keymap.set("n", "<Leader>ft", builtin.live_grep, { desc = "Text" })

  vim.keymap.set(
    "n",
    "<Leader>fw",
    builtin.grep_string,
    { desc = "Word under cursor" }
  )

  vim.keymap.set(
    "n",
    "<Leader>f?",
    builtin.builtin,
    { desc = "Builtin pickers" }
  )

  vim.keymap.set(
    "n",
    "<Leader>f/",
    builtin.current_buffer_fuzzy_find,
    { desc = "Current buffer" }
  )

  vim.keymap.set("n", "<Leader>fd", function()
    builtin.diagnostics({ bufnr = 0 })
  end, { desc = "Document diagnostics" })

  vim.keymap.set(
    "n",
    "<Leader>fD",
    builtin.diagnostics,
    { desc = "Workspace diagnostics" }
  )

  vim.keymap.set(
    "n",
    "<Leader>fs",
    builtin.lsp_document_symbols,
    { desc = "Document symbols" }
  )

  vim.keymap.set(
    "n",
    "<Leader>fS",
    builtin.lsp_dynamic_workspace_symbols,
    { desc = "Workspace symbols" }
  )

  vim.keymap.set("n", "<Leader>fr", builtin.resume, {
    desc = "Resume last search",
  })

  vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Definitions" })

  vim.keymap.set(
    "n",
    "gI",
    builtin.lsp_implementations,
    { desc = "Implementations" }
  )

  vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "References" })

  vim.keymap.set(
    "n",
    "gy",
    builtin.lsp_type_definitions,
    { desc = "Type definitions" }
  )
end

return M
