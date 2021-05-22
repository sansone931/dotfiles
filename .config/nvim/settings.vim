autocmd FileType * set formatoptions-=c formatoptions-=r formatoptions-=o

set clipboard=unnamedplus
set cmdheight=2
set colorcolumn=80
set cursorline
set diffopt+=vertical
set expandtab
set hidden
set ignorecase
set list
set mouse=a
set noshowmode
set nowrap
set number
set relativenumber
set shiftwidth=2
set shortmess+=c
set showtabline=2
set signcolumn=yes
set smartcase
set smartindent
set softtabstop=2
set splitbelow
set splitright
set termguicolors
set timeoutlen=500
set updatetime=300

" Some coc servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" nvim-treesitter folding
set foldmethod=expr
set nofoldenable
set foldexpr=nvim_treesitter#foldexpr()

" Nvim providers
let g:python3_host_prog = "/usr/bin/python"
let g:node_host_prog = "/usr/lib/node_modules/neovim/bin/cli.js"
