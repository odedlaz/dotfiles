 "Plug Plugins
call plug#begin('~/.vim/plugged')
Plug 'alfredodeza/pytest.vim'
Plug 'tComment'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'luochen1990/rainbow'
Plug 'gcmt/wildfire.vim'
Plug 'airblade/vim-gitgutter'
Plug 'osyo-manga/vim-over'
Plug 'ervandew/supertab'
Plug 'matchit.zip'
Plug 'sickill/vim-pasta'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'bronson/vim-trailing-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'elzr/vim-json'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'flazz/vim-colorschemes'
Plug 'ZoomWin'
Plug 'Valloric/YouCompleteMe'
Plug 'chriskempson/base16-vim'
Plug 'Quramy/tsuquyomi'
Plug 'nathanielc/vim-tickscript'
Plug 'fatih/vim-go'
Plug 'mhinz/vim-startify'
Plug 'editorconfig/editorconfig-vim'
Plug 'cespare/vim-toml'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'shougo/vimshell.vim'
Plug 'shougo/vimproc.vim' ,{'do':'make'}
Plug 'ekalinin/dockerfile.vim'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'nvie/vim-flake8'
Plug 'jmcantrell/vim-virtualenv'
" maybe I'll move from YCM to deoplete one day
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
call plug#end()

syntax on
filetype plugin indent on

if &compatible
  set nocompatible
endif

" remap leader
let mapleader = ","

" easy motion bindings
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" This selects the next closest text object, and previous one.
map <SPACE> <Plug>(wildfire-fuel)
vmap <C-SPACE> <Plug>(wildfire-water)

" resize splits
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" move between splits

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" quick edit for vimrc file
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

"toggle nerd view
nnoremap <leader>nt :NERDTreeToggle<cr>

" make sure files run in the right directory
nnoremap <c-p> :execute ':Files '.expand("%:p:h")<cr>

" ctrlsf bindings
nnoremap <c-t> :CtrlSF<Space>
nnoremap <leader>ct :CtrlSFToggle<cr>

nnoremap <leader>z :ZoomWin<cr>

" move line up or down
nmap ld :m +1<CR>
nmap lu :m -2<CR>

" add column indicator
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

" highlight text
set incsearch

"mappings
" centralize backups, swapfiles and undo history
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

" Make tabs smart
set smartindent
set smarttab


" make splits open below and right
set splitbelow
set splitright

" These lines setup the environment to show graphics and colors correctly.
set nocompatible

" No more mistaking :)
command! W w

" Colors and fonts
set t_Co=256
let g:rehash256 = 1
let g:onedark_termcolors=256

set background=dark

colorscheme onedark
set guifont=Fira\ Code:h15

" YouCompleteMe configs
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path='python'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" vim-go configs
let g:neomake_go_enabled_makers = ['golint', 'govet', 'errcheck']
let g:go_fmt_command = "goimports"

"fzf configurations
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" markdown config
let g:vim_markdown_folding_disabled=1

" airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" python specific configurations
let python_highlight_all=1
set wildignore+=*.pyc
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:neomake_python_enabled_makers = ['python', 'pep8', 'flake8', 'pyflakes']
autocmd BufWritePost *.py call Flake8()

"easy motion configs
let g:EasyMotion_smartcase = 1

" Use deoplete.
" maybe I'll use replace with YCM at one point
" let g:deoplete#enable_at_startup = 1
