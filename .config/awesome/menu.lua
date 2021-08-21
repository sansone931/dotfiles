local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local freedesktop = require("freedesktop")
local menubar = require("menubar")

local variables = require("variables")

-- Quit menu
local quit_menu = awful.menu({
  items = {
    {
      "quit awesome",
      function()
        awesome.quit()
      end,
    },
  },
})

--- @module menu
local M = {
  quit_menu = quit_menu,
}

-- Main menu
function M.setup_main_menu()
  local main_menu = {
    {
      "hotkeys",
      function()
        return false, hotkeys_popup.show_help
      end,
    },
    {
      "edit config",
      string.format(
        "%s -e %s %s",
        variables.terminal,
        variables.editor,
        awesome.conffile
      ),
    },
    { "restart", awesome.restart },
    {
      "quit",
      function()
        quit_menu:show()
      end,
    },
  }

  awful.util.mymainmenu = freedesktop.menu.build({
    icon_size = beautiful.menu_height or dpi(16),
    before = {
      { "Awesome", main_menu, beautiful.awesome_icon },
    },
    after = {
      { "Open terminal", variables.terminal },
    },
  })

  menubar.utils.terminal = variables.terminal
end

-- Client menu
local client_menu_instance = nil
function M.toggle_client_menu(c)
  if client_menu_instance and client_menu_instance.wibox.visible then
    client_menu_instance:hide()
    client_menu_instance = nil
  else
    client_menu_instance = awful.menu({
      items = {
        {
          "Close " .. c.name,
          function()
            c:kill()
          end,
          c.icon,
        },
      },
      theme = { width = dpi(250) },
    })
    client_menu_instance:show()
  end
end

return M
