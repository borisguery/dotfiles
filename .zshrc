# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export PATH=~/.rvm/bin:~/.composer/vendor/bin:~/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export EDITOR=vim
export DAYUSE_DEPLOY_USER=borisguery

source ~/.zsh/aliases.zsh

HIST_STAMPS="dd/mm/yyyy"
setopt EXTENDED_HISTORY
setopt HISTAPPEND
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt CORRECT
setopt APPEND_HISTORY

export HISTCONTROL=ignoredups:erasedups
export SAVEHIST=100000
export HISTSIZE=100000

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD
# Now we can pipe to multiple outputs!
setopt MULTIOS
# This makes cd=pushd
setopt AUTO_PUSHD
# This will use named dirs when possible
setopt AUTO_NAME_DIRS
# blank pushd goes to home
setopt PUSHD_TO_HOME
# 10 second wait if you do something that will delete everything
setopt RM_STAR_WAIT
# Avoid the shell to exit when typing <C-d>
setopt IGNORE_EOF
# NO_CLOBBER prevents you from accidentally overwriting an existing file.
setopt noclobber
# it's like, space AND completion
bindkey -M viins ' ' magic-space
# accept autosuggestion
bindkey '^ ' autosuggest-accept

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]="\e[1~"
key[End]="\e[4~"
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Page up
bindkey "^[[5~" history-beginning-search-backward
# Page down
bindkey "^[[6~" history-beginning-search-forward

bindkey '^r' history-beginning-search-backward
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
