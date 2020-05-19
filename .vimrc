set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/nginx.vim'
" Plugin 'bling/vim-bufferline'
" Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/neomru.vim'
Plugin 'vim-syntastic/syntastic'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'majutsushi/tagbar'
"Plugin 'vim-php/tagbar-phpctags.vim'
" Plugin 'padawan-php/padawan.vim'
"Plugin 'Shougo/vimproc'
" Plugin 'm2mdas/phpcomplete-extended'
" Plugin 'm2mdas/phpcomplete-extended-symfony'
"Plugin 'stephpy/vim-php-cs-fixer'
"Plugin 'sheerun/vim-polyglot'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/YAIFA' " Identifies file indentation.
Plugin 'sjl/gundo.vim' " Tree undo.
Plugin 'vim-scripts/Rename2' " Renames the file in the current buffer.
Plugin 'tpope/vim-markdown'
Plugin 'sickill/vim-pasta'
"Plugin 'easymotion/vim-easymotion'
call vundle#end()

let g:gundo_prefer_python3 = 1
nnoremap <F5> :GundoToggle<CR>

filetype plugin indent on " Automatically detect file types.
set background=dark
syntax on                   " Syntax highlighting

" Use , instead \ which is harder on French keyboard
" let mapleader = ","
" let maplocalleader = ';' " second easier than comma ,

if has('mouse')
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    set mousemodel=popup_setpos " Show a pop-up for right-click.
endif

set virtualedit=onemore     " Allow for cursor beyond last character
set history=1000            " Store a ton of history (default is 20)
set nospell
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set backup                          " Backups are nice ...
set undofile                        " So is persistent undo ...
set undolevels=1000                 " Maximum number of changes that can be undone
set undoreload=10000                " Maximum number lines to save for undo on a buffer reload
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set viewdir=~/.vim/.views//
set nowrap                          " Do not wrap long lines
set expandtab                       " Tabs are spaces, not tabs
set softtabstop=4                   " Let backspace delete indent
set backspace=indent,eol,start
set nojoinspaces                    " Prevents inserting two spaces after punctuation on a join (J)
set splitright                      " Puts new vsplit windows to the right of the current
set splitbelow                      " Puts new split windows to the bottom of the current
set ruler                           " Always show current position
set hlsearch                        " Highlight search results
set noerrorbells
set encoding=utf8
set nofoldenable                    " No fold by default
set number
set foldmethod=syntax
set showmatch                       " Show matching parenthesis
set laststatus=2                    " Always show status
set showtabline=2                   " Always show tabline
scriptencoding utf-8

" Misc -------------------------------------{{{
" Optimize for fast terminal connections
set ttyfast
" }}}

" Invisible Characters -------------------------------------- {{{
" Do not show invisible characters.
set nolist
" List of characters to show instead of whitespace.
set listchars=tab:▸\ ,eol:¬,trail:⌴,extends:❯,precedes:❮
" Highlight VCS conflict markers.
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" }}}

" Completion ----------------------------------------------- {{{

" Enhance command-line completion
set wildmenu

" VCS directories.
set wildignore+=.hg,.git,.svn
" LaTeX intermediate files.
set wildignore+=*.aux,*.out,*.toc
" Binary images.
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
" Lua byte code.
set wildignore+=*.luac
" Compiled object files.
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
" Python byte code.
set wildignore+=*.pyc
" Compiled spelling lists.
set wildignore+=*.spl
" Backup, auto save, swap, undo, and view files.
set wildignore+=*~,#*#,*.sw?,%*,*=
" Mac OS X.
set wildignore+=*.DS_Store
" }}}


" Tab navigation ------------------- {{{
" Easily create a new tab.
map <Leader>tt :tabnew<CR>
" Easily close a tab.
map <Leader>tc :tabclose<CR>
" Easily move a tab.
noremap <Leader>tm :tabmove<CR>
" Easily go to next tab.
noremap <Leader>tn :tabnext<CR>_
" Easily go to previous tab.
noremap <Leader>tp :tabprevious<CR>
" }}}

autocmd FileType javascript,puppet,python,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

" Syntastic ----- {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" Restore cursor position from previous editing session
function! ResCur()
    if line("'\"") <= line("$")
	silent! normal! g`"
	return 1
    endif
endfunction
augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Do not restore cursor position when editing a commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])


" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
   \|    if empty(bufname('%'))
   \|        browse confirm write
   \|    else
   \|        confirm write
   \|    endif


" Disable up/down/left/right arrows
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Disable h and move navigation to the right (more natural imo)
" noremap h <nop>
" noremap m l
" noremap l k
" noremap k j
" noremap j h

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

map <Leader>n :NERDTreeToggle<CR>
map <Leader>; :NERDTreeFind<CR>
nnoremap <Leader>a :bprevious<CR>
nnoremap <Leader>z :bnext<CR>

" Disable Ex mode which is useless to me
nnoremap Q <nop>

" Functions
" Strip whitespace {
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" }

let NERDTreeShowHidden=1

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=235
endif

" Auto-indent XML correctly.
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" When saving new file, supress non-exist dir error and create new directory.
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Auto-reload .vimrc when modified
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

if $TERM_PROGRAM =~ "iTerm"
  " Set the title of the Terminal to the currently open file
  function! SetTerminalTitle()
      let titleString = expand('%:t')
      if len(titleString) > 0
          let &titlestring = expand('%:t')
          " this is the format iTerm2 expects when setting the window title
          let args = "\033]1;".&titlestring."\007"
          let cmd = 'silent !echo -e "'.args.'"'
          execute cmd
          redraw!
      endif
  endfunction
autocmd BufEnter * call SetTerminalTitle()
endif
