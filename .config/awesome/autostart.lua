local awful = require("awful")

--- XDG autostart
-- @module autostart
local M = {}

function M.setup()
  awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;'
      .. 'xrdb -merge <<< "awesome.started:true";'
      .. "dex --environment Awesome --autostart"
  )
end

return M
