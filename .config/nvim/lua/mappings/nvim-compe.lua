--- hrsh7th/nvim-compe
-- @module mappings.nvim-compe
local M = {}

function M.setup()
  local map = vim.api.nvim_set_keymap
  local opts = { silent = true, noremap = true, expr = true }

  map("i", "<C-Space>", "compe#complete()", opts)
  map("i", "<CR>", "compe#confirm(luaeval(\"require 'nvim-autopairs'.autopairs_cr()\"))", opts)
  map("i", "<C-e>", "compe#close('<C-e>')", opts)
  map("i", "<C-f>", "compe#scroll({ 'delta': +4 })", opts)
  map("i", "<C-d>", "compe#scroll({ 'delta': -4 })", opts)

  local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local function check_back_space()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
  end

  -- Use (s-)tab to:
  --  move to prev/next item in completion menuone
  --  jump to prev/next snippet's placeholder
  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-n>"
    elseif vim.fn['vsnip#available'](1) == 1 then
      return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
      return t "<Tab>"
    else
      return vim.fn['compe#complete']()
    end
  end
  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-p>"
    elseif vim.fn['vsnip#jumpable'](-1) == 1 then
      return t "<Plug>(vsnip-jump-prev)"
    else
      -- If <S-Tab> is not working in your terminal, change it to <C-h>
      return t "<S-Tab>"
    end
  end

  map("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
  map("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
  map("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
  map("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
end

return M
