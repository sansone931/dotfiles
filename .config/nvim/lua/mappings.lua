local wk = require("which-key")
local map = vim.api.nvim_set_keymap

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

vim.g.mapleader = t"<Space>"

local opts = {
  silent = {silent = true},
  noremap = {silent = true, noremap = true},
  expr = {silent = true, noremap = true, expr = true},
  expr_nowait = {silent = true, noremap = true, expr = true, nowait = true},
}

-- Better indenting
map("v", "<", "<gv", opts.noremap)
map("v", ">", ">gv", opts.noremap)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts.noremap)
map("n", "<C-j>", "<C-w>j", opts.noremap)
map("n", "<C-k>", "<C-w>k", opts.noremap)
map("n", "<C-l>", "<C-w>l", opts.noremap)

-- Use ctrl + arrows to resize windows
map("n", "<C-Up>", "<Cmd>resize -2<CR>", opts.noremap)
map("n", "<C-Down>", "<Cmd>resize +2<CR>", opts.noremap)
map("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", opts.noremap)
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", opts.noremap)

-- lewis6991/gitsigns.nvim
map("n", "[g", '<Cmd>lua require("gitsigns.actions").prev_hunk()<CR>', opts.noremap)
map("n", "]g", '<Cmd>lua require("gitsigns.actions").next_hunk()<CR>', opts.noremap)
map("o", "ih", '<Cmd>lua require("gitsigns.actions").select_hunk()<CR>', opts.noremap)
map("x", "ih", '<Cmd>lua require("gitsigns.actions").select_hunk()<CR>', opts.noremap)

-- {{{ romgrk/barbar.nvim
map("n", "<Tab>", "<Cmd>BufferNext<CR>", opts.noremap)
map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts.noremap)
map("n", "<A-k>", "<Cmd>BufferNext<CR>", opts.noremap)
map("n", "<A-j>", "<Cmd>BufferPrevious<CR>", opts.noremap)
map("n", "<A-h>", "<Cmd>BufferMovePrevious<CR>", opts.noremap)
map("n", "<A-l>", "<Cmd>BufferMoveNext<CR>", opts.noremap)
map("n", "<S-q>", "<Cmd>BufferClose<CR>", opts.noremap)
-- }}}

-- {{{ kyazdani42/nvim-tree.lua
local tree_cb = require("nvim-tree.config").nvim_tree_callback

vim.g.nvim_tree_bindings = {
  {key = "l", cb = tree_cb("edit")},
  {key = "h", cb = tree_cb("close_node")},
}
-- }}}

-- {{{ Single key mappings
wk.register({
  ["/"] = {"<Cmd>CommentToggle<CR>" , "toggle comment" },
  e     = {"<Cmd>NvimTreeToggle<CR>", "toggle explorer"},
  n     = {"<Cmd>let @/ = ''<CR>"   , "no highlight"   },
}, {prefix = "<Leader>"})

wk.register({
  ["/"] = {":CommentToggle<CR>", "toggle comment"},
}, {mode = "v", prefix = "<Leader>"})
-- }}}

