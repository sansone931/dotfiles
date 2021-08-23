--- morhetz/gruvbox
-- @module plugins.gruvbox
local gruvbox = {}

function gruvbox.setup()
  vim.g.gruvbox_italic = 1
  vim.g.gruvbox_invert_selection = 0

  vim.cmd([[colorscheme gruvbox]])
end

return gruvbox
