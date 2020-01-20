"""""""""""""""""""
"""odedlaz vimrc"""
" Plug 'vim-scripts/vim-auto-save'
" let g:auto_save = 0

"""""""""""""""""""

" fish is not posix, and breaks many plugins
if &shell =~# '/usr/bin/fish$'
   set shell=/usr/bin/bash
endif

setglobal encoding=utf-8
setglobal fileencoding=utf-8
scriptencoding utf-8

let g:mapleader = "\\"

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" some plugins use $TMP to find the temp directory
" make tmp per user, so they won't collide
let $TMP = '/tmp/vim/' . $USER
silent! execute '!mkdir -p ' . $TMP . '> /dev/null 2>&1'

"""""""""""""
"""plugins"""
"""""""""""""

call plug#begin('~/.vim/plugged')

" don't give |ins-completion-menu| messages.  For example,
" '-- XXX completion (YYY)', 'match 1 of 2', 'The only match',
set shortmess+=c

" Powershell support
Plug 'PProvost/vim-ps1'
" Dark powered asynchronous unite all interfaces for Neovim/Vim8
Plug 'Shougo/denite.nvim'

" Displays function signatures from completions in the command line.
Plug 'Shougo/echodoc.vim'

" Language Server Protocol (LSP) support for neovim
Plug 'autozimu/LanguageClient-neovim', {
   \ 'branch': 'next',
   \ 'do': 'bash install.sh',
   \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \'rust' : [ $HOME . '/.cargo/bin/rls' , $HOME . '/.cargo/bin/rustup' ],
    \'python' : [$HOME . '/.local/bin/pyls'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" asynchronous completion framework for neovim/Vim8
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" display number of search matches & index of a current match
Plug 'google/vim-searchindex'

" improved incremental searching for Vim
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

"live subsitution
set inccommand=split

"show tabs as characters
set list
:set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

" Intelligently reopen files at your last edit position
Plug 'farmergreg/vim-lastplace'
let g:lastplace_ignore_buftype = "quickfix"

" colorize all text in the form #rrggbb or #rgb
Plug 'chrisbra/Colorizer'
let g:colorizer_auto_filetype='css,less,html'
let g:colorizer_skip_comments = 1

Plug 'gcmt/wildfire.vim'
map <SPACE> <Plug>(wildfire-fuel)
vmap <C-SPACE> <Plug>(wildfire-water)

"disable the builtin, bloated netrw plugin. We don’t need two filebrowsers.
let g:loaded_netrwPlugin=1

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"make sure files run in the right directory
nnoremap <c-p> :execute ':Files ' projectroot#guess()<cr>

" --files: List files that would be searched but do not search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
nnoremap <c-t> :Find<Space>

Plug 'neomake/neomake'
augroup neomake_hooks
   au!
   autocmd BufWritePost * update | Neomake
augroup END

let g:neomake_open_list = 2
" let g:neomake_verbose = 3
let g:neomake_cpp_enabled_makers = []
let g:neomake_c_enabled_makers = []
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

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1

" rainbow parenthesis
Plug 'joshdick/onedark.vim'
let g:airline_theme='onedark'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'ntpeters/vim-better-whitespace'
augroup better_whitespace
   au!
   let g:better_whitespace_filetypes_blacklist=['diff',
            \'gitcommit',
            \'unite',
            \'qf',
            \'help']
   autocmd BufEnter * EnableStripWhitespaceOnSave
augroup END

Plug 'dag/vim-fish'
autocmd FileType fish compiler fish

" file sensible comments
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/tComment'

" remaps . in a way that plugins can tap into it
Plug 'tpope/vim-repeat'

" provides mappings to easily delete, change and add such surroundings in pairs
Plug 'tpope/vim-surround'

" True Sublime Text style multiple selections
Plug 'terryma/vim-multiple-cursors'

" visually displaying indent levels
Plug 'nathanaelkane/vim-indent-guides'

" find out which project a file belongs to, easy to use in scripts/mappings
Plug 'dbakker/vim-projectroot'

call plug#end()

" put the tags file in the git directory
let g:autotagTagsFile=projectroot#guess()."/.git/tags"

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
      silent! execute '!mkdir -p ' a:base . '/' . l:dir . ' > /dev/null 2>&1'
   endfor
endfunction

"""""""""""""""""""
"""anything else"""
"""""""""""""""""""

"navigation mappings
nnoremap <C-Up> :wincmd +<cr>
nnoremap <C-Down> :wincmd -<cr>
nnoremap <C-Left> :wincmd <<cr>
nnoremap <C-Right> :wincmd ><cr>

" quickfix widnow for fast tab and buffer switching
:nnoremap <F5> :Windows<CR>
:nnoremap <F6> :Buffers<CR>

" add min/max window bounds
silent! set winheight=30
silent! set winminheight=5

" reload buffer if it was edited outside of vim
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

"lower tiemout
set timeoutlen=1000 ttimeoutlen=0

"Show matching braces, etc.
set showmatch

"Default to soft tab
set expandtab
set smartindent

"Default to 3 spaces per tab
set tabstop=3
set softtabstop=3
set shiftwidth=3

" make splits open below and right
set splitbelow
set splitright

set hidden

" ensure vim works in truecolor mode
if (has('nvim'))
   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has('termguicolors'))
   set termguicolors
endif

colorscheme onedark
