local awful = require("awful")
local gears = require("gears")

local variables = require("variables")

local modkey = variables.modkey

--- @module mappings.client-keys
local M = gears.table.join(
  awful.key({ modkey }, "f", function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
  end, {
    description = "toggle fullscreen",
    group = "client",
  }),

  awful.key({ modkey }, "q", function(c)
    c:kill()
  end, {
    description = "close",
    group = "client",
  }),

  awful.key({ modkey, "Control" }, "space", function(c)
    awful.client.floating.toggle(c)
  end, {
    description = "toggle floating",
    group = "client",
  }),

  awful.key({ modkey }, "Return", function(c)
    c:swap(awful.client.getmaster())
  end, {
    description = "move to master",
    group = "client",
  }),

  awful.key({ modkey, "Shift" }, "o", function(c)
    c:move_to_screen()
  end, {
    description = "move to screen",
    group = "client",
  }),

  awful.key({ modkey, "Control", "Shift" }, "space", function(c)
    c.ontop = not c.ontop
  end, {
    description = "toggle keep on top",
    group = "client",
  }),

  awful.key({ modkey }, "n", function(c)
    -- The client currently has the input focus, so it cannot be
    -- minimized, since minimized clients can't have the focus.
    c.minimized = true
  end, {
    description = "minimize",
    group = "client",
  }),

  awful.key({ modkey }, "m", function(c)
    c.maximized = not c.maximized
    c:raise()
  end, {
    description = "maximize",
    group = "client",
  }),

  awful.key({ modkey, "Shift" }, "b", function(c)
    awful.titlebar.toggle(c)
  end, {
    description = "toggle titlebar",
    group = "client",
  }),

  awful.key({ modkey, "Shift" }, "s", function(c)
    c.size_hints_honor = not c.size_hints_honor
  end, {
    description = "toggle size hints honor",
    group = "client",
  }),

  -- {{{ Move client
  awful.key({ modkey, "Control" }, "h", function(c)
    c:relative_move(-64, 0, 0, 0)
  end, {
    description = "move client",
    group = "client",
  }),

  awful.key({ modkey, "Control" }, "j", function(c)
    c:relative_move(0, 64, 0, 0)
  end, {
    description = "move client",
    group = "client",
  }),

  awful.key({ modkey, "Control" }, "k", function(c)
    c:relative_move(0, -64, 0, 0)
  end, {
    description = "move client",
    group = "client",
  }),

  awful.key({ modkey, "Control" }, "l", function(c)
    c:relative_move(64, 0, 0, 0)
  end, {
    description = "move client",
    group = "client",
  }),
  -- }}}

  -- {{{ Resize client
  awful.key({ modkey, "Control", "Shift" }, "h", function(c)
    c:relative_move(32, 0, -64, 0)
  end, {
    description = "resize client",
    group = "client",
  }),

  awful.key({ modkey, "Control", "Shift" }, "j", function(c)
    c:relative_move(0, -32, 0, 64)
  end, {
    description = "resize client",
    group = "client",
  }),

  awful.key({ modkey, "Control", "Shift" }, "k", function(c)
    c:relative_move(0, 32, 0, -64)
  end, {
    description = "resize client",
    group = "client",
  }),

  awful.key({ modkey, "Control", "Shift" }, "l", function(c)
    c:relative_move(-32, 0, 64, 0)
  end, {
    description = "resize client",
    group = "client",
  })
  -- }}}
)

return M
