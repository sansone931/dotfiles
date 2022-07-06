local dpi = require("beautiful.xresources").apply_dpi
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local default_at_screen_connect = function(s)
  -- Textclock
  local mytextclock = wibox.widget.textclock()

  -- Each screen has its own tag table.
  awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

  -- Create an imagebox widget which will contain an icon indicating which
  -- layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({}, 1, function()
      awful.layout.inc(1)
    end),
    awful.button({}, 2, function()
      awful.layout.set(awful.layout.layouts[1])
    end),
    awful.button({}, 3, function()
      awful.layout.inc(-1)
    end),
    awful.button({}, 4, function()
      awful.layout.inc(1)
    end),
    awful.button({}, 5, function()
      awful.layout.inc(-1)
    end)
  ))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist({
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = awful.util.taglist_buttons,
  })

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist({
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = awful.util.tasklist_buttons,
  })

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", height = dpi(24), screen = s })

  -- Add widgets to the wibox
  s.mywibox:setup({
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      s.mytaglist,
      s.mypromptbox,
    },
    s.mytasklist, -- Middle widget
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      wibox.widget.systray(),
      mytextclock,
      s.mylayoutbox,
    },
  })
end

--- Screen and Panel
-- @module screen
local M = {}

function M.setup()
  awful.screen.connect_for_each_screen(function(s)
    local at_screen_connect = beautiful.at_screen_connect
      or default_at_screen_connect
    at_screen_connect(s)
  end)
end

return M
