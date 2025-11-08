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
# Prompt
###################################################################################
# Git branch, safe on detached HEAD, empty outside repos
_git_branch() {
  local b
  b=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return 0
  [ "$b" != "HEAD" ] && printf ' (%s)' "$b"
}

# Title + your colored PS1 in one place
PS1='\[\e]0;\u@\h: \w\a\]\[\e[35m\]\A \[\e[0m\]\[\e[31m\][\[\e[33m\]\u\[\e[0m\]\[\e[32m\]@\[\e[34m\]\h\[\e[0m\]\[\e[36m\]\w$(_git_branch)\[\e[31m\]]\[\e[0m\] '


###################################################################################
# Editing mode (vim)
###################################################################################
set -o vi


###################################################################################
# Elapsed time since last prompt
###################################################################################
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

# Append to PROMPT_COMMAND without clobbering others
if declare -p PROMPT_COMMAND 2>/dev/null | grep -q 'declare \-a PROMPT_COMMAND'; then
  PROMPT_COMMAND+=(__cmd_timer_print __cmd_timer_start)
else
  if [ -n "${PROMPT_COMMAND:-}" ]; then
    PROMPT_COMMAND=( "$PROMPT_COMMAND" __cmd_timer_print __cmd_timer_start )
  else
    PROMPT_COMMAND=( __cmd_timer_print __cmd_timer_start )
  fi
fi


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
  [ -n "$dest" ] && cd "$dest"
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
# Trudy secrets / env
###################################################################################
[ -f ~/API_KEYS/receptiviti.env ] && . ~/API_KEYS/receptiviti.env
[ -f ~/API_KEYS/shopkeeper.env ]   && . ~/API_KEYS/shopkeeper.env
[ -f ~/API_KEYS/llms.env ]         && . ~/API_KEYS/llms.env
[ -f ~/API_KEYS/insight_iq.env ]   && . ~/API_KEYS/insight_iq.env

