local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi

local gfs = require("gears.filesystem")
local theme_path = gfs.get_configuration_dir() .. "themes/powerarrow-gruvbox"

local utils = require("utils")

--- @module themes.powerarrow-gruvbox.theme
local M = {}

M.icon_theme = "Papirus-Dark"
M.font = "Terminus 10"
M.fg_normal = "#ebdbb2"
M.fg_focus = "#ebdbb2"
M.fg_urgent = "#fb4934"
M.fg_minimize = "#7c6f64"
M.bg_normal = "#202020"
M.bg_focus = "#3c3836"
M.border_width = dpi(2)
M.border_normal = "#282828"
M.border_focus = "#d79921"
M.menu_height = dpi(16)
M.menu_width = dpi(140)
M.menu_fg_normal = "#a89984"
M.taglist_fg_empty = "#a89984"
M.taglist_bg_focus = "#d79921"
M.taglist_fg_focus = "#202020"
M.tasklist_plain_task_name = true
M.tasklist_disable_icon = false
M.tasklist_font_minimized = "Terminus Oblique 10"
M.tasklist_fg_normal = "#a89984"
M.titlebar_fg_normal = "#a89984"
M.useless_gap = dpi(4)

M.menu_submenu_icon     = theme_path .. "/icons/submenu.png"
M.taglist_squares_sel   = theme_path .. "/icons/square_sel.png"
M.taglist_squares_unsel = theme_path .. "/icons/square_unsel.png"
M.layout_tile           = theme_path .. "/icons/tile.png"
M.layout_tileleft       = theme_path .. "/icons/tileleft.png"
M.layout_tilebottom     = theme_path .. "/icons/tilebottom.png"
M.layout_tiletop        = theme_path .. "/icons/tiletop.png"
M.layout_fairv          = theme_path .. "/icons/fairv.png"
M.layout_fairh          = theme_path .. "/icons/fairh.png"
M.layout_spiral         = theme_path .. "/icons/spiral.png"
M.layout_dwindle        = theme_path .. "/icons/dwindle.png"
M.layout_max            = theme_path .. "/icons/max.png"
M.layout_fullscreen     = theme_path .. "/icons/fullscreen.png"
M.layout_magnifier      = theme_path .. "/icons/magnifier.png"
M.layout_floating       = theme_path .. "/icons/floating.png"
M.layout_termfair       = theme_path .. "/icons/termfair.png"
M.layout_centerfair     = theme_path .. "/icons/centerfair.png"
M.layout_centerwork     = theme_path .. "/icons/centerwork.png"
M.layout_centerworkh    = theme_path .. "/icons/centerworkh.png"
M.widget_ac             = theme_path .. "/icons/ac.png"
M.widget_battery        = theme_path .. "/icons/battery.png"
M.widget_battery_low    = theme_path .. "/icons/battery_low.png"
M.widget_battery_empty  = theme_path .. "/icons/battery_empty.png"
M.widget_mem            = theme_path .. "/icons/mem.png"
M.widget_cpu            = theme_path .. "/icons/cpu.png"
M.widget_temp           = theme_path .. "/icons/temp.png"
M.widget_net            = theme_path .. "/icons/net.png"
M.widget_hdd            = theme_path .. "/icons/hdd.png"
M.widget_music          = theme_path .. "/icons/note.png"
M.widget_music_on       = theme_path .. "/icons/note_on.png"
M.widget_vol            = theme_path .. "/icons/vol.png"
M.widget_vol_low        = theme_path .. "/icons/vol_low.png"
M.widget_vol_no         = theme_path .. "/icons/vol_no.png"
M.widget_vol_mute       = theme_path .. "/icons/vol_mute.png"
M.widget_mail           = theme_path .. "/icons/mail.png"
M.widget_mail_on        = theme_path .. "/icons/mail_on.png"

M.titlebar_close_button_focus               = theme_path .. "/icons/titlebar/close_focus.png"
M.titlebar_close_button_normal              = theme_path .. "/icons/titlebar/close_normal.png"
M.titlebar_ontop_button_focus_active        = theme_path .. "/icons/titlebar/ontop_focus_active.png"
M.titlebar_ontop_button_normal_active       = theme_path .. "/icons/titlebar/ontop_normal_active.png"
M.titlebar_ontop_button_focus_inactive      = theme_path .. "/icons/titlebar/ontop_focus_inactive.png"
M.titlebar_ontop_button_normal_inactive     = theme_path .. "/icons/titlebar/ontop_normal_inactive.png"
M.titlebar_sticky_button_focus_active       = theme_path .. "/icons/titlebar/sticky_focus_active.png"
M.titlebar_sticky_button_normal_active      = theme_path .. "/icons/titlebar/sticky_normal_active.png"
M.titlebar_sticky_button_focus_inactive     = theme_path .. "/icons/titlebar/sticky_focus_inactive.png"
M.titlebar_sticky_button_normal_inactive    = theme_path .. "/icons/titlebar/sticky_normal_inactive.png"
M.titlebar_floating_button_focus_active     = theme_path .. "/icons/titlebar/floating_focus_active.png"
M.titlebar_floating_button_normal_active    = theme_path .. "/icons/titlebar/floating_normal_active.png"
M.titlebar_floating_button_focus_inactive   = theme_path .. "/icons/titlebar/floating_focus_inactive.png"
M.titlebar_floating_button_normal_inactive  = theme_path .. "/icons/titlebar/floating_normal_inactive.png"
M.titlebar_maximized_button_focus_active    = theme_path .. "/icons/titlebar/maximized_focus_active.png"
M.titlebar_maximized_button_normal_active   = theme_path .. "/icons/titlebar/maximized_normal_active.png"
M.titlebar_maximized_button_focus_inactive  = theme_path .. "/icons/titlebar/maximized_focus_inactive.png"
M.titlebar_maximized_button_normal_inactive = theme_path .. "/icons/titlebar/maximized_normal_inactive.png"

