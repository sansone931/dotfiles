-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Required external libraries:
-- https://github.com/lcpz/lain
-- https://github.com/lcpz/awesome-freedesktop

local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")

require("theme").setup()
require("menu").setup_main_menu()

awful.util.terminal = require("variables").terminal
awful.util.tagnames = { "1", "2", "3", "4", "5" }

awful.util.taglist_buttons = require("mappings.taglist-buttons")
awful.util.tasklist_buttons = require("mappings.tasklist-buttons")

-- Layout
require("layout").setup()

-- Global mappings
require("mappings").setup_global_mappings()

-- Screen
awful.screen.connect_for_each_screen(function(s)
  beautiful.at_screen_connect(s)
end)

-- Rules
require("rules").setup()

-- Signals
require("signals").setup()
