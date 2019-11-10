#
# zsh prompt
#

setopt prompt_subst
autoload -Uz colors && colors


function _prompt_user() {
    echo -n "%F{8}%n%F{reset} "
}


function _prompt_date() {
    echo -n "%F{8}%D{%H:%M:%S}%F{reset} "
}


function _prompt_pwd() {
    echo -n "%F{12}%~%F{reset} "
}


function _prompt_git() {
    repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
    if [ "$repo" ]; then
        branch=$(git symbolic-ref -q HEAD)
        branch=${branch##refs/heads/}
        branch=${branch:-HEAD}

        if git diff-index --quiet HEAD -- ; then
            # no changes
            echo -n "→ %F{10}$branch%F{reset} "
        else
            # changes
            echo -n "→ %F{9}$branch%F{reset} "
        fi
    fi
}


# prompt:
#   (user)(pwd)(git) >
#
function _prompt_setup() { 
    STATUS='%(?:%F{10}:%F{9})•%F{reset}'
    PROMPT='$(_prompt_user)$(_prompt_pwd)$(_prompt_git)${STATUS} '
}


_prompt_setup "$@"
