#
# zsh plugins
#

# install zinit
if [[ ! -d ~/.zinit ]]; then
    mkdir $HOME/.zinit
    git clone https://github.com/zdharma/zinit.git $HOME/.zinit/bin
    # prevent error:
    #   "zsh compinit: insecure directories"
    sudo chown -R rinik:root $HOME/.zinit
    sudo chmod -R 755 $HOME/.zinit
fi
source $HOME/.zinit/bin/zinit.zsh


# regenerate .zcompdump periodically
function bettercompinit() {
	autoload -Uz compinit
	_comp_file=($HOME/.zcompdump(Nm-20))
	if (( $#_comp_file )); then
	  compinit -i -C
	else
	  compinit -i
	fi
	unset _comp_file
}


# load plugins
zinit ice wait'0a' lucid
zinit load zsh-users/zsh-autosuggestions

zinit ice wait'0b' lucid atinit"bettercompinit"
zinit load zsh-users/zsh-syntax-highlighting

#
# plugin configuration
#

# zsh-autosuggestions
ZSH_AUTOSUGGEST_USE_ASYNC=1
bindkey '^ ' autosuggest-accept