-- {{{ neovim/nvim-lspconfig
map("n", "<S-k>", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts.noremap)
map("n", "[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts.noremap)
map("n", "]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts.noremap)

wk.register({
  l = {
    name = "lsp",
    a = {"<Cmd>lua vim.lsp.buf.code_action()<CR>"                 , "code action"     },
    d = {"<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "line diagnostics"},
    f = {"<Cmd>lua vim.lsp.buf.formatting()<CR>"                  , "format"          },
    r = {"<Cmd>lua vim.lsp.buf.rename()<CR>"                      , "rename"          },
    q = {"<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>"          , "quickfix"        },
  },
}, {prefix = "<Leader>"})

wk.register({
  l = {
    name = "lsp",
    a = {":lua vim.lsp.buf.range_code_action()<CR>", "code action"},
    f = {":lua vim.lsp.buf.range_formatting()<CR>" , "format"     },
  },
}, {mode = "v", prefix = "<Leader>"})

wk.register({
  d = {"<Cmd>lua vim.lsp.buf.definition()<CR>"     , "definition"     },
  D = {"<Cmd>lua vim.lsp.buf.declaration()<CR>"    , "declaration"    },
  i = {"<Cmd>lua vim.lsp.buf.implementation()<CR>" , "implementation" },
  r = {"<Cmd>lua vim.lsp.buf.references()<CR>"     , "references"     },
  y = {"<Cmd>lua vim.lsp.buf.type_definition()<CR>", "type definition"},
}, {prefix = "g"})
-- }}}

-- {{{ mfussenegger/nvim-dap
local function close_debugger()
  local dap = require("dap")
  dap.disconnect()
  dap.close()
end

local function set_conditional_breakpoint()
  require("dap").set_breakpoint(
    vim.fn.input('Breakpoint condition: ')
  )
end

wk.register({
  d = {
    name = "debug",
    b = {'<Cmd>lua require("dap").toggle_breakpoint()<CR>' , "breakpoint"            },
    B = {set_conditional_breakpoint                        , "conditional breakpoint"},
    c = {'<Cmd>lua require("dap").run_to_cursor()<CR>'     , "run to cursor"         },
    d = {'<Cmd>lua require("dap").continue()<CR>'          , "continue"              },
    h = {'<Cmd>lua require("dap.ui.variables").hover()<CR>', "show hover"            },
    i = {'<Cmd>lua require("dap").step_into()<CR>'         , "step into"             },
    l = {'<Cmd>lua require("dap").run_last()<CR>'          , "run last"              },
    o = {'<Cmd>lua require("dap").step_over()<CR>'         , "step over"             },
    O = {'<Cmd>lua require("dap").step_out()<CR>'          , "step out"              },
    q = {close_debugger                                    , "stop"                  },
    w = {'<Cmd>lua require("dapui").toggle()<CR>'          , "toggle debugger ui"    },
  },
}, {prefix = "<Leader>"})
-- }}}

-- {{{ nvim-telescope/telescope.nvim
wk.register({
  f = {
    name = "telescope",
    ["/"] = {"<Cmd>Telescope search_history<CR>", "history"     },
    b     = {"<Cmd>Telescope buffers<CR>"       , "buffers"     },
    c     = {"<Cmd>Telescope treesitter<CR>"    , "treesitter"  },
    f     = {"<Cmd>Telescope find_files<CR>"    , "files"       },
    g     = {"<Cmd>Telescope git_status<CR>"    , "git status"  },
    h     = {"<Cmd>Telescope oldfiles<CR>"      , "file history"},
    s     = {"<Cmd>Telescope treesitter<CR>"    , "symbols"     },
    t     = {"<Cmd>Telescope live_grep<CR>"     , "text"        },
  },
}, {prefix = "<Leader>"})
-- }}}

-- {{{ tpope/vim-fugitive
wk.register({
  g = {
    name = "+git",
    d = {"<Cmd>Gdiffsplit<CR>", "diff split"     },
    B = {"<Cmd>G blame<CR>"   , "blame"          },
    g = {"<Cmd>G<CR>"         , "status"         },
    x = {"<Cmd>GBrowse<CR>"   , "show in browser"},
  },
}, {prefix = "<Leader>"})
-- }}}

-- {{{ lewis6991/gitsigns.nvim
wk.register({
  g = {
    name = "+git",
    s = {'<Cmd>lua require("gitsigns").stage_hunk()<CR>'     , "stage hunk"     },
    u = {'<cmd>lua require("gitsigns").undo_stage_hunk()<CR>', "undo stage hunk"},
    p = {'<cmd>lua require("gitsigns").preview_hunk()<CR>'   , "preview hunk"   },
    r = {'<cmd>lua require("gitsigns").reset_hunk()<CR>'     , "reset hunk"     },
    R = {'<cmd>lua require("gitsigns").reset_buffer()<CR>'   , "reset buffer"   },
    b = {'<cmd>lua require("gitsigns").blame_line(true)<CR>' , "blame line"     },
  },
}, {prefix = "<Leader>"})

wk.register({
  g = {
    name = "+git",
    s = {'<cmd>lua require("gitsigns").stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', "stage hunk"},
    r = {'<cmd>lua require("gitsigns").reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', "reset hunk"},
  },
}, {mode = "v", prefix = "<Leader>"})
-- }}}

-- {{{ hrsh7th/nvim-compe
map("i", "<C-Space>", "compe#complete()", opts.expr)
map("i", "<CR>", "compe#confirm(luaeval(\"require 'nvim-autopairs'.autopairs_cr()\"))", opts.expr)
map("i", "<C-e>", "compe#close('<C-e>')", opts.expr)
map("i", "<C-f>", "compe#scroll({ 'delta': +4 })", opts.expr)
map("i", "<C-d>", "compe#scroll({ 'delta': -4 })", opts.expr)

local check_back_space = function()
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

map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- }}}
