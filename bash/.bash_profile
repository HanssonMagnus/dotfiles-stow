#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

###################################################################################
# Paths to scripts and programs. (Import to end with $PATH to not overwrite).
###################################################################################
export PATH="$HOME/bin:$PATH"
#export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/media/m2_4tb/trueblocks/trueblocks-core/bin:$PATH"

# Export editor
export EDITOR="nvim"
. "$HOME/.cargo/env"
