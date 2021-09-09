# Makes ranger cd into the current directory on exit:
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias v=vim
alias p=python3

alias lat='dict -d fd-lat-eng'
alias eng='dict -d fd-eng-lat'

alias genp='openssl rand -base64 12'

alias shutdown='sudo shutdown now'
alias reboot='sudo reboot'

alias us='setxkbmap us'
alias se='setxkbmap se'

# Pipe fzf std to vim
alias ed='fzf | xargs -r vim --not-a-term'

# Redshift
alias rson='redshift -O 2500'
alias rsoff='redshift -x'

# Get external ip
alias ipe='curl ipinfo.io/ip'

# Colorize commands when possible
alias \
    ls="ls -hH --color=auto --group-directories-first" \
    grep="grep --color=auto" \
    diff="diff --color=auto"

