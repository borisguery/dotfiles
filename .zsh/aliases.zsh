alias l="ls -Alh"
alias ll="ls -Alh"
alias ping="ping -c 5"      # Pings with 5 packets, not unlimited
alias df="df -h"            # Disk free, in gigabytes, not bytes
alias du="du -h -c"         # Calculate total disk usage for a folder
alias rm="rmtrash"
alias vi="vim"
alias c="pygmentize -g"

alias standiff="git diff --name-only origin/develop | xargs -I {} vendor/bin/phpstan analyse --error-format=raw -l 2 {}"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
