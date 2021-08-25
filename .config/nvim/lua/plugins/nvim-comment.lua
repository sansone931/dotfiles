--- terrortylor/nvim-comment
-- @module plugins.nvim-comment
local M = {}

function M.setup()
  require("nvim_comment").setup({
    comment_empty = false,
    create_mappings = false,
    hook = function()
      require("ts_context_commentstring.internal").update_commentstring()
    end,
  })

  require("mappings.nvim-comment").setup()
end

return M
