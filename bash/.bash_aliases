
###################################################################################
# Editors & REPLs
###################################################################################
alias v='nvim'
alias p='python3'
# If you want vim to open nvim too:
# alias vim='nvim'


###################################################################################
# Navigation helpers (ranger, fzf -> $EDITOR)
###################################################################################
# Ranger: cd back to the chosen dir (handles spaces)
r() {
  ranger --choosedir="$HOME/.rangerdir"
  if [ -f "$HOME/.rangerdir" ]; then
    read -r LASTDIR < "$HOME/.rangerdir"
    [ -d "$LASTDIR" ] && cd "$LASTDIR"
  fi
}

# Fuzzy-pick a file into $EDITOR (handles spaces, works with vim/nvim)
ed() {
  local pick
  pick=$(fzf) || return
  [ -z "$pick" ] && return
  "${EDITOR:-nvim}" "$pick"
}


###################################################################################
# Dictionaries (dictd)
###################################################################################
alias lat='dict -d fd-lat-eng'
alias eng='dict -d fd-eng-lat'


###################################################################################
# Secrets & tokens
###################################################################################
# genp [length] -> base64 secret (default 32)
genp() { LC_ALL=C openssl rand -base64 "${1:-32}" | tr -d '\n'; echo; }


###################################################################################
# System power (guarded)
###################################################################################
shutdown() { read -rp "Shutdown now? [y/N] " a; [[ $a =~ ^[Yy]$ ]] && sudo shutdown now; }
reboot()   { read -rp "Reboot now?   [y/N] " a; [[ $a =~ ^[Yy]$ ]] && sudo reboot; }


###################################################################################
# Keyboard layouts (X)
###################################################################################
alias us='setxkbmap -layout us -variant altgr-intl'
alias se='setxkbmap se'


###################################################################################
# i3 / X resources
###################################################################################
alias i3r='i3-msg restart'
alias xr='xrdb ~/.Xresources'


###################################################################################
# Display / color temperature
###################################################################################
alias rson='redshift -O 2500'
alias rsoff='redshift -x'


###################################################################################
# Networking
###################################################################################
alias ipe='curl -fsS --max-time 3 https://ipinfo.io/ip'


###################################################################################
# Git / GitHub CLI
###################################################################################
alias copilot='gh copilot'


###################################################################################
# SSH shortcuts  (consider ~/.ssh/config instead)
###################################################################################
alias euler='ssh magnus@10.0.0.2'
# Better: put this in ~/.ssh/config and just `ssh euler`
# Host euler
#   HostName 10.0.0.2
#   User magnus


###################################################################################
# Colorized core tools
###################################################################################
alias ls='ls -hH --color=auto --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

