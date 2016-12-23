"""""""""""""""""""
"""odedlaz vimrc"""
"""""""""""""""""""

runtime! plugin/sensible.vim
set encoding=utf-8
set shell=/usr/bin/zsh

if &compatible
  set nocompatible
endif

let mapleader = ","

"""""""""""""
"""plugins"""
"""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <S-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <S-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <S-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <S-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>



Plug 'gcmt/wildfire.vim'
map <SPACE> <Plug>(wildfire-fuel)
vmap <C-SPACE> <Plug>(wildfire-water)

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase = 1
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'octref/RootIgnore'
nnoremap <leader>nt :NERDTreeToggle<cr>
"opens nerdtree automatically when a directory is opened using vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"disable the builtin, bloated netrw plugin. We don’t need two filebrowsers.
let loaded_netrwPlugin=1
"let NERDTree respect the vim wildignore setting
"Rootignore converts .gitignore into wildignore
"thus making NERDTree respect gitignore!
let NERDTreeRespectWildIgnore=1
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"make sure files run in the right directory
nnoremap <c-p> :execute ':Files ' projectroot#guess()<cr>
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

Plug 'dyng/ctrlsf.vim'
nnoremap <c-t> :CtrlSF<Space>
nnoremap <leader>ct :CtrlSFToggle<cr>

Plug 'troydm/zoomwintab.vim'
nnoremap <leader>z :ZoomWinTabToggle<cr>

Plug 'janko-m/vim-test'
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tv :TestVisit<CR>

Plug 'neomake/neomake'
autocmd! BufWritePost * Neomake
let g:neomake_go_enabled_makers = ['golint', 'govet', 'errcheck']
let g:neomake_python_enabled_makers = ['python', 'pyflakes', 'pep8', 'flake8']

Plug 'fatih/vim-go'
let g:go_fmt_command = "goimports"

Plug 'Valloric/YouCompleteMe'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path='python'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'jmcantrell/vim-virtualenv'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

Plug 'flazz/vim-colorschemes'
Plug 'joshdick/onedark.vim'

Plug 'tComment'
Plug 'tpope/vim-sensible'
Plug 'godlygeek/tabular'
Plug 'osyo-manga/vim-over'
Plug 'ervandew/supertab'
Plug 'matchit.zip'
Plug 'sickill/vim-pasta'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'chriskempson/base16-vim'
Plug 'mhinz/vim-startify'
Plug 'editorconfig/editorconfig-vim'
Plug 'shougo/vimshell.vim'
Plug 'shougo/vimproc.vim' ,{'do':'make'}
Plug 'sheerun/vim-polyglot'
Plug 'dbakker/vim-projectroot'
Plug 'tinykeymap'
"maybe I'll move from YCM to deoplete one day
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'
call plug#end()

"""""""""""""""
"""functions"""
"""""""""""""""
" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

function! CreateDirectory (base, ...)
   for dir in a:000
      silent! execute '!mkdir ' a:base . '/' . dir . ' > /dev/null 2>&1'
   endfor
endfunction

"""""""""""""""""""
"""anything else"""
"""""""""""""""""""


"movement mappings
noremap  <Up> <Nop>
noremap  <Down> <Nop>
noremap  <Left> <Nop>
noremap  <Right> <Nop>

nnoremap <C-Up> :wincmd +<cr>
nnoremap <C-Down> :wincmd -<cr>
nnoremap <C-Left> :wincmd <<cr>
nnoremap <C-Right> :wincmd ><cr>
"nagivate between tabs
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>

silent! set winheight=30
silent! set winminheight=5

"add column indicator
set textwidth=80
set colorcolumn=+1

"quick edit for vimrc file
nnoremap <leader>ev :tabedit $MYVIMRC<cr>

"move line up or down
nmap ld :m +1<CR>
nmap lu :m -2<CR>

"ignore all kinds of files
set wildignore+=*/tmp/*,*.so,*.swp,*.pyc


"create all needed directories
call CreateDirectory('~/.vim', 'undo', 'backups', 'swaps')

"maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

"centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
   set undodir=~/.vim/undo
endif

"Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

"Highlight current line
set cursorline

"Set the term title
set title
set titlestring=%F

"Show line number and position
set number

"Show matching braces, etc.
set showmatch

"Default to soft tab
set expandtab
set smartindent

"Default to 3 spaces per tab
set tabstop=3
set softtabstop=3
set shiftwidth=3

"make splits open below and right
set splitbelow
set splitright


set t_Co=256
let g:rehash256 = 1
set background=dark
let g:onedark_termcolors=256
colorscheme onedark

"Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

"Use deoplete.
"maybe I'll use replace with YCM at one point
"let g:deoplete#enable_at_startup = 1
