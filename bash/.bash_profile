#
# ~/.bash_profile
#


###################################################################################
# ~/.bash_profile — executed for login shells
###################################################################################

# Load interactive shell config
[[ -f ~/.bashrc ]] && . ~/.bashrc


###################################################################################
# Paths to scripts and programs
###################################################################################
export PATH="$HOME/bin:$PATH"
export PATH="/home/magnus/Trudy/git/trudy-cli:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/media/m2_4tb/trueblocks/trueblocks-core/bin:$PATH"
export PATH="$PATH:/var/lib/flatpak/exports/bin"


###################################################################################
# Environment variables
###################################################################################
export EDITOR="nvim"
. "$HOME/.cargo/env"


###################################################################################
# Juliaup (managed block)
###################################################################################
# >>> juliaup initialize >>>
# !! Contents within this block are managed by juliaup !!
case ":$PATH:" in
    *:/home/magnus/.juliaup/bin:*) ;;
    *) export PATH=/home/magnus/.juliaup/bin${PATH:+:${PATH}} ;;
esac
# <<< juliaup initialize <<<


###################################################################################
# Google Cloud SDK
###################################################################################
if [ -f '/home/magnus/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/home/magnus/Downloads/google-cloud-sdk/path.bash.inc'; fi
if [ -f '/home/magnus/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/home/magnus/Downloads/google-cloud-sdk/completion.bash.inc'; fi
