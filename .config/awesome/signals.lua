local awful = require("awful")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local gears = require("gears")
local naughty = require("naughty")
local wibox = require("wibox")

local quake = require("quake")
local variables = require("variables")

--- @module signals
local M = {}

function M.setup()
  -- Handle runtime errors after startup
  do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
      -- Make sure we don't go into an endless error loop
      if in_error then
        return
      end
      in_error = true

      naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, an error happened!",
        text = tostring(err),
      })
      in_error = false
    end)
  end

  -- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
  screen.connect_signal("property::geometry", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
      local wallpaper = beautiful.wallpaper
      -- If wallpaper is a function, call it with the screen
      if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
      end
      gears.wallpaper.maximized(wallpaper, s, true)
    else
      awful.spawn.with_shell(variables.restore_wallpaper)
    end
  end)

  -- Signal function to execute when a new client appears.
  client.connect_signal("manage", function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not awesome.startup then
      awful.client.setslave(c)
    end

    c.shape = function(cr, w, h)
      gears.shape.rectangle(cr, w, h)
    end

    if
      awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position
    then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
    end
  end)

  -- Add a titlebar if titlebars_enabled is set to true in the rules.
  client.connect_signal("request::titlebars", function(c)
    -- Custom
    if beautiful.titlebar_fun then
      beautiful.titlebar_fun(c)
      return
    end

    -- Default
    -- buttons for the titlebar
    local buttons = gears.table.join(
      awful.button({}, 1, function()
        c:emit_signal("request::activate", "titlebar", { raise = true })
        awful.mouse.client.move(c)
      end),
      awful.button({}, 3, function()
        c:emit_signal("request::activate", "titlebar", { raise = true })
        awful.mouse.client.resize(c)
      end)
    )

    awful.titlebar(c, { size = dpi(16) }):setup({
      { -- Left
        awful.titlebar.widget.iconwidget(c),
        buttons = buttons,
        layout = wibox.layout.fixed.horizontal,
      },
      { -- Middle
        { -- Title
          align = "center",
          widget = awful.titlebar.widget.titlewidget(c),
        },
        buttons = buttons,
        layout = wibox.layout.flex.horizontal,
      },
      { -- Right
        awful.titlebar.widget.floatingbutton(c),
        awful.titlebar.widget.maximizedbutton(c),
        awful.titlebar.widget.stickybutton(c),
        awful.titlebar.widget.ontopbutton(c),
        awful.titlebar.widget.closebutton(c),
        layout = wibox.layout.fixed.horizontal(),
      },
      layout = wibox.layout.align.horizontal,
    })
  end)

  -- Enable sloppy focus, so that focus follows mouse.
  client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
  end)

  -- Hide dropdown terminal when another client is raised
  client.connect_signal("raised", function(c)
    if c.name ~= "QuakeDD" and quake.visible then
      quake:toggle()
    end
  end)

  client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
  end)

  client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
  end)

  -- Save and restore tags, when monitor setup is changed
  -- https://github.com/lcpz/awesome-copycats/issues/251
  local tag_store = {}
  tag.connect_signal("request::screen", function(t)
    local fallback_tag = nil

    -- find tag with same name on any other screen
    for other_screen in screen do
      if other_screen ~= t.screen then
        fallback_tag = awful.tag.find_by_name(other_screen, t.name)
        if fallback_tag ~= nil then
          break
        end
      end
    end

    -- no tag with same name exists, chose random one
    if fallback_tag == nil then
      fallback_tag = awful.tag.find_fallback()
    end

    if not (fallback_tag == nil) then
      local output = next(t.screen.outputs)

      if tag_store[output] == nil then
        tag_store[output] = {}
      end

      local clients = t:clients()
      tag_store[output][t.name] = clients

      for _, c in ipairs(clients) do
        c:move_to_tag(fallback_tag)
      end
    end
  end)

  screen.connect_signal("added", function(s)
    local output = next(s.outputs)
    naughty.notify({ text = output .. " Connected" })

    local tags = tag_store[output]
    if not (tags == nil) then
      naughty.notify({ text = "Restoring Tags" })

      for _, t in ipairs(s.tags) do
        local clients = tags[t.name]
        if not (clients == nil) then
          for _, c in ipairs(clients) do
            c:move_to_tag(t)
          end
        end
      end
    end
  end)
end

return M
