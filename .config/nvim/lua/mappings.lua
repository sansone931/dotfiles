local map = vim.api.nvim_set_keymap

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

-- {{{ folke/which-key.nvim
local wk = require("which-key")

vim.g.mapleader = vim.api.nvim_replace_termcodes("<Space>", true, true, true)

-- Single key mappings
wk.register({
  ["/"] = {"<Cmd>CommentToggle<CR>" , "toggle comment" },
  e     = {"<Cmd>NvimTreeToggle<CR>", "toggle explorer"},
  n     = {"<Cmd>let @/ = ''<CR>"   , "no highlight"   },
}, {prefix = "<Leader>"})

wk.register({
  ["/"] = {":CommentToggle<CR>" , "toggle comment" },
}, {mode = "v", prefix = "<Leader>"})

-- neoclide/coc.nvim
wk.register({
  c = {
    name = "coc",
    ["."] = {"<Cmd>CocConfig<CR>"               , "config"            },
    [";"] = {"<Plug>(coc-refactor)"             , "refactor"          },
    a     = {"<Plug>(coc-codeaction-line)"      , "code action (line)"},
    A     = {"<Plug>(coc-codeaction)"           , "code action (file)"},
    b     = {"<Cmd>CocNext<CR>"                 , "next action"       },
    B     = {"<Cmd>CocPrev<CR>"                 , "prev action"       },
    c     = {"<Cmd>CocList commands<CR>"        , "commands"          },
    d     = {"<Plug>(coc-definition)"           , "definition"        },
    D     = {"<Plug>(coc-declaration)"          , "declaration"       },
    e     = {"<Cmd>CocList extensions<CR>"      , "extensions"        },
    f     = {"<Plug>(coc-format)"               , "format"            },
    h     = {"<Plug>(coc-float-hide)"           , "hide"              },
    i     = {"<Plug>(coc-implementation)"       , "implementation"    },
    I     = {"<Cmd>CocList diagnostics<CR>"     , "diagnostics"       },
    j     = {"<Plug>(coc-float-jump)"           , "float jump"        },
    l     = {"<Plug>(coc-codelens-action)"      , "code lens"         },
    n     = {"<Plug>(coc-diagnostic-next)"      , "next diagnostic"   },
    N     = {"<Plug>(coc-diagnostic-next-error)", "next error"        },
    o     = {"<Cmd>CocList outline<CR>"         , "search outline"    },
    p     = {"<Plug>(coc-diagnostic-prev)"      , "prev diagnostic"   },
    P     = {"<Plug>(coc-diagnostic-prev-error)", "prev error"        },
    q     = {"<Plug>(coc-fix-current)"          , "quickfix"          },
    r     = {"<Plug>(coc-references)"           , "references"        },
    R     = {"<Plug>(coc-rename)"               , "rename"            },
    s     = {"<Cmd>CocList -I symbols<CR>"      , "references"        },
    S     = {"<Cmd>CocList snippets<CR>"        , "snippets"          },
    t     = {"<Plug>(coc-type-definition)"      , "type definition"   },
    u     = {"<Cmd>CocListResume<CR>"           , "resume list"       },
    U     = {"<Cmd>CocUpdate<CR>"               , "update CoC"        },
    z     = {"<Cmd>CocDisable<CR>"              , "disable CoC"       },
    Z     = {"<Cmd>CocEnable<CR>"               , "enable CoC"        },
  },
},{prefix = "<Leader>"})

-- puremourning/vimspector
wk.register({
  d = {
    name = "debug",
    b = {"<Plug>VimspectorToggleBreakpoint"           , "breakpoint"            },
    B = {"<Plug>VimspectorToggleConditionalBreakpoint", "conditional breakpoint"},
    c = {"<Plug>VimspectorRunToCursor"                , "run to cursor"         },
    d = {"<Plug>VimspectorContinue"                   , "continue"              },
    f = {"<Plug>VimspectorAddFunctionBreakpoint"      , "function breakpoint"   },
    o = {"<Plug>VimspectorStepOver"                   , "step over"             },
    O = {"<Plug>VimspectorStepOut"                    , "step out"              },
    i = {"<Plug>VimspectorStepInto"                   , "step into"             },
    p = {"<Plug>VimspectorPause"                      , "pause"                 },
    r = {"<Plug>VimspectorRestart"                    , "restart"               },
    s = {"<Plug>VimspectorStop"                       , "stop"                  },
    q = {"<Cmd>VimspectorReset<CR>"                   , "close debugger"        },
  },
}, {prefix = "<Leader>"})

wk.register({
  d = {
    e = {":VimspectorEval<Space>"      , "send console command" },
    w = {":VimspectorWatch<Space>"     , "watch expression"     },
    W = {":VimspectorShowOutput<Space>", "select output channel"},
  }
}, {prefix = "<Leader>", silent = false})

-- nvim-telescope/telescope.nvim
wk.register({
  f = {
    name = "telescope",
    ["/"] = {"<Cmd>Telescope search_history<CR>", "history"     },
    b     = {"<Cmd>Telescope buffers<CR>"       , "buffers"     },
    c     = {"<Cmd>Telescope treesitter<CR>"    , "treesitter"  },
    f     = {"<Cmd>Telescope find_files<CR>"    , "files"       },
    h     = {"<Cmd>Telescope oldfiles<CR>"      , "file history"},
    s     = {"<Cmd>Telescope treesitter<CR>"    , "symbols"     },
    t     = {"<Cmd>Telescope live_grep<CR>"     , "text"        },
  },
}, {prefix = "<Leader>"})

-- tpope/vim-fugitive
wk.register({
  g = {
    name = "+git",
    d = {"<Cmd>Gdiffsplit<CR>", "diff split"},
    B = {"<Cmd>G blame<CR>"   , "blame"     },
    g = {"<Cmd>G<CR>"         , "status"    },
  },
}, {prefix = "<Leader>"})

-- lewis6991/gitsigns.nvim
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

-- {{{ neoclide/coc.nvim
-- Use tab for trigger completion with characters ahead and navigate.
map("i", "<Tab>", [[pumvisible() ? "\<C-n>" : Check_back_space() ? "\<Tab>" : coc#refresh()]], opts.expr)
map("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<C-h>"]], opts.expr)

vim.cmd [[
  function! Check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
]]

-- Use <c-space> to trigger completion.
map("i", "<c-space>", "coc#refresh()", opts.expr)

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <CR> could be remapped by other vim plugin
map("i", "<CR>", [[pumvisible() ? coc#_select_confirm() : ]] ..  [["\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts.expr)

-- Use `[c` and `]c` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location
-- list.
map("n", "[c", "<Plug>(coc-diagnostic-prev)", opts.silent)
map("n", "]c", "<Plug>(coc-diagnostic-next)", opts.silent)

-- GoTo code navigation.
map("n", "gd", "<Plug>(coc-definition)", opts.silent)
map("n", "gy", "<Plug>(coc-type-definition)", opts.silent)
map("n", "gi", "<Plug>(coc-implementation)", opts.silent)
map("n", "gr", "<Plug>(coc-references)", opts.silent)

-- Use K to show documentation in preview window.
map("n", "K", "<Cmd>call Show_documentation()<CR>", opts.noremap)

vim.cmd [[
  function! Show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction
]]

-- Formatting selected code.
map("x", "<Leader>cf", "<Plug>(coc-format-selected)", opts.silent)

-- Applying codeAction to the selected region.
map("x", "<Leader>ca", "<Plug>(coc-codeaction-selected)", opts.silent)

-- Remap <C-f> and <C-b> for scroll float windows/popups.
map("n", "<C-f>", [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]], opts.expr_nowait)
map("n", "<C-b>", [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]], opts.expr_nowait)

map("i", "<C-f>", [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<CR>" : "\<Right>"]], opts.expr_nowait)
map("i", "<C-b>", [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<CR>" : "\<Left>"]], opts.expr_nowait)

map("v", "<C-f>", [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]], opts.expr_nowait)
map("v", "<C-b>", [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]], opts.expr_nowait)
-- }}}
