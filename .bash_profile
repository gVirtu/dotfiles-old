PAINT_BLACK='\033[00;30m'
PAINT_RED='\033[00;31m'
PAINT_GREEN='\033[01;32m'
PAINT_BROWN='\033[00;33m'
PAINT_BLUE='\033[01;34m'
PAINT_PURPLE='\033[00;35m'
PAINT_CYAN='\033[01;36m'
END_COLOR="\033[00m"

parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="$PAINT_GREEN\u@\h$END_COLOR in $PAINT_CYAN\W$END_COLOR$PAINT_PURPLE\$(parse_git_branch)$END_COLOR\n\$ " #PROMPT

own() {
        USER=$(/usr/bin/id -run)
        sudo chown -R $USER:$USER $1
}

complete -F _git g

alias g="git"
alias up="docker-compose up -d"
