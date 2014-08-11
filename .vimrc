call plug#begin('~/.vim/plugged')

Plug 'szw/vim-ctrlspace'
Plug 'Raimondi/delimitMate'
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'

Plug 'justinmk/vim-sneak'
Plug 'Lokaltog/vim-easymotion'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'wincent/command-t', { 'do': 'sh -c \"cd ruby/command-t && ruby extconf.rb && make\"'}
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'junegunn/vim-easy-align'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

Plug 'scrooloose/syntastic'

Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'jmcantrell/vim-virtualenv' , { 'for': 'python' }
Plug 'klen/python-mode'          , { 'for': 'python' }

Plug 'guns/vim-clojure-static'    , { 'for': 'clojure' }
Plug 'tpope/vim-leiningen'        , { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight' , { 'for': 'clojure' }
Plug 'tpope/vim-fireplace'        , { 'for': 'clojure' }

Plug 'kchmck/vim-coffee-script' , { 'for': 'coffee' }
Plug 'mtscout6/vim-cjsx'        , { 'for': 'coffee' }

Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'bling/vim-airline'

Plug 'junegunn/goyo.vim',      { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

call plug#end()


" Colorscheme {{{
" let g:seoul256_background = 235
" colorscheme seoul256
" colorscheme jellybeans
colorscheme base16-ocean
set background=dark
" set background=light

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" highlight SignColumn ctermbg=0

" }}}

" Basic options {{{
set nocompatible
set encoding=utf-8
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set nonumber
set norelativenumber
set history=1000
set undofile
set undoreload=10000
set list
" set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set listchars=tab:▸\ ,extends:❯,precedes:❮
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set autowrite
set autoread
set title
set linebreak
set scrolloff=10
set sidescrolloff=5
set scrolljump=5

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Leader
let mapleader = ","
let maplocalleader = "\\"

set incsearch
set ignorecase
set smartcase

set mouse=a

set nostartofline

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if has("gui_running")
    set guifont=Monaco:h12
    set guioptions=
endif
" }}}

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}}

" Wildmenu completion {{{

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib
set wildignore+=**/bower_components/*
set wildignore+=**/node_modules/*

" }}}

" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}

" Tabs, spaces, wrapping {{{

set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
set textwidth=80
set formatoptions=qrn1j
set colorcolumn=+1

" }}}

" Backups {{{

set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" }}}

" Coffeescript {{{
augroup ft_coffee
    au!

    au FileType coffee setlocal shiftwidth=2
augroup end
" }}}

" Vim {{{
augroup ft_vim
	au!

	au FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Command-T {{{
nnoremap <silent> <leader>b :CommandTMRU<CR>
nnoremap <silent> <leader>f :CommandTTag<CR>
nnoremap <silent> <c-p> :CommandT<CR>
let g:CommandTFileScanner="find"
" }}}

" EasyTags {{{
let g:easytags_async=1
" }}}

" YouCompleteMe {{{
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}

" Dispatch {{{
nnoremap <Leader>d :Dispatch<CR>
" }}}

" Fugitive {{{
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gpl :Gpull<CR>
nnoremap <Leader>gps :Gpush<CR>
" }}}

" python-mode {{{
let g:pymode_options = 0
let g:pymode_rope_completion = 0
" }}}

" ctrlspace {{{
let g:ctrlspace_save_workspace_on_exit = 1
let g:ctrlspace_project_root_markers = []
let g:ctrlspace_load_last_workspace_on_start = 1
nnoremap <Leader>s :CtrlSpaceSaveWorkspace<CR>

hi CtrlSpaceSelected term=reverse ctermfg=187   guifg=#d7d7af ctermbg=23    guibg=#005f5f cterm=bold gui=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244   guifg=#808080 ctermbg=232   guibg=#080808 cterm=NONE gui=NONE
hi CtrlSpaceSearch   ctermfg=220  guifg=#ffd700 ctermbg=NONE  guibg=NONE    cterm=bold    gui=bold
hi CtrlSpaceStatus   ctermfg=230  guifg=#ffffd7 ctermbg=234   guibg=#1c1c1c cterm=NONE    gui=NONE
" }}}

" Airline {{{
set laststatus=2
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_powerline_fonts=0
let g:airline_theme='jellybeans'
let g:airline_section_z=''
let g:airline_section_y=''
" }}}

" goyo.vim + limelight.vim {{{
function! GoyoBefore()
  if exists('$TMUX')
    silent !tmux set status off
  endif
  set scrolloff=999
  set noshowmode
  set noshowcmd
  Limelight
endfunction

function! GoyoAfter()
  if exists('$TMUX')
    silent !tmux set status on
  endif
  set scrolloff=5
  set showmode
  set showcmd
  Limelight!
endfunction

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]

nnoremap <Leader>G :Goyo<CR>
" }}}

" vim-commentary {{{
map  gc  <Plug>Commentary
nmap  gcc  <Plug>Commentary
" }}}

" vim-easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)
" }}}
