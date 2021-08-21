local awful = require("awful")
local gears = require("gears")

--- @module mappings
local M = {}

function M.setup_global_mappings()
  root.buttons(gears.table.join(awful.button({}, 3, function()
    awful.util.mymainmenu:toggle()
  end)))

  root.keys(require("mappings.global-keys"))
end

return M
