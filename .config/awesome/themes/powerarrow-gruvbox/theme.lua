local gears     = require("gears")
local lain      = require("lain")
local awful     = require("awful")
local beautiful = require("beautiful")
local wibox     = require("wibox")
local dpi       = require("beautiful.xresources").apply_dpi

local os = os

local gfs = require("gears.filesystem")
local theme_path = gfs.get_configuration_dir() .. "themes/powerarrow-gruvbox"

local theme                                     = {}
theme.icon_theme                                = "Papirus-Dark"
theme.font                                      = "Terminus 10"
theme.fg_normal                                 = "#fbf1c7"
theme.fg_focus                                  = "#fe8019"
theme.fg_urgent                                 = "#fb4934"
theme.fg_minimize                               = "#7c6f64"
theme.bg_normal                                 = "#282828"
theme.bg_focus                                  = "#3c3836"
theme.border_width                              = dpi(2)
theme.border_normal                             = "#3c3836"
theme.border_focus                              = "#b57614"
theme.border_marked                             = "#9d0006"
theme.tasklist_bg_focus                         = "#3c3836"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.menu_submenu_icon                         = theme_path .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme_path .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme_path .. "/icons/square_unsel.png"
theme.layout_tile                               = theme_path .. "/icons/tile.png"
theme.layout_tileleft                           = theme_path .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme_path .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme_path .. "/icons/tiletop.png"
theme.layout_fairv                              = theme_path .. "/icons/fairv.png"
theme.layout_fairh                              = theme_path .. "/icons/fairh.png"
theme.layout_spiral                             = theme_path .. "/icons/spiral.png"
theme.layout_dwindle                            = theme_path .. "/icons/dwindle.png"
theme.layout_max                                = theme_path .. "/icons/max.png"
theme.layout_fullscreen                         = theme_path .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme_path .. "/icons/magnifier.png"
theme.layout_floating                           = theme_path .. "/icons/floating.png"
theme.layout_termfair                           = theme_path .. "/icons/termfair.png"
theme.layout_centerfair                         = theme_path .. "/icons/centerfair.png"
theme.layout_centerwork                         = theme_path .. "/icons/centerwork.png"
theme.layout_centerworkh                        = theme_path .. "/icons/centerworkh.png"
theme.widget_ac                                 = theme_path .. "/icons/ac.png"
theme.widget_battery                            = theme_path .. "/icons/battery.png"
theme.widget_battery_low                        = theme_path .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme_path .. "/icons/battery_empty.png"
theme.widget_mem                                = theme_path .. "/icons/mem.png"
theme.widget_cpu                                = theme_path .. "/icons/cpu.png"
theme.widget_temp                               = theme_path .. "/icons/temp.png"
theme.widget_net                                = theme_path .. "/icons/net.png"
theme.widget_hdd                                = theme_path .. "/icons/hdd.png"
theme.widget_music                              = theme_path .. "/icons/note.png"
theme.widget_music_on                           = theme_path .. "/icons/note_on.png"
theme.widget_vol                                = theme_path .. "/icons/vol.png"
theme.widget_vol_low                            = theme_path .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme_path .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme_path .. "/icons/vol_mute.png"
theme.widget_mail                               = theme_path .. "/icons/mail.png"
theme.widget_mail_on                            = theme_path .. "/icons/mail_on.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = dpi(4)
theme.titlebar_close_button_focus               = theme_path .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme_path .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme_path .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme_path .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme_path .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme_path .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme_path .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme_path .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme_path .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme_path .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme_path .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme_path .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme_path .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme_path .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme_path .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme_path .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme_path .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme_path .. "/icons/titlebar/maximized_normal_inactive.png"

local markup = lain.util.markup
local separators = lain.util.separators

local keyboardlayout = awful.widget.keyboardlayout:new()

-- Textclock
local clock = awful.widget.watch(
    "date +'%a %d %b %R'", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
    end
)

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = "Terminus 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
    end
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
    end
})

-- / fs
local fsicon = wibox.widget.imagebox(theme.widget_hdd)
-- commented because it needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Terminus 10" },
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. fs_now["/"].percentage .. "% "))
    end
})

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                baticon:set_image(theme.widget_ac)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                baticon:set_image(theme.widget_battery_empty)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                baticon:set_image(theme.widget_battery_low)
            else
                baticon:set_image(theme.widget_battery)
            end
            widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
        else
            widget:set_markup(markup.font(theme.font, " AC "))
            baticon:set_image(theme.widget_ac)
        end
    end
})

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volicon:set_image(theme.widget_vol_mute)
        elseif tonumber(volume_now.level) == 0 then
            volicon:set_image(theme.widget_vol_no)
        elseif tonumber(volume_now.level) <= 50 then
            volicon:set_image(theme.widget_vol_low)
        else
            volicon:set_image(theme.widget_vol)
        end

        widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
    end
})
theme.volume.widget:buttons(awful.util.table.join(
     awful.button({}, 2, function ()
           os.execute(string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel))
           theme.volume.update()
     end),
     awful.button({}, 4, function ()
           os.execute(string.format("amixer -q set %s 1%%+", beautiful.volume.channel))
           theme.volume.update()
     end),
     awful.button({}, 5, function ()
           os.execute(string.format("amixer -q set %s 1%%-", beautiful.volume.channel))
           theme.volume.update()
     end)
))

-- Net
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.font(theme.font,
                          markup("#b8bb26", " " .. string.format("%06.1f", net_now.received))
                          .. " " ..
                          markup("#83a598", " " .. string.format("%06.1f", net_now.sent) .. " ")))
    end
})

-- Separators
local spr     = wibox.widget.textbox(' ')
local arrl_dl = separators.arrow_left(theme.bg_focus, "alpha")
local arrl_ld = separators.arrow_left("alpha", theme.bg_focus)

function theme.at_screen_connect(s)
    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(18), bg = theme.bg_normal, fg = theme.fg_normal, opacity = 0.9 })


    -- Add widgets to the wibox
    local function light_bg(widget) return wibox.container.background(widget, theme.bg_focus) end
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --spr,
            s.mytaglist,
            s.mypromptbox,
            spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            keyboardlayout,
            spr,
            arrl_ld,
            light_bg(volicon),
            light_bg(theme.volume.widget),
            arrl_dl,
            memicon,
            mem.widget,
            arrl_ld,
            light_bg(cpuicon),
            light_bg(cpu.widget),
            arrl_dl,
            tempicon,
            temp.widget,
            arrl_ld,
            light_bg(fsicon),
            light_bg(theme.fs.widget),
            arrl_dl,
            baticon,
            bat.widget,
            arrl_ld,
            light_bg(neticon),
            light_bg(net.widget),
            arrl_dl,
            clock,
            spr,
            arrl_ld,
            light_bg(s.mylayoutbox),
        },
    }
end

return theme
