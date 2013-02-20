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

set spelllang=en,fr

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

" Colors scheme
hi SpecialKey    term=bold ctermfg=9 guifg=Blue
hi NonText       term=bold ctermfg=9 gui=bold guifg=Blue
hi Directory     term=bold ctermfg=11 guifg=#1600FF
hi ErrorMsg      term=standout ctermfg=15 ctermbg=4 guifg=White guibg=Firebrick2
hi IncSearch     term=reverse cterm=reverse gui=reverse
hi Search        term=reverse ctermfg=0 ctermbg=14 guibg=Blue4
hi MoreMsg       term=bold ctermfg=10 gui=bold guifg=SeaGreen4
hi ModeMsg       term=bold cterm=bold gui=bold
hi LineNr        term=underline ctermfg=14 guifg=#552A7B guibg=Grey5
hi CursorLineNr  term=bold ctermfg=14 gui=bold guifg=Yellow
hi Question      term=standout ctermfg=10 gui=bold guifg=Chartreuse4
hi StatusLine    term=bold,reverse cterm=bold,reverse guifg=White guibg=DarkSlateGray
hi StatusLineNC  term=reverse cterm=reverse guifg=SlateGray guibg=Gray90
hi VertSplit     term=reverse cterm=reverse guifg=DarkSlateGray guibg=Gray90
hi Title         term=bold ctermfg=13 gui=bold guifg=DeepSkyBlue3
hi Visual        term=reverse cterm=reverse guibg=MacSelectedTextBackgroundColor
hi VisualNOS     term=bold,underline cterm=bold,underline gui=bold,underline
hi WarningMsg    term=standout ctermfg=12 guifg=Firebrick2
hi WildMenu      term=standout ctermfg=0 ctermbg=14 guifg=White guibg=SkyBlue
hi Folded        term=standout ctermfg=11 ctermbg=8 guifg=DarkBlue guibg=#E6E6E6
hi FoldColumn    term=standout ctermfg=11 ctermbg=8 guifg=DarkBlue guibg=Grey
hi DiffAdd       term=bold ctermbg=1 guibg=MediumSeaGreen
hi DiffChange    term=bold ctermbg=5 guibg=MediumPurple4
hi DiffDelete    term=bold ctermfg=9 ctermbg=3 gui=bold guifg=White guibg=SlateBlue
hi DiffText      term=reverse cterm=bold ctermbg=12 guifg=White guibg=SteelBlue
hi SignColumn    term=standout ctermfg=11 ctermbg=8 guifg=DarkBlue guibg=Grey
hi Conceal       ctermfg=7 ctermbg=8 guifg=LightGrey guibg=DarkGrey
hi SpellBad      term=reverse ctermbg=12 gui=undercurl guisp=Firebrick2
hi SpellCap      term=reverse ctermbg=9 gui=undercurl guisp=Blue
hi SpellRare     term=reverse ctermbg=13 gui=undercurl guisp=Magenta
hi SpellLocal    term=underline ctermbg=11 gui=undercurl guisp=DarkCyan
hi Pmenu         ctermfg=0 ctermbg=13 guibg=LightSteelBlue1
hi PmenuSel      ctermfg=8 ctermbg=0 guifg=White guibg=SkyBlue4
hi PmenuSbar     ctermbg=7 guibg=Grey
hi PmenuThumb    ctermbg=15 gui=reverse guibg=White
hi TabLine       term=underline cterm=underline ctermfg=15 ctermbg=8 gui=underline guibg=LightGrey
hi TabLineSel    term=bold cterm=bold gui=bold
hi TabLineFill   term=reverse cterm=reverse gui=reverse
hi CursorColumn  term=reverse ctermbg=8 guibg=Gray20
hi CursorLine    term=none cterm=none ctermbg=8 guifg=#444444 guibg=Gray20
hi ColorColumn   term=reverse ctermbg=4 guibg=DarkRed
hi Cursor        guifg=bg guibg=LightGoldenrod
hi lCursor       guifg=bg guibg=LightSlateGrey
hi MatchParen    term=reverse ctermbg=3 guifg=White guibg=Magenta
hi Normal        guifg=Grey50 guibg=Grey10
hi Error         term=reverse ctermfg=15 ctermbg=12 guifg=White guibg=Firebrick3
hi Comment       term=bold ctermfg=11 gui=italic guifg=CadetBlue3
hi Constant      term=underline ctermfg=13 guifg=Goldenrod1
hi Special       term=bold ctermfg=12 guifg=BlueViolet
hi Identifier    term=underline cterm=bold ctermfg=11 guifg=Aquamarine4
hi Statement     term=bold ctermfg=14 gui=bold guifg=Purple1
hi PreProc       term=underline ctermfg=9 guifg=DodgerBlue3
hi Type          term=underline ctermfg=10 gui=bold guifg=Cyan4
hi Underlined    term=underline cterm=underline ctermfg=9 gui=underline guifg=SteelBlue1
hi Ignore        ctermfg=0 guifg=bg
hi Todo          term=standout ctermfg=0 ctermbg=14 guifg=Green4 guibg=DeepSkyBlue1
hi CursorIM      guifg=bg guibg=LightSlateGrey
hi String        guifg=SkyBlue4
hi link Character Constant
hi Boolean       guifg=DeepPink4
hi link Number          Constant
hi link Float           Number
hi link Function        Identifier
hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Operator        Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
hi link helpHeadline    Statement
hi link helpSectionDelim  PreProc
hi link helpIgnore      Ignore
hi link helpExample     Comment
hi link helpBar         Ignore
hi link helpStar        Ignore
hi link helpHyperTextJump  Subtitle
hi link helpHyperTextEntry  String
hi link helpNormal    cleared
hi link helpVim         Identifier
hi link helpOption      Type
hi link helpCommand     Comment
hi link helpHeader      PreProc
hi link helpGraphic   cleared
hi link helpNote        Todo
hi link helpSpecial     Special
hi link helpLeadBlank cleared
hi link helpNotVi       Special
hi link helpComment     Comment
hi link helpConstant    Constant
hi link helpString      String
hi link helpCharacter   Character
hi link helpNumber      Number
hi link helpBoolean     Boolean
hi link helpFloat       Float
hi link helpIdentifier  Identifier
hi link helpFunction    Function
hi link helpStatement   Statement
hi link helpConditional  Conditional
hi link helpRepeat      Repeat
hi link helpLabel       Label
hi link helpOperator    Operator
hi link helpKeyword     Keyword
hi link helpException   Exception
hi link helpPreProc     PreProc
hi link helpInclude     Include
hi link helpDefine      Define
hi link helpMacro       Macro
hi link helpPreCondit   PreCondit
hi link helpType        Type
hi link helpStorageClass  StorageClass
hi link helpStructure   Structure
hi link helpTypedef     Typedef
hi link helpSpecialChar  SpecialChar
hi link helpTag         Tag
hi link helpDelimiter   Delimiter
hi link helpSpecialComment  SpecialComment
hi link helpDebug       Debug
hi link helpUnderlined  Underlined
hi link helpError       Error
hi link helpTodo        Todo
hi link helpURL         String
hi link Subtitle        Identifier
" hi link tee           cleared
