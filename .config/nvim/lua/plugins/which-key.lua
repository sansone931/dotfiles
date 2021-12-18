--- folke/which-key.nvim
-- @module plugins.which-key
local M = {}

function M.setup()
  require("which-key").setup({
    plugins = {
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      },
      presets = {
        operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
      },
    },
    window = {
      border = "single", -- none, single, double, shadow
    },
  })
end

return M
