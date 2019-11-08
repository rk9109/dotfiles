#
# bash prompt
#

# color constants
RESET="\[\033[0m\]"

BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
BLUE="\[\033[0;34m\]"
WHITE="\[\033[0;37m\]"

BBLACK="\[\033[1;30m\]"
BRED="\[\033[1;31m\]"
BBLUE="\[\033[1;34m\]"
BWHITE="\[\033[1;37m\]"


function _prompt_user() {
    echo -n "$BBLACK\u$RESET"
}


function _prompt_date() {
    echo -n "$BBLACK$(date +%H:%M:%S)$RESET"
}


function _prompt_pwd() {
    echo -n "$BBLUE\w$RESET"
}


function _prompt_git() {
    repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
    if [ "$repo" ]; then
        branch=$(git symbolic-ref -q HEAD)
        branch=${branch##refs/heads/}
        branch=${branch:-HEAD}

        if git diff-index --quiet HEAD -- ; then
            # no changes
            echo -n "→ $BWHITE$branch$RESET "
        else
            # changes
            echo -n "→ $BRED$branch$RESET "
        fi
    fi
}

# prompt:
#   (user)(pwd)(git) >
#
function _prompt() {
    PS1="$(_prompt_user) $(_prompt_pwd) $(_prompt_git)• "
}


# minimal prompt:
#   (user)(pwd) >
#
function _prompt_minimal() {
    PS1="$BBLACK\u $BBLUE\w $RESET• "
}


PROMPT_COMMAND="_prompt; $PROMPT_COMMAND"
