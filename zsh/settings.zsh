#
# zsh settings
#

# use emacs bindings
bindkey -e

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# history options
HISTSIZE=1000
SAVEHIST=1000

if [ ! -d $HOME/.history ]; then
    mkdir $HOME/.history;
fi
HISTFILE=$HOME/.history/.zsh_history

setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt share_history
setopt extended_history
setopt inc_append_history

# no bell
unsetopt beep
unsetopt hist_beep
unsetopt list_beep

# miscellaneous options
setopt autocd
setopt interactive_comments
