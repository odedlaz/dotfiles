" Fix the shell, if we are using fish
if &shell =~# 'fish$'
  set shell=sh
endif


set textwidth=80
set colorcolumn=+1

" ignore temp files
set wildignore+=*/tmp/*,*.so,*.swp

" set encoding to utf-8
set encoding=utf-8

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile


" better split view

" move below
nnoremap <C-J> <C-W><C-J>
" move above
nnoremap <C-K> <C-W><C-K>
" move right
nnoremap <C-L> <C-W><C-L>
" move left
nnoremap <C-H> <C-W><C-H>
"
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Highlight current line
set cursorline

" Set the term title
set title
set titlestring=%F

" Show line number and position
set number
set ruler

" Show matching braces, etc.
set showmatch

" Default to soft tab
set expandtab

" Default to 3 spaces per tab
set tabstop=3
set softtabstop=3
set shiftwidth=3

" hide the menu bar
set guioptions=-m

" Make it smart
set smartindent
set smarttab
"set smartcaseset autoindent

" Enable syntax
syntax on
filetype plugin indent on
filetype on
filetype plugin on
" Causes split to make it below
set splitbelow

" Causes vsplit to split to the right
set splitright

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" These lines setup the environment to show graphics and colors correctly.
set nocompatible

" No more mistaking :)
command! W w


" Leaders!
let mapleader = ","

" quick edit for vimrc file
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>rt :!cd app/ && grunt test<cr>
nnoremap <leader>z :ZoomWin<cr>
nnoremap <leader>uc :w<CR>:call clearmatches()<CR>:let cmd = system('unused -v true ' . expand('%'))<CR>:exec cmd<CR>
nmap ld :m +1<CR>
nmap lu :m -2<CR>

" Use the_silver_searcher instead of ack
if executable('ag')
   let g:ackprg = 'ag --vimgrep --smart-case --nocolor --nogroup --column'
   cnoreabbrev ag Ack
   cnoreabbrev aG Ack
   cnoreabbrev Ag Ack
   cnoreabbrev AG Ack
endif

" Vunlde plugins
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Bundle 'alfredodeza/pytest.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'ervandew/supertab'
Bundle 'tmhedberg/matchit'
Bundle 'sickill/vim-pasta'
Bundle 'VundleVim/Vundle.vim'
Bundle 'vim-scripts/indentpython.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'jiangmiao/auto-pairs'
Bundle 'elzr/vim-json'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'ZoomWin'
Bundle 'Valloric/YouCompleteMe'
Bundle 'chriskempson/base16-vim'
Bundle 'Quramy/tsuquyomi'
Bundle 'nathanielc/vim-tickscript'
Bundle 'fatih/vim-go'
Bundle 'mhinz/vim-startify'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'cespare/vim-toml'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'shougo/vimshell.vim'
Bundle 'shougo/vimproc.vim'
Bundle 'ekalinin/dockerfile.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'othree/html5.vim'
Bundle 'sheerun/vim-polyglot'
Bundle 'joshdick/onedark.vim'
Bundle 'junegunn/goyo.vim'
Bundle 'nvie/vim-flake8'
Bundle 'jmcantrell/vim-virtualenv'
call vundle#end()            " required
filetype plugin indent on    " required


" Colors and fonts
set t_Co=256
let g:rehash256 = 1
let g:onedark_termcolors=256


set background=dark

colorscheme onedark
if has("macligatures")
  set macligatures
endif
set guifont=Fira\ Code:h15

" YouCompleteMe configs

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" vim-go configs
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_fmt_command = "goimports"

" Ignore node_modules and git from Ctrl+P
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" python specific configurations

let python_highlight_all=1
set wildignore+=*.pyc
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:syntastic_python_checkers=['python', 'pep8', 'flake8', 'pyflakes']

