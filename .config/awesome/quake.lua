local lain = require("lain")
local variables = require("variables")

--- @module quake
local M = lain.util.quake({
  app = variables.terminal,
  argname = "--title %s",
  extra = "--class QuakeDD -e tmux new -A -s quake",
  border = 1,
  height = 675,
  width = 1200,
  vert = "center",
  horiz = "center",
  followtag = true,
  overlap = true,
})

return M
