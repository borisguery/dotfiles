##
# DELUXE-USR-LOCAL-BIN-INSERT
# (do not remove this comment)
##
echo $PATH | grep -q -s "/usr/local/bin"
if [ $? -eq 1 ] ; then
    PATH=$PATH:/usr/local/bin
    export PATH
fi

export PATH=$PATH:/opt/local/bin:/opt/local/sbin::~/bin
export LANG=en_US.UTF-8
export CLICOLOR=1

if [ -f /opt/local/etc/bash_completion ]; then
. /opt/local/etc/bash_completion
fi

# Prompt (colored git state)
PS1='\u@\h:\W \[\033[32m\]$(__git_ps1 "(%s)")\[\033[0m\]\$ '

# Common aliases
alias l='ls -hl'
alias vi='vim'

if [ -f .bash_colors ]; then 
    . .bash_colors
fi

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

