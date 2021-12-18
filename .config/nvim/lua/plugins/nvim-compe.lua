--- hrsh7th/nvim-compe
-- @module plugins.nvim-compe
local M = {}

function M.setup()
  require("compe").setup({
    source = {
      path = { kind = "   (Path)" },
      buffer = { kind = "   (Buffer)" },
      calc = { kind = "   (Calc)" },
      nvim_lsp = { kind = "   (LSP)" },
      nvim_lua = true,
      spell = { kind = "   (Spell)" },
      emoji = { kind = " ﲃ  (Emoji)", filetypes = { "markdown", "text" } },
    },
  })

  require("mappings.nvim-compe").setup()
end

return M
