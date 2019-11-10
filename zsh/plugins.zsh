#
# zsh plugins
#

# install zplugin
if [[ ! -d ~/.zplugin ]]; then
    mkdir $HOME/.zplugin
    git clone https://github.com/zdharma/zplugin.git $HOME/.zplugin/bin
    # prevent error:
    #   "zsh compinit: insecure directories"
    sudo chown -R rinik:root $HOME/.zplugin
    sudo chmod -R 755 $HOME/.zplugin
fi
source $HOME/.zplugin/bin/zplugin.zsh


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
zplugin ice wait'0a' lucid
zplugin load zsh-users/zsh-autosuggestions

zplugin ice wait'0b' lucid atinit"bettercompinit"
zplugin load zsh-users/zsh-syntax-highlighting

#
# plugin configuration
#

# zsh-autosuggestions
ZSH_AUTOSUGGEST_USE_ASYNC=1
bindkey '^ ' autosuggest-accept
