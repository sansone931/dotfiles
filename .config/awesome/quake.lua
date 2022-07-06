local lain = require("lain")
local variables = require("variables")
local dpi = require("beautiful.xresources").apply_dpi

--- @module quake
local M = lain.util.quake({
  app = variables.terminal,
  argname = "--title %s",
  extra = "--class QuakeDD -e tmux new -A -s quake",
  border = dpi(1),
  height = dpi(675),
  width = dpi(1200),
  vert = "center",
  horiz = "center",
  followtag = true,
  overlap = true,
})

return M
