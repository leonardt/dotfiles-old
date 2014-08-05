if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-dispatch'

NeoBundle 'justinmk/vim-sneak'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'junegunn/vim-pseudocl'
NeoBundle 'junegunn/vim-oblique'
NeoBundle 'wincent/command-t', {
    \ 'build': {
    \   'mac': 'sh -c "cd ruby/command-t && ruby extconf.rb && make"'
    \  }
    \}
NeoBundle 'rking/ag.vim'

NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'

NeoBundle 'scrooloose/syntastic'

NeoBundle 'Valloric/YouCompleteMe', {
    \ 'build': {
    \   'mac': './install.sh --clang-completer'
    \  }
    \}

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

NeoBundle 'jmcantrell/vim-virtualenv'

NeoBundle 'chriskempson/base16-vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax on

" Colorscheme {{{
colorscheme base16-tomorrow
set background=dark

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}

" Basic options {{{
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

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
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

set tabstop=8
set shiftwidth=4
set softtabstop=4
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

" Vim {{{
augroup ft_vim
	au!

	au FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Command-T {{{
nnoremap <silent> <leader>b :CommandTMRU<CR>
nnoremap <silent> <leader>f :CommandTTag<CR>
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

