--- terrortylor/nvim-comment
-- @module plugins.nvim-comment
local nvim_comment = {}

function nvim_comment.setup()
  require("nvim_comment").setup {
    comment_empty = false,
    create_mappings = false,
    hook = function()
      require("ts_context_commentstring.internal").update_commentstring()
    end
  }
end

return nvim_comment
