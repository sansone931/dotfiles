local awful = require("awful")
local gears = require("gears")

local variables = require("variables")

local modkey = variables.modkey

--- @module mappings.taglist-buttons
local M = gears.table.join(
  awful.button({}, 1, function(t)
    t:view_only()
  end),

  awful.button({ modkey }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),

  awful.button({}, 3, function(t)
    awful.tag.viewtoggle(t)
  end),

  awful.button({ modkey }, 3, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),

  awful.button({}, 5, function(t)
    awful.tag.viewnext(t.screen)
  end),

  awful.button({}, 4, function(t)
    awful.tag.viewprev(t.screen)
  end)
)

return M
