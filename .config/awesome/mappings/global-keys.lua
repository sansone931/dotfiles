local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
local gears = require("gears")

local quit_menu = require("menu").quit_menu
local quake = require("quake")
local variables = require("variables")
local utils = require("utils")

local modkey = variables.modkey
local altkey = variables.altkey
local terminal = variables.terminal

--- @module mappings.global-keys
local M = gears.table.join(
  -- {{{ Screenshots
  awful.key({}, "Print", function()
    awful.spawn.with_shell(variables.screenshot)
  end, {
    description = "take a screenshot",
    group = "hotkeys",
  }),

  awful.key({ "Shift" }, "Print", function()
    awful.spawn.with_shell(variables.full_screenshot)
  end, {
    description = "take a full screenshot",
    group = "hotkeys",
  }),
  -- }}}

  -- X screen locker
  awful.key({ altkey, "Control" }, "l", function()
    awful.spawn(variables.scrlocker)
  end, {
    description = "lock screen",
    group = "hotkeys",
  }),

  -- Hotkeys
  awful.key({ modkey }, "s", function()
    hotkeys_popup.show_help()
  end, {
    description = "show help",
    group = "awesome",
  }),

  -- {{{ Client focus by index
  awful.key({ modkey, altkey }, "j", function()
    awful.client.focus.byidx(1)
  end, {
    description = "focus by index",
    group = "client",
  }),

  awful.key({ modkey, altkey }, "k", function()
    awful.client.focus.byidx(-1)
  end, {
    description = "focus by index",
    group = "client",
  }),
  -- }}}

  -- {{{ Client focus by direction
  awful.key({ modkey }, "h", function()
    awful.client.focus.bydirection("left")
    if client.focus then
      client.focus:raise()
    end
  end, {
    description = "focus by direction",
    group = "client",
  }),

  awful.key({ modkey }, "j", function()
    awful.client.focus.bydirection("down")
    if client.focus then
      client.focus:raise()
    end
  end, {
    description = "focus by direction",
    group = "client",
  }),

  awful.key({ modkey }, "k", function()
    awful.client.focus.bydirection("up")
    if client.focus then
      client.focus:raise()
    end
  end, {
    description = "focus by direction",
    group = "client",
  }),

  awful.key({ modkey }, "l", function()
    awful.client.focus.bydirection("right")
    if client.focus then
      client.focus:raise()
    end
  end, {
    description = "focus by direction",
    group = "client",
  }),
  -- }}}

  awful.key({ modkey }, "w", function()
    awful.util.mymainmenu:show()
  end, {
    description = "show main menu",
    group = "awesome",
  }),

  -- {{{ Layout manipulation by index
  awful.key({ modkey, altkey, "Shift" }, "j", function()
    awful.client.swap.byidx(1)
  end, {
    description = "swap by index",
    group = "client",
  }),

  awful.key({ modkey, altkey, "Shift" }, "k", function()
    awful.client.swap.byidx(-1)
  end, {
    description = "swap by index",
    group = "client",
  }),
  -- }}}

  -- {{{ Layout manipulation by index
  awful.key({ modkey, "Shift" }, "h", function()
    awful.client.swap.bydirection("left")
  end, {
    description = "swap by direction",
    group = "client",
  }),

  awful.key({ modkey, "Shift" }, "j", function()
    awful.client.swap.bydirection("down")
  end, {
    description = "swap by direction",
    group = "client",
  }),

  awful.key({ modkey, "Shift" }, "k", function()
    awful.client.swap.bydirection("up")
  end, {
    description = "swap by direction",
    group = "client",
  }),

  awful.key({ modkey, "Shift" }, "l", function()
    awful.client.swap.bydirection("right")
  end, {
    description = "swap by direction",
    group = "client",
  }),
  -- }}}

  awful.key({ modkey }, "o", function()
    awful.screen.focus_relative(1)
  end, {
    description = "focus screen",
    group = "screen",
  }),

  awful.key({ modkey }, "u", function()
    awful.client.urgent.jumpto()
  end, {
    description = "jump to urgent client",
    group = "client",
  }),

  -- Show/Hide Wibox
  awful.key({ modkey }, "b", function()
    for s in screen do
      s.mywibox.visible = not s.mywibox.visible
      if s.mybottomwibox then
        s.mybottomwibox.visible = not s.mybottomwibox.visible
      end
    end
  end, {
    description = "toggle wibox",
    group = "awesome",
  }),

  -- Standard program
  awful.key({ modkey, "Shift" }, "Return", function()
    awful.spawn(terminal)
  end, {
    description = "open a terminal",
    group = "launcher",
  }),

  awful.key({ modkey, "Control" }, "r", function()
    awesome.restart()
  end, {
    description = "reload awesome",
    group = "awesome",
  }),

  awful.key({ modkey, "Shift" }, "q", function()
    quit_menu:show()
  end, {
    description = "quit awesome",
    group = "awesome",
  }),

  -- {{{ Change master width factor
  awful.key({ modkey, altkey }, "h", function()
    awful.tag.incmwfact(-0.05)
  end, {
    description = "change master width factor",
    group = "layout",
  }),

  awful.key({ modkey, altkey }, "l", function()
    awful.tag.incmwfact(0.05)
  end, {
    description = "change master width factor",
    group = "layout",
  }),
  -- }}}

  -- {{{ Cycle layouts
  awful.key({ modkey }, "space", function()
    awful.layout.inc(1)
  end, {
    description = "change layout",
    group = "layout",
  }),

  awful.key({ modkey, "Shift" }, "space", function()
    awful.layout.inc(-1)
  end, {
    description = "change layout",
    group = "layout",
  }),
  -- }}}

  awful.key({ modkey, "Control" }, "n", function()
    local c = awful.client.restore()
    if c then
      client.focus = c
      c:raise()
    end
  end, {
    description = "restore minimized",
    group = "client",
  }),

  -- Quake terminal
  awful.key({ modkey }, "z", function()
    quake:toggle()
  end, {
    description = "Quake terminal",
    group = "launcher",
  }),

  -- {{{ Brightness
  awful.key({}, "XF86MonBrightnessUp", function()
    awful.spawn.with_shell("xbacklight -inc 10")
  end, {
    description = "change brightness",
    group = "hotkeys",
  }),

  awful.key({}, "XF86MonBrightnessDown", function()
    awful.spawn.with_shell("xbacklight -dec 10")
  end, {
    description = "change brightness",
    group = "hotkeys",
  }),
  -- }}}

  -- {{{ Volume control
  awful.key({}, "XF86AudioRaiseVolume", function()
    utils.increase_volume(1)
  end, {
    description = "change volume",
    group = "hotkeys",
  }),

  awful.key({}, "XF86AudioLowerVolume", function()
    utils.decrease_volume(1)
  end, {
    description = "change volume",
    group = "hotkeys",
  }),

  awful.key({}, "XF86AudioMute", function()
    utils.toggle_mute()
  end, {
    description = "toggle mute",
    group = "hotkeys",
  }),

  awful.key({ modkey }, "=", function()
    utils.increase_volume(5)
  end, {
    description = "increase volume",
    group = "hotkeys",
  }),

  awful.key({ modkey }, "-", function()
    utils.decrease_volume(5)
  end, {
    description = "decrease volume",
    group = "hotkeys",
  }),

  awful.key({ modkey }, "0", function()
    utils.toggle_mute()
  end, {
    description = "toggle mute",
    group = "hotkeys",
  }),
  -- }}}

  -- Menubar
  awful.key({ modkey }, "p", function()
    menubar.show()
  end, {
    description = "show the menubar",
    group = "launcher",
  })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
  local descr_view, descr_toggle, descr_move, descr_toggle_focus

  if i == 1 or i == 9 then
    descr_view = { description = "view tag #", group = "tag" }
    descr_toggle = { description = "toggle tag #", group = "tag" }
    descr_move = {
      description = "move focused client to tag #",
      group = "tag",
    }
    descr_toggle_focus = {
      description = "toggle focused client on tag #",
      group = "tag",
    }
  end

  M = gears.table.join(
    M,

    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9, function()
      local s = awful.screen.focused()
      local t = s.tags[i]
      if t then
        t:view_only()
      end
    end, descr_view),

    -- Toggle tag display.
    awful.key({ modkey, "Control" }, "#" .. i + 9, function()
      local s = awful.screen.focused()
      local t = s.tags[i]
      if t then
        awful.tag.viewtoggle(t)
      end
    end, descr_toggle),

    -- Move client to tag.
    awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local t = client.focus.screen.tags[i]
        if t then
          client.focus:move_to_tag(t)
        end
      end
    end, descr_move),

    -- Toggle tag on focused client.
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local t = client.focus.screen.tags[i]
        if t then
          client.focus:toggle_tag(t)
        end
      end
    end, descr_toggle_focus)
  )
end

return M
