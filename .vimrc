if has('nvim')
  runtime! python_setup.vim
endif

call plug#begin('~/.vim/plugged')

syntax on

Plug 'whatyouhide/vim-gotham'
Plug 'w0ng/vim-hybrid'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-markdown', { 'for': ['markdown', 'md']}

Plug 'ctrlpvim/ctrlp.vim'

Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
" Plug 'benekastah/neomake'

Plug 'christoomey/vim-tmux-navigator'

" Plug 'klen/python-mode'

Plug 'chriskempson/base16-vim'

" Plug 'benekastah/neomake'

Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'

" Plug 'Shougo/unite.vim'
" Plug 'Shougo/vimproc.vim', { 'do': 'make -f make_mac.mak' }

Plug 'petRUShka/vim-opencl'

call plug#end()

" colorscheme gotham
let g:hybrid_use_iTerm_colors = 1
" colorscheme hybrid
set background=dark
colorscheme base16-ocean
" colorscheme base16-tomorrow

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set backspace=indent,eol,start
set visualbell
set history=1000
set undofile
set undoreload=10000
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·
set fillchars=fold:\ ,vert:┃
hi Folded ctermbg=0 guibg=#121620

" Save when losing focus
au FocusLost * :silent! wall

" Leader
let mapleader = "\<Space>"
let maplocalleader = "\\"

set incsearch
set ignorecase
set smartcase
set cursorline

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


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
" set formatoptions=qrn1j
" set colorcolumn=+1

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

" vim-commentary {{{
map  gc  <Plug>Commentary
nmap  gcc  <Plug>Commentary
" }}}

" delimitmate {{{
let delimitMate_expand_cr = 1
" }}}

" python {{{
let g:pymode_options = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_breakpoint = 0
let g:pymode_run = 0
" }}}

" youcompleteme {{{
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" }}}

" ultisnips {{{
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsEditSplit="vertical"
" }}}

" unite {{{
" call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" 
" nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>
" nnoremap <leader>b :<C-u>Unite buffer<CR>
" let g:unite_source_history_yank_enable = 1
" nnoremap <leader>y :<C-u>Unite history/yank<CR>
" nnoremap <leader>o :<C-u>Unite outline<CR>
" 
" if executable('ag')
"   " let g:unite_source_rec_async_command = 
"   "       \ 'ag --follow --nocolor --nogroup --ignore ".hg" --ignore ".svn"' .
"   "       \ '--ignore ".git" --ignore ".bzr" --hidden -g ""'
"   let g:unite_source_grep_command = 'ag'
"   let g:unite_source_grep_default_opts =
"   \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
"   \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
"   let g:unite_source_grep_recursive_opt = ''
" endif
" }}}

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components'

" autocmd! BufWritePost * Neomake
