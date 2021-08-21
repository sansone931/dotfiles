local awful = require("awful")
local beautiful = require("beautiful")

--- @module utils
local M = {}

local function update_volume(command)
  awful.spawn.easy_async(command, beautiful.volume.update)
end

function M.increase_volume(amount)
  update_volume(string.format("pamixer -i %s", amount))
end

function M.decrease_volume(amount)
  update_volume(string.format("pamixer -d %s", amount))
end

function M.toggle_mute()
  update_volume("pamixer -t")
end

return M
