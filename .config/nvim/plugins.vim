" {{{ Main vim-plug config
call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'junegunn/vim-plug'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'liuchengxu/vim-which-key'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'puremourning/vimspector'

call plug#end()

" Install vim-plug if not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
" }}}

" {{{ morhetz/gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_invert_selection = 0
colorscheme gruvbox
autocmd VimEnter * highlight Normal guibg=NONE ctermbg=NONE
" }}}

" {{{ vim-airline/vim-airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" }}}

" {{{ kyazdani42/nvim-tree.lua
let g:nvim_tree_width = 35
let g:nvim_tree_ignore = ['.git', 'node_modules', '.cache']
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_special_files = []

let g:nvim_tree_icons = {
  \ 'default': '',
  \ 'symlink': '',
  \ 'git': {
  \   'unstaged': "M",
  \   'staged': "A",
  \   'unmerged': "C",
  \   'renamed': "R",
  \   'untracked': "U",
  \   'deleted': "D",
  \   'ignored': "",
  \   },
  \ }
" }}}

" {{{ nvim-telescope/telescope.nvim
lua << EOF
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "*.lock",
    }
  }
}
EOF
" }}}

" {{{ unblevable/quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#458588' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#cc241d' gui=underline ctermfg=81 cterm=underline
" }}}

" {{{ airblade/vim-gitgutter
let g:gitgutter_map_keys = 0
" }}}

" {{{ js,jsx,ts,tsx syntax
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
" }}}

" {{{ vim-python/python-syntax
let g:python_highlight_all = 1
" }}}

" {{{ nvim-treesitter/nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- Modules and its options go here
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
}
EOF
" }}}

" {{{ puremourning/vimspector
let g:vimspector_install_gadgets = [
  \ 'debugger-for-chrome',
  \ 'vscode-node-debug2',
  \ 'debugpy',
  \ ]
" }}}
