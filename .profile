##
# DELUXE-USR-LOCAL-BIN-INSERT
# (do not remove this comment)
##
echo $PATH | grep -q -s "/usr/local/bin"
if [ $? -eq 1 ] ; then
    PATH=$PATH:/usr/local/bin
    export PATH
fi

PATH=$PATH:~/bin

export PATH=$PATH:/opt/local/bin:/opt/local/sbin
export LANG=en_US.UTF-8
export CLICOLOR=1

if [ -f /opt/local/etc/bash_completion ]; then
. /opt/local/etc/bash_completion
fi

# git prompt
PS1='\u@\h:\W \[\033[32m\]$(__git_ps1 "(%s)")\[\033[0m\]\$ '

alias l='ls -hl'
alias vi='vim'

LS_COLORS=''
LS_COLORS=$LS_COLORS:'no=0'           # Normal text
LS_COLORS=$LS_COLORS:'fi=0'           # Regular file
LS_COLORS=$LS_COLORS:'di=36'          # Directory
LS_COLORS=$LS_COLORS:'ln=01;36'       # Symbolic link
LS_COLORS=$LS_COLORS:'pi=33'          # Named pipe
LS_COLORS=$LS_COLORS:'so=01;35'       # Socket
LS_COLORS=$LS_COLORS:'do=01;35'       # DO
LS_COLORS=$LS_COLORS:'bd=01;37'       # Block device
LS_COLORS=$LS_COLORS:'cd=01;37'       # Character device
LS_COLORS=$LS_COLORS:'ex=35'          # Executable file
LS_COLORS=$LS_COLORS:'*FAQ=31;7'      # FAQs
LS_COLORS=$LS_COLORS:'*README=31;7'   # READMEs
LS_COLORS=$LS_COLORS:'*INSTALL=31;7'  # INSTALLs
LS_COLORS=$LS_COLORS:'*.sh=47;31'     # Shell-Scripts
LS_COLORS=$LS_COLORS:'*.vim=35'       # Vim-"Scripts"
LS_COLORS=$LS_COLORS:'*.swp=00;44;37' # Swapfiles (Vim)
LS_COLORS=$LS_COLORS:'*.sl=30;33'     # Slang-Scripts
LS_COLORS=$LS_COLORS:'*,v=5;34;93'    # Versioncontrols
LS_COLORS=$LS_COLORS:'or=01;05;31'    # Orphaned link
LS_COLORS=$LS_COLORS:'*.c=33'         # Sources
LS_COLORS=$LS_COLORS:'*.C=33'         # Sources
LS_COLORS=$LS_COLORS:'*.h=33'         # Sources
LS_COLORS=$LS_COLORS:'*.cc=33'        # Sources
LS_COLORS=$LS_COLORS:'*.py=33'        # Sources
LS_COLORS=$LS_COLORS:'*.rb=33'        # Sources
LS_COLORS=$LS_COLORS:'*.awk=33'       # Sources
LS_COLORS=$LS_COLORS:'*.pl=33'        # Sources
LS_COLORS=$LS_COLORS:'*.jpg=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.jpeg=0;32'    # Images
LS_COLORS=$LS_COLORS:'*.JPG=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.gif=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.png=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.jpeg=0;32'    # Images
LS_COLORS=$LS_COLORS:'*.ppm=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.pgm=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.pbm=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.tar=31'       # Archive
LS_COLORS=$LS_COLORS:'*.tgz=31'       # Archive
LS_COLORS=$LS_COLORS:'*.gz=31'        # Archive
LS_COLORS=$LS_COLORS:'*.zip=31'       # Archive
LS_COLORS=$LS_COLORS:'*.sit=31'       # Archive
LS_COLORS=$LS_COLORS:'*.lha=31'       # Archive
LS_COLORS=$LS_COLORS:'*.lzh=31'       # Archive
LS_COLORS=$LS_COLORS:'*.rar=31'       # Archive
LS_COLORS=$LS_COLORS:'*.arj=31'       # Archive
LS_COLORS=$LS_COLORS:'*.bz2=31'       # Archive
LS_COLORS=$LS_COLORS:'*.avi=35'       # Video
LS_COLORS=$LS_COLORS:'*.mpg=35'       # Video
LS_COLORS=$LS_COLORS:'*.mpeg=35'      # Video
LS_COLORS=$LS_COLORS:'*.divx=35'      # Video
LS_COLORS=$LS_COLORS:'*.xvid=35'      # Video
LS_COLORS=$LS_COLORS:'*.mov=35'       # Video
LS_COLORS=$LS_COLORS:'*.mp4=35'       # Video
LS_COLORS=$LS_COLORS:'*.m4v=35'       # Video
LS_COLORS=$LS_COLORS:'*.wmv=35'       # VIdeo
LS_COLORS=$LS_COLORS:'*.mp3=37'       # Audio
LS_COLORS=$LS_COLORS:'*.ogg=37'       # Audio
LS_COLORS=$LS_COLORS:'*.wav=37'       # Audio
LS_COLORS=$LS_COLORS:'*.au=37'        # Audio
LS_COLORS=$LS_COLORS:'*.html=36'      # HTML
LS_COLORS=$LS_COLORS:'*.htm=1;34'     # HTML
LS_COLORS=$LS_COLORS:'*.php=1;45'     # PHP
LS_COLORS=$LS_COLORS:'*.doc=1;34'     # MS-Word
LS_COLORS=$LS_COLORS:'*.txt=1;34'     # Plain/Text
LS_COLORS=$LS_COLORS:'*.o=1;36'       # Object-Files
LS_COLORS=$LS_COLORS:'*.a=1;36'       # Shared-libs
export LS_COLORS

. z

#
# History
#
shopt -s histappend                         # Append each(!) history entry from all terminals realtime(not after sesion ending)
shopt -s cmdhist                            # store multiline commands as 1 line
shopt -s cdspell                            # spelling error correction 
shopt -s checkwinsize                       # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
export HISTCONTROL="ignoredups"             # ignore duplicates(store command once)
export HISTCONTROL="ignoreboth"
export HISTIGNORE="&:ls:[bf]g:exit:%[0-9]"  # ignore simple commands
export HISTFILESIZE=5000                    # history file size
