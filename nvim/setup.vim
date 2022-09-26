set relativenumber "use relative line numbers
set number "add line numbers

set clipboard=unnamedplus "use system clipboard
set ttyfast
set spell "spell checking
filetype indent plugin on
syntax enable
syntax on 

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set nowrap
set noswapfile

set incsearch

set scrolloff=8
set signcolumn=yes

set mouse=nv

set updatetime=100

set nobackup
set nowritebackup

let g:ale_disable_lsp = 1

call plug#begin("~/.vim/plugged")
    Plug 'dracula/vim'
    Plug 'morhetz/gruvbox'
    "Plug 'sainnhe/gruvbox-material'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'jiangmiao/auto-pairs'
    Plug 'luochen1990/rainbow'
    Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'skywind3000/asyncrun.vim'
    Plug 'vhdirk/vim-cmake'
    Plug 'irrationalistic/vim-tasks'
    Plug 'tpope/vim-fugitive'
    Plug 'liuchengxu/vista.vim'
    Plug 'dense-analysis/ale'
    Plug 'OmniSharp/omnisharp-vim'
call plug#end()

set termguicolors
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox
hi CocMenuSel guibg = #7c6f64
hi LspCxxHlGroupMemberVariable guifg=#83a598

let mapleader = " "

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader><A-h> <C-W>H
nnoremap <leader><A-j> <C-W>J
nnoremap <leader><A-k> <C-W>K
nnoremap <leader><A-l> <C-W>L

imap <buffer> <C-h> <Left>
imap <buffer> <C-j> <Down>
imap <buffer> <C-k> <Up>
imap <buffer> <C-l> <Right>

nnoremap <silent> <C-p> :FZF<CR>

" move line
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

" move visually selected block
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <A-j> <Esc>:m .+1<CR>==
nnoremap <A-k> <Esc>:m .-2<CR>==

:inoremap cc <Esc>

filetype plugin on

let g:ale_linters = { 'cs': ['OmniSharp'] }

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ CheckBackspace() ? "\<TAB>" :
      "\ coc#refresh()

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

nmap <silent> <leader>a :<C-u>CocList diagnostics<CR>

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:asyncrun_open = 4

let g:TasksDateFormat = '%m/%d/%Y %r'

let g:vista_default_executive = 'coc'

nnoremap <C-v> :Vista!!

