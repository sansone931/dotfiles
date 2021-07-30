--- norcalli/nvim-colorizer.lua
-- @module plugins.nvim-colorizer
local nvim_colorizer = {}

function nvim_colorizer.setup()
  require("colorizer").setup()
end

return nvim_colorizer
