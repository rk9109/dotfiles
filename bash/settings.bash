#
# bash settings
#

# history settings
shopt -s histappend
shopt -s cmdhist

HISTSIZE=1000
HISTFILESIZE=10000
SAVEHIST=$HISTSIZE
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg'

# update history after each command
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# histfile location
if [ ! -d $HOME/.history ]; then
    mkdir $HOME/.history;
fi
HISTFILE="$HOME/.history/.bash_history"

# miscellaneous settings
shopt -s autocd
shopt -s globstar
shopt -s dotglob
shopt -s cdspell
shopt -s checkwinsize

# lesspipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# start history
set -o history
