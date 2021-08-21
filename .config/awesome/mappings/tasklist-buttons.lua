local awful = require("awful")
local gears = require("gears")

local toggle_client_menu = require("menu").toggle_client_menu

--- @module mappings.tasklist-buttons
local M = gears.table.join(
  awful.button({}, 1, function(c)
    if c == client.focus then
      c.minimized = true
    else
      c.minimized = false
      if not c:isvisible() and c.first_tag then
        c.first_tag:view_only()
      end
      client.focus = c
      c:raise()
    end
  end),

  awful.button({}, 2, function(c)
    toggle_client_menu(c)
  end),

  awful.button({}, 3, function(c)
    toggle_client_menu(c)
  end),

  awful.button({}, 5, function()
    awful.client.focus.byidx(1)
  end),

  awful.button({}, 4, function()
    awful.client.focus.byidx(-1)
  end)
)

return M
