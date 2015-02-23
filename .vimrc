if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

if has('nvim')
  runtime! python_setup.vim
endif

" call plug#begin('~/.vim/plugged')

syntax on

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'whatyouhide/vim-gotham'
NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-markdown'

NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'rking/ag.vim'

NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/syntastic'
" NeoBundle 'benekastah/neomake'

" NeoBundle 'christoomey/vim-tmux-navigator'

NeoBundle 'klen/python-mode'
NeoBundle 'davidhalter/jedi-vim'
" NeoBundle 'jmcantrell/vim-virtualenv'
" NeoBundle 'vim-scripts/vim-nose'

NeoBundle 'chriskempson/base16-vim'

" NeoBundle 'benekastah/neomake'

" NeoBundle 'marijnh/tern_for_vim', { 'do': 'npm install' }
" NeoBundle 'mattn/emmet-vim'

NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'petRUShka/vim-opencl'

NeoBundle 'bling/vim-airline'

" call plug#end()
call neobundle#end()

NeoBundleCheck

set background=dark
" colorscheme gotham
" let g:hybrid_use_iTerm_colors = 1
" colorscheme hybrid
" set background=dark
colorscheme base16-tomorrow

" hi CursorLine ctermbg=8 term=bold cterm=bold
" hi CursorLineNr ctermfg=238 ctermbg=235

fun! StripTrailingWhitespaces()
    if &ft =~ 'markdown'
      return
    endif
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()
autocmd bufwritepre * :call StripTrailingWhitespaces()

set guioptions-=r
set guifont=Inconsolata-g\ For\ Powerline:h12

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set backspace=indent,eol,start
set visualbell
set history=1000
set undofile
set undoreload=10000
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·
set fillchars=vert:┃
" set fillchars=fold:\ ,vert:┃
" hi Folded ctermbg=0 guibg=#121620

" Save when losing focus
au FocusLost * :silent! wall

" Leader
let mapleader = "\<Space>"
let maplocalleader = "\\"

set incsearch
set ignorecase
set smartcase
set cursorline
set laststatus=2
let g:airline_theme='base16'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_powerline_fonts=0

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

set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files

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
let g:pymode_run = 1
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

" neocomplete {{{
let g:jedi#completions_enabled=0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" }}}

" unite {{{
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>
nnoremap <leader>b :<C-u>Unite buffer<CR>
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :<C-u>Unite history/yank<CR>
nnoremap <leader>o :<C-u>Unite outline<CR>
nnoremap <leader><Space> :<C-u>Unite file_mru<CR>
nnoremap <Leader>g :<C-u>Unite grep:.<CR>

if executable('ag')
  let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden -g ""'
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
  \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif
" }}}

" nnoremap <leader><Space> :CtrlPMixed<CR>
" nnoremap <leader>t :CtrlPTag<CR>
" nnoremap <leader>bt :CtrlPBufTag<CR>
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" if executable('ag')
"   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   let g:ctrlp_user_command =
"     \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

"   " ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
" else
"   " Fall back to using git ls-files if Ag is not available
"   let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
"   let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
" endif


" autocmd! BufWritePost * Neomake
"
