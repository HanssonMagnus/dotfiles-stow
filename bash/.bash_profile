#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

###################################################################################
# Paths to scripts and programs. (Import to end with $PATH to not overwrite).
###################################################################################
export PATH="$HOME/bin:$PATH"
#export PATH="$HOME/.local/bin:$PATH"

# Export editor
export EDITOR="nvim"
. "$HOME/.cargo/env"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/magnus/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/magnus/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
