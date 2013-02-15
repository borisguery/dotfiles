set nocompatible        " be iMproved
filetype on             " hack for osx
filetype off            " required for vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'pangloss/vim-javascript'
Bundle 'leshill/vim-json'
Bundle 'itspriddle/vim-jquery'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'wincent/Command-T.git'
let g:CommandTMatchWindowAtTop=1 " show window at top

Bundle 'stephpy/vim-php-cs-fixer'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'smerrill/vcl-vim-plugin'
Bundle 'Valloric/YouCompleteMe'
Bundle 'https://github.com/beyondwords/vim-twig.git'

" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on

syntax on
set number 
set numberwidth=4
set expandtab
set tabstop=4
set shiftwidth=4
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set ruler
set hlsearch                   " highlight search
set smartcase                  " be case sensitive when input has a capital letter
set incsearch                  " show matches while typing
set showmatch
set gdefault 
highlight LineNr ctermfg=Grey
set history=500
set showmode 
set backspace=indent,eol,start

set showcmd

set wildmenu
set wildmode=list:longest,full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

set laststatus=2

set statusline=%<%f\          " custom statusline
set stl+=[%{&ff}]             " show fileformat
set stl+=%y%m%r%=
set stl+=%-14.(%l,%c%V%)\ %P

filetype plugin indent on

set wig=*.o,*.obj,*~,#*#,*.pyc,*.tar*,*.avi,*.ogg,*.mp3
set clipboard+=unnamed

let $GIT_SSL_NO_VERIFY = 'true' " Accept invalid or missing SSL certificate
let g:Powerline_symbols = 'fancy'
set t_Co=256

" Restore cursor position
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

if has("folding")
    function! UnfoldCur()
        if !&foldenable
            return
        endif
        let cl = line(".")
        if cl <= 1
            return
        endif
        let cf  = foldlevel(cl)
        let uf  = foldlevel(cl - 1)
        let min = (cf > uf ? uf : cf)
        if min
            execute "normal!" min . "zo"
            return 1
        endif
    endfunction
endif

augroup resCur
    autocmd!
    if has("folding")
        autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
    else
        autocmd BufWinEnter * call ResCur()
    endif
augroup END
" END Restore cursor position

set cursorline

