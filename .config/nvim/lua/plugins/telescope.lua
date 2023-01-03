--- nvim-telescope/telescope.nvim
local M = {}

function M.setup()
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
  require("mappings.telescope").setup()
end

return M
