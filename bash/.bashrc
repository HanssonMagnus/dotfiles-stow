###################################################################################
# ~/.bashrc — interactive shells only
###################################################################################
case $- in *i*) ;; *) return ;; esac


###################################################################################
# History
###################################################################################
shopt -s histappend cmdhist checkwinsize
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=200000
HISTFILESIZE=400000
HISTTIMEFORMAT='%F %T '


###################################################################################
# lesspipe (makes less more capable and transparent)
###################################################################################
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


###################################################################################
# Color setup for ls/grep/etc
###################################################################################
if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b ~/.dircolors 2>/dev/null || dircolors -b)"
fi


###################################################################################
# Import Aliases
###################################################################################
[ -f ~/.bash_aliases ] && . ~/.bash_aliases


###################################################################################
# Programmable completion (smart tab completion)
###################################################################################
if ! shopt -oq posix; then
  if [ -r /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -r /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



###################################################################################
# Editing mode (vim)
###################################################################################
set -o vi


###################################################################################
# Elapsed time since last prompt
# We later add __cmd_timer_start and __cmd_timer_print to PROMPT_COMMAND
###################################################################################
# Initialize timer baseline for prompt timing
__CMD_START=$SECONDS

# Elapsed time since last prompt
__cmd_timer_start() { __CMD_START=$SECONDS; }
__cmd_timer_print() {
  local start=${__CMD_START:-$SECONDS}
  local dur=$((SECONDS - start))
  (( dur < 2 )) && return
  local h=$((dur/3600)) m=$(((dur%3600)/60)) s=$((dur%60)) label=""
  ((h>0)) && label+="${h}h"
  ((m>0)) && label+="${m}m"
  label+="${s}s"
  printf '\e[90m→ %s\e[0m\n' "$label"
}


###################################################################################
# fzf + autojump + j helper
###################################################################################
[ -f ~/.fzf.bash ] && . ~/.fzf.bash
[ -s /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh

j() {
  if [[ $# -gt 0 ]]; then
    cd "$(autojump "$@")" || return
    return
  fi
  local dest
  dest=$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { printf "%s%s", $i, (i<NF?" ":"\n") } }' \
        | fzf --height 40% --reverse --inline-info)
  [[ -n "$dest" ]] && cd "$dest"
}


###################################################################################
# Editor and PATH
###################################################################################
export VISUAL=nvim
export EDITOR=nvim

_add_path() {
  [ -z "$1" ] && return
  # add if dir exists or file is executable, and not already present
  { [ -d "$1" ] || [ -x "$1" ]; } && case ":$PATH:" in *":$1:"*) ;; *) PATH="$1:$PATH";; esac
}

_add_path /usr/local/go/bin
_add_path /media/m2_4tb/trueblocks/trueblocks-core/bin
_add_path /usr/local/bin/bundle

# >>> juliaup initialize >>>
# !! Contents within this block are managed by juliaup !!
case ":$PATH:" in
    *:/home/magnus/.juliaup/bin:*) ;;
    *) PATH=/home/magnus/.juliaup/bin${PATH:+:${PATH}} ;;
esac
# <<< juliaup initialize <<<

export PATH


###################################################################################
# Git branch funciton, the variable is later used in PS1
###################################################################################
# Define __GIT_PROMPT to avoid any weird edge cases
__GIT_PROMPT=""

# Compute git branch once per prompt and store in $__GIT_PROMPT
__update_git_prompt() {
  __GIT_PROMPT=""

  command git rev-parse --is-inside-work-tree &>/dev/null || return 0

  local b
  b=$(command git branch --show-current 2>/dev/null)

  if [[ -z "$b" ]]; then
    b=$(command git rev-parse --short HEAD 2>/dev/null || true)
  fi

  [[ -n "$b" ]] && __GIT_PROMPT=" ($b)"
}

###################################################################################
# Update PROMPT_COMMAND
###################################################################################
# Bash runs all commands in the variable PROMPT_COMMAND before drawing a prompt, and the
# commands can either be in an array (Bash 4.4+) or in a string separated by ;
# (traditional way). The old-school Bash way is still standard and that is what autojump
# uses in /usr/share/autojump/autojump.bash so I'll do the same, otherwise
# $PROMPT_COMMAND won't work.
#
# String-based PROMPT_COMMAND (compatible with autojump), adds new variable with ;
# Inspect it in the CLI with: declare -p PROMPT_COMMAND
__prompt_hook() {
  __cmd_timer_print # Variable Used in "Elapsed time since last prompt" above
  __cmd_timer_start # Variable Used in "Elapsed time since last prompt" above
  __update_git_prompt # Code above to display git branch in PS1
}

# Update PROMPT_COMMAND
PROMPT_COMMAND="__prompt_hook${PROMPT_COMMAND:+; $PROMPT_COMMAND}"


###################################################################################
# Prompt
###################################################################################
# Title + your colored PS1 in one place
PS1='\[\e]0;\u@\h: \w\a\]\[\e[35m\]\A \[\e[0m\]\[\e[31m\][\[\e[33m\]\u\[\e[0m\]\[\e[32m\]@\[\e[34m\]\h\[\e[0m\]\[\e[36m\]\w${__GIT_PROMPT}\[\e[31m\]]\[\e[0m\] '


###################################################################################
# Trudy secrets / env
###################################################################################
[ -f ~/API_KEYS/receptiviti.env ] && . ~/API_KEYS/receptiviti.env
[ -f ~/API_KEYS/shopkeeper.env ]   && . ~/API_KEYS/shopkeeper.env
[ -f ~/API_KEYS/llms.env ]         && . ~/API_KEYS/llms.env
[ -f ~/API_KEYS/insight_iq.env ]   && . ~/API_KEYS/insight_iq.env

