local beautiful = require("beautiful")
local gears = require("gears")
local variables = require("variables")

--- @module theme
local M = {}

function M.setup()
  beautiful.init(
    string.format(
      "%s/themes/%s/theme.lua",
      gears.filesystem.get_configuration_dir(),
      variables.chosen_theme
    )
  )
end

return M
