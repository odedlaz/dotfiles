"""""""""""""""""""
"""odedlaz vimrc"""
"""""""""""""""""""
setglobal encoding=utf-8
setglobal fileencoding=utf-8
scriptencoding utf-8

set shell=/usr/bin/zsh

let g:mapleader = "\\"

"""""""""""""
"""plugins"""
"""""""""""""

call plug#begin('~/.vim/plugged')
Plug 'farmergreg/vim-lastplace'
let g:lastplace_ignore_buftype = "quickfix"

Plug 'chrisbra/Colorizer'
let g:colorizer_auto_filetype='css,less,html'
let g:colorizer_skip_comments = 1

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
set completeopt+=noselect
let g:deoplete#enable_at_startup = 1

Plug 'zchee/deoplete-go', { 'do': 'make'}
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/$GOOS_$GOARCH'
let g:deoplete#sources#go#auto_goos = 1
augroup golang
   au!
   au FileType go map <leader>g :!go run %<CR>
augroup END

Plug 'zchee/deoplete-jedi'
let g:python_host_prog = '/opt/nvim/python2/bin/python'
let g:python3_host_prog = '/opt/nvim/python3/bin/python'


Plug 'tmux-plugins/vim-tmux'
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
nnoremap <leader>nt :NERDTreeToggle<cr>

augroup nerdtree
   au!
   " open nerdtree when editing a directory
   autocmd StdinReadPre * let s:std_in=1
   autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

   "close vim if the only window left open is a NERDTree
   autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

"disable the builtin, bloated netrw plugin. We don’t need two filebrowsers.
let g:loaded_netrwPlugin=1
"let NERDTree respect the vim wildignore setting
"Rootignore converts .gitignore into wildignore
"thus making NERDTree respect gitignore!
let g:NERDTreeRespectWildIgnore=1

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
augroup neomake_hooks
   au!
   autocmd BufWritePost * update | Neomake
augroup END

let g:neomake_open_list = 1
" let g:neomake_verbose = 3
let g:neomake_logfile = '/var/log/neovim/neomake.log'
let g:neomake_python_enabled_makers = ['flake8']

" taken from github.com/neomake/neomake/autoload/neomake/makers/ft/python.vim
" needed to change the arguemnts of flake8
let g:neomake_python_flake8_maker = {
         \ 'args': ['--format=default', '--ignore=E501'],
         \ 'errorformat':
         \ '%E%f:%l: could not compile,%-Z%p^,' .
         \ '%A%f:%l:%c: %t%n %m,' .
         \ '%A%f:%l: %t%n %m,' .
         \ '%-G%.%#',
         \ 'postprocess': function('neomake#makers#ft#python#Flake8EntryProcess')
         \ }

let g:neomake_go_enabled_makers = ['golint', 'govet', 'errcheck']

Plug 'fatih/vim-go'
let g:go_fmt_command = 'goimports'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

Plug 'joshdick/onedark.vim'
let g:airline_theme='onedark'

Plug 'Chiel92/vim-autoformat'
let g:formatters_python = ['autopep8', 'yapf']
let g:formatter_yapf_style = 'pep8'
augroup autoformat
   au!
   au BufWrite * :Autoformat
augroup END

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'ntpeters/vim-better-whitespace'
augroup better_whitespace
   au!
   let g:better_whitespace_filetypes_blacklist=['markdown',
            \'md',
            \'diff',
            \'gitcommit',
            \'unite',
            \'qf',
            \'help']
   autocmd BufEnter * EnableStripWhitespaceOnSave
augroup END

Plug 'jmcantrell/vim-virtualenv'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'flazz/vim-colorschemes'
Plug 'tComment'
Plug 'godlygeek/tabular'
Plug 'osyo-manga/vim-over'
Plug 'ervandew/supertab'
Plug 'matchit.zip'
Plug 'sickill/vim-pasta'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
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
call plug#end()

"""""""""""""""
"""functions"""
"""""""""""""""

" Source the vimrc file after saving it

augroup reload_vimrc
   au!
   autocmd BufWritePost init.vim source $MYVIMRC
   autocmd BufWritePost .vimrc source $MYVIMRC
augroup END

augroup close_vim_if_only_quickfix
   au!
   au BufEnter * call MyLastWindow()
   function! MyLastWindow()
      " if the window is quickfix go on
      if &buftype=="quickfix"
         " if this window is last on screen quit without warning
         if winbufnr(2) == -1
            quit!
         endif
      endif
   endfunction
augroup END

function! CreateDirectory (base, ...)
   for l:dir in a:000
      silent! execute '!mkdir ' a:base . '/' . l:dir . ' > /dev/null 2>&1'
   endfor
endfunction

"""""""""""""""""""
"""anything else"""
"""""""""""""""""""
"navigation mappings

noremap  <Up> :echo 'use k!'<cr>
noremap  <Down> :echo 'use j!'<cr>
noremap  <Left> :echo 'use h!'<cr>
noremap  <Right> :echo 'use l!'<cr>

nnoremap <C-Up> :wincmd +<cr>
nnoremap <C-Down> :wincmd -<cr>
nnoremap <C-Left> :wincmd <<cr>
nnoremap <C-Right> :wincmd ><cr>

" quickfix widnow for fast tab and buffer switching
:nnoremap <F5> :tabs<CR>:tabn<Space>
:nnoremap <F6> :buffers<CR>:buffer<Space>

" add min/max window bounds
silent! set winheight=30
silent! set winminheight=5

" reload buffer it was edited outside of vim
" Change numbering in insert mode
augroup set_update
   au!
   set autoread
   au CursorHold * checktime
augroup END

" add column indicator
set textwidth=80
set colorcolumn=+1

" do not automatically wrap on load
set nowrap

" do not automatically wrap text when typing
set formatoptions-=t

"quick edit for vimrc file
nnoremap <leader>ev :sv $MYVIMRC<cr>

"move line up or down
nmap ld :m +1<CR>
nmap lu :m -2<CR>

"create all needed directories
call CreateDirectory('~/.vim', 'undo', 'backups', 'swaps')

"maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

"centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists('&undodir')
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
set relativenumber

" Change numbering in insert mode
augroup set_linenumbers_on_enter_and_leave
   au!
   autocmd InsertEnter * :set number
   autocmd InsertLeave * :set relativenumber
augroup END

"lower tiemout
set timeoutlen=1000 ttimeoutlen=0

"live subsitution
set inccommand=split

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

" ensure vim works in truecolor mode
if (has('nvim'))
   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has('termguicolors'))
   set termguicolors
endif

colorscheme onedark

