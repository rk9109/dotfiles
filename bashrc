#
# bashrc
#

# exit non-interactive shells
if [[ $- != *i* ]] ; then
    return
fi

# prompt
source ~/.bash/prompt.bash

# source bash settings
source ~/.bash/settings.bash

# source sh settings
source ~/.sh/aliases
source ~/.sh/env
source ~/.sh/functions

# custom dircolors
eval "$(dircolors -p | sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | dircolors /dev/stdin)"
