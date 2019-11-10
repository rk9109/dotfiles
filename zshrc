#
# zshrc
#

# exit non-interactive shells
if [[ $- != *i* ]] ; then
    return
fi

# profile startup
PROFILE_STARTUP=true
if [[ "$PROFILE_STARTUP" == true ]] ; then
    zmodload zsh/zprof
    alias zprof="zprof | less"
fi

# prompt
source ~/.zsh/prompt.zsh

# source zsh settings
source ~/.zsh/settings.zsh

# source sh settings
source ~/.sh/aliases
source ~/.sh/env
source ~/.sh/functions

# setup plugins
source ~/.zsh/plugins.zsh

# TODO setup completions
#source ~/.zsh/completions.zsh

# custom dircolors
eval "$(dircolors -p | sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | dircolors /dev/stdin)"