local markup = lain.util.markup
local separators = lain.util.separators

-- Textclock
local clock = awful.widget.watch(
  "date +'%a %d %b %R'",
  60,
  function(widget, stdout)
    widget:set_markup(" " .. markup.font(M.font, stdout))
  end
)

-- Calendar
M.cal = lain.widget.cal({
  attach_to = { clock },
  notification_preset = {
    font = "Terminus 10",
    fg = M.fg_normal,
    bg = M.bg_normal,
  },
})

-- MEM
local memicon = wibox.widget.imagebox(M.widget_mem)
local mem = lain.widget.mem({
  settings = function()
    widget:set_markup(markup.font(M.font, " " .. mem_now.used .. "MB "))
  end,
})

-- CPU
local cpuicon = wibox.widget.imagebox(M.widget_cpu)
local cpu = lain.widget.cpu({
  settings = function()
    widget:set_markup(markup.font(M.font, " " .. cpu_now.usage .. "% "))
  end,
})

-- Battery
local baticon = wibox.widget.imagebox(M.widget_battery)
local bat = lain.widget.bat({
  settings = function()
    if bat_now.status and bat_now.status ~= "N/A" then
      if bat_now.ac_status == 1 then
        baticon:set_image(M.widget_ac)
      elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
        baticon:set_image(M.widget_battery_empty)
      elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
        baticon:set_image(M.widget_battery_low)
      else
        baticon:set_image(M.widget_battery)
      end
      widget:set_markup(markup.font(M.font, " " .. bat_now.perc .. "% "))
    else
      widget:set_markup(markup.font(M.font, " AC "))
      baticon:set_image(M.widget_ac)
    end
  end,
})

-- ALSA/PulseAudio volume
local volicon = wibox.widget.imagebox(M.widget_vol)
M.volume = lain.widget.alsa({
  settings = function()
    if volume_now.status == "off" then
      volicon:set_image(M.widget_vol_mute)
    elseif tonumber(volume_now.level) == 0 then
      volicon:set_image(M.widget_vol_no)
    elseif tonumber(volume_now.level) <= 50 then
      volicon:set_image(M.widget_vol_low)
    else
      volicon:set_image(M.widget_vol)
    end

    widget:set_markup(markup.font(M.font, " " .. volume_now.level .. "% "))
  end,
})

M.volume.widget:buttons(awful.util.table.join(
  awful.button({}, 2, utils.toggle_mute),
  awful.button({}, 4, function()
    utils.increase_volume(1)
  end),
  awful.button({}, 5, function()
    utils.decrease_volume(1)
  end)
))

-- Separators
local spr = wibox.widget.textbox(" ")
local arrl_dl = separators.arrow_left(M.bg_focus, "alpha")
local arrl_ld = separators.arrow_left("alpha", M.bg_focus)

function M.at_screen_connect(s)
  -- Tags
  awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contains an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({}, 1, function() awful.layout.inc(1) end),
    awful.button({}, 2, function() awful.layout.set(awful.layout.layouts[1]) end),
    awful.button({}, 3, function() awful.layout.inc(-1) end),
    awful.button({}, 4, function() awful.layout.inc(1) end),
    awful.button({}, 5, function() awful.layout.inc(-1) end)
  ))
  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist(
    s,
    awful.widget.taglist.filter.all,
    awful.util.taglist_buttons
  )

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist(
    s,
    awful.widget.tasklist.filter.currenttags,
    awful.util.tasklist_buttons
  )

  -- Create the wibox
  s.mywibox = awful.wibar({
    position = "top",
    screen = s,
    height = dpi(18),
    bg = M.bg_normal,
    fg = M.fg_normal,
  })

  -- Add widgets to the wibox
  local function light_bg(widget)
    return wibox.container.background(widget, M.bg_focus)
  end
  s.mywibox:setup({
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      s.mytaglist,
      s.mypromptbox,
      spr,
    },
    s.mytasklist, -- Middle widget
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      spr,
      wibox.widget.systray(),
      spr,
      arrl_ld,
      light_bg(volicon),
      light_bg(M.volume.widget),
      arrl_dl,
      memicon,
      mem.widget,
      spr,
      cpuicon,
      cpu.widget,
      arrl_ld,
      light_bg(baticon),
      light_bg(bat.widget),
      arrl_dl,
      clock,
      spr,
      arrl_ld,
      light_bg(s.mylayoutbox),
    },
  })
end

return M
