

" Add numbers to each line on the left-hand side.
set number

set relativenumber

set laststatus=0
"set statusline+=%#LineNr#

"set clipboard=unnamedplus

" Turn syntax highlighting on.
syntax on

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

set clipboard=unnamed

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set wrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

set encoding=UTF-8

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

let mapleader=" "

map J 0
map K $
map R :source $MYVIMRC<CR>
map S :w<CR>
map sh :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map sj :set splitright<CR>:split<CR>
map sk :set nosplitright<CR>:split<CR>

map <LEADER>/ :!
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>
map <LEADER><CR> :nohlsearch<CR>		
map <LEADER>q :q<CR>
map <LEADER>t :NERDTreeToggle<CR>
map <LEADER>f :FZF<CR>
map <LEADER>u :UndotreeToggle<CR>
map <LEADER>x :Colors<CR>
map <LEADER>n :e ~/.local/share/nvim/plugged/vim-snippets/UltiSnips/tex.snippets<CR>

map <LEADER>wf <C-w>l
map <LEADER>we <C-w>k
map <LEADER>wd <C-w>j
map <LEADER>ws <C-w>h

vnoremap Y "+y
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>

imap ,a <esc>A
imap ,d <esc>ji
imap ,e <esc>ki
imap ,s <esc>ha
imap ,f <esc>la
imap ,q <esc>0i
imap jj <esc> 
source $HOME/.config/nvim/latex-key.vim

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround' 
Plug 'Chiel92/vim-autoformat'
"Plug 'doy/vim-autobrace'
Plug 'w0rp/ale'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kshenoy/vim-signature'
Plug 'mbbill/undotree'
"Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'ryanoasis/vim-devicons'
""Plug 'neovim/nvim-lspconfig'
""Plug 'williamboman/nvim-lsp-installer'

"Plug 'ludovicchabant/vim-gutentags'
"Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
"Plug 'dcampos/nvim-snippy'
call plug#end()

colorscheme gruvbox
set background=dark 
hi Visual term=reverse cterm=reverse guibg=Grey

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_imaps_leader = "'"
let maplocalleader = " "

"easymotion
let g:EasyMotion_do_mapping = 0
nmap <LEADER>c <Plug>(easymotion-overwin-f2)
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'


"spell check
set spell spelllang=en_us
set nospell
nmap <LEADER>p :set nospell<CR>
nmap <LEADER>o :set spell<CR>

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

let g:fzf_colors = {
\ 'fg':      ['fg', 'Normal'],   
\ 'bg':      ['bg', 'Normal'],   
\ 'hl':      ['fg', 'Comment'],   
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],   
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],   
\ 'hl+':     ['fg', 'Statement'],   
\ 'info':    ['fg', 'PreProc'],   
\ 'border':  ['fg', 'Ignore'],   
\ 'prompt':  ['fg', 'Conditional'],   
\ 'pointer': ['fg', 'Exception'],   
\ 'marker':  ['fg', 'Keyword'],   
\ 'spinner': ['fg', 'Label'],   
\ 'header':  ['fg', 'Comment'] } 

let g:which_key_use_floating_win = 0
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'sharp' } }

