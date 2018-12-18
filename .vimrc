" Vundle configuration
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
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'vim-php/tagbar-phpctags.vim'
" Plugin 'padawan-php/padawan.vim'
Bundle 'Shougo/vimproc'
" Bundle 'm2mdas/phpcomplete-extended'
" Bundle 'm2mdas/phpcomplete-extended-symfony'
Plugin 'stephpy/vim-php-cs-fixer'
"Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
call vundle#end()

filetype plugin indent on " Automatically detect file types.
set background=dark
syntax on                   " Syntax highlighting

" Use , instead \ which is harder on French keyboard
let mapleader = ","

set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set virtualedit=onemore     " Allow for cursor beyond last character
set history=1000            " Store a ton of history (default is 20)
set spell                   " Spell checking on
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
set autoindent                      " Indent at the same level of the previous line
set shiftwidth=4                    " Use indents of 4 spaces
set expandtab                       " Tabs are spaces, not tabs
set tabstop=4                       " An indentation every four columns
set softtabstop=4                   " Let backspace delete indent
set backspace=indent,eol,start
set nojoinspaces                    " Prevents inserting two spaces after punctuation on a join (J)
set splitright                      " Puts new vsplit windows to the right of the current
set splitbelow                      " Puts new split windows to the bottom of the current
set ruler                           " Always show current position
set hlsearch                        " Highlight search results
set noerrorbells
set encoding=utf8
set nofoldenable " No fold by default
set number
set foldmethod=syntax
" set relativenumber
set laststatus=2
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%{fugitive#statusline()}
" set statusline+=%*


autocmd FileType javascript,puppet,python,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig


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

scriptencoding utf-8

" Disable folding
set nofoldenable

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
   \|    if empty(bufname('%'))
   \|        browse confirm write
   \|    else
   \|        confirm write
   \|    endif

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
vmap <C-s> <esc>:w<CR>gv


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
noremap h <nop>
noremap m l
noremap l k
noremap k j
noremap j h

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

map <Leader>n :NERDTreeToggle<CR>
map <Leader>; :NERDTreeFind<CR>
nnoremap <Leader>a :bprevious<CR>
nnoremap <Leader>z :bnext<CR>

" Disable Ex mode which is useless to me
nnoremap Q <nop>

let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")':   ['<c-l>', '<up>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<down>'],
    \ 'PrtCurLeft()':         ['<c-j>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-m>', '<right>'],
    \ }


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

" Auto-disable paste mode when copy/pasting
function! WrapForTmux(s)
    if !exists('$TMUX')
        return a:s
    endif

    let tmux_start = "\<Esc>Ptmux;"
    let tmux_end = "\<Esc>\\"

    return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

let NERDTreeShowHidden=1

let g:ctrlp_dont_split = 'NERD'
let g:ctrlp_show_hidden = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php']

let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=235
endif

" Auto-indent XML correctly.
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" When saving new file, surpress non-exist dir error and create new directory.
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

" vim-gitgutter
let g:gitgutter_sign_column_always = 1

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#force_omni_input_patterns = {}
let g:neocomplete#force_omni_input_patterns.php = '\h\w*\|[^- \t]->\w*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" jump to a twig view in symfony
function! s:SfJumpToView()
    mark C
    normal! ]M
    let end = line(".")
    normal! [m
    try
        call search('v[^.:]+.html.twig', '', end)
        normal! gf
    catch
        normal! g`C
        echohl WarningMsg | echomsg "Template file not found" | echohl None
    endtry
endfunction
com! SfJumpToView call s:SfJumpToView()

" create a mapping only in a Controller file
autocmd BufEnter *Controller.php nmap <buffer><leader>v :SfJumpToView<CR>

" Duplicate visual selection.
vmap D yP'<

" Enables syntax highlighting for JSDocs.
let g:javascript_plugin_jsdoc = 1
" Enables some additional syntax highlighting for NGDocs.
let g:javascript_plugin_ngdoc = 1
" Enables syntax highlighting for Flow.
let g:javascript_plugin_flow = 1

nnoremap <leader>r :<C-u>Unite -buffer-name=mru -start-insert file_mru<cr>

" let g:padawan#composer_command = 'composer'
" let g:padawan#timeout = 1
" let g:phpcomplete_index_composer_command='/usr/local/bin/composer --no-ansi'
" autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>k <Plug>(easymotion-j)
map <Leader>l <Plug>(easymotion-k)
