set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

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
set showmatch
set hlsearch
set gdefault 
highlight LineNr ctermfg=Grey
set history=500
set showmode 
set backspace=indent,eol,start

set wildmenu
set wildmode=list:longest,full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

set laststatus=2

filetype plugin indent on

set wig=*.o,*.obj,*~,#*#,*.pyc,*.tar*,*.avi,*.ogg,*.mp3
