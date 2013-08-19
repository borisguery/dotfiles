# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="powerline"
#ZSH_THEME="agnoster"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump git git-extras brew compleat composer last-working-dir osx per-directory-history vagrant)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/completions.zsh
source ~/.zsh/keyboard.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/misc.zsh

#source ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Customize to your needs...
export PATH=~/bin:$(brew --prefix vim)/bin:$(brew --prefix josegonzalez/php/php54)/bin:/usr/local/share/npm/bin/:~/Library/Python/2.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export ANDROID_SDK=/usr/local/Cellar/android-sdk/r21.1
export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/r21.1
